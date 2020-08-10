//
//  RequestAPIMap.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 07/07/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation

class RequestAPIMap {
    
    // MARK: - Properties
    private let baseURl: String =  "https://api.covid19api.com/"
    
    static let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = true
        configuration.timeoutIntervalForRequest = 40
        return configuration
    }()
    
    private let session = URLSession(configuration: configuration)
    
    // MARK: Methods
    func request(country: String, completion: @escaping ([ApiMap]?, Bool)-> Void) {
        
        guard let url = URL(string: baseURl.appending("dayone/country/\(country)/status/confirmed")) else{return}
        
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else{return}
            guard let response = response as? HTTPURLResponse else{return}
            do {
                if response.statusCode == 200 {
                    let json = try JSONDecoder().decode([ApiMap].self, from: data)
                    DispatchQueue.main.async {
                        completion(json, true)
                    }
                }else{
                    completion(nil, false)
                }
            }catch{
                completion(nil, false)
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
