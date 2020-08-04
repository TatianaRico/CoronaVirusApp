//
//  RequestAPiWorld.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 25/06/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation

class RequestApiWorld {
    
    // MARK: - Properties
    let baseURL: String = "https://api.covid19api.com/summary"
    
    static let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = true
        configuration.timeoutIntervalForRequest = 40
        
        return configuration
    }()
    let session = URLSession(configuration: configuration)
    
    // MARK: Methods
    func request(completion: @escaping ([Country]?, Bool) -> Void) {
        
        guard let url = URL(string: baseURL) else{return}
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard let response = response as? HTTPURLResponse else{return}
            guard let data = data else{return}
            
            if response.statusCode == 200 {
                do {
                    let json = try JSONDecoder.init().decode(CoronaWorldModel.self, from: data)
                    print(json)
                    DispatchQueue.main.async {
                        completion(json.countries, true)
                    }
                }catch{
                    completion(nil, false)
                }
            } else{
                completion(nil, false)
            }
        }
        task.resume()
    }
}
