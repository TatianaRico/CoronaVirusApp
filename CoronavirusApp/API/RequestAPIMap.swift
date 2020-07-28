//
//  RequestAPIMap.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 07/07/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation

class RequestAPIMap {
    
    let baseURl: String =  "https://api.covid19api.com/dayone/country/south-africa/status/confirmed"
    
    static let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = true
        configuration.timeoutIntervalForRequest = 40
        return configuration
    }()
    
    let session = URLSession(configuration: configuration)
    
    func request(completion: @escaping (CoronaMapModel?, Bool)-> Void) {
        
        guard let url = URL(string: baseURl) else{return}
        
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else{return}
            guard let response = response as? HTTPURLResponse else{return}
            do {
                
                if response.statusCode == 200 {
                    let json = try JSONDecoder.init().decode(CoronaMapModel.self, from: data)
                    DispatchQueue.main.async {
                        completion(json, true)
                    }
                }else{
                    completion(nil, false)
                }
            }catch{
                completion(nil, false)
            }
        }
        task.resume()
    }
}
