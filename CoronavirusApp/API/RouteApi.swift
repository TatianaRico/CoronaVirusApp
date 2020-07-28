//
//  RouteApi.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 23/06/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation

class RouteApi {
    
    let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = true
        configuration.timeoutIntervalForRequest = 40
        
        return configuration
    }()
    
    let baseURL: String? = nil
    
    func request(url: String, completion: @escaping (Data?, Bool) -> Void) {
        
        let session = URLSession(configuration: configuration)
        guard let url = URL(string: baseURL ?? "") else{return}
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard let response = response as? HTTPURLResponse else{return}
            guard let data = data else{return}
            
            
        }
        task.resume()
    }
}
