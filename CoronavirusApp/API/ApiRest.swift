//
//  ApiRest.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 30/05/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation

class ApiRest {
    
    // MARK: - Properties
    let basePath: String = "https://covid19-brazil-api.now.sh/api/report/v1"
    static let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.allowsCellularAccess = true
        return configuration
    }()
    
    let session = URLSession(configuration: configuration)
    
    // MARK: Methods
    func  request(completion: @escaping ([Corona]?, Bool)-> Void ) {
        guard let url = URL(string: basePath)  else {return}
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard let response = response as? HTTPURLResponse else {return}
            
            guard let data = data else{return}
            if response.statusCode == 200 {
                do{
                    let json = try JSONDecoder().decode(CoronaModel.self, from: data)
                    print(json)
                    DispatchQueue.main.async {
                        completion(json.data, true)
                    }
                } catch {
                    completion(nil, false)
                }
            } else {
                completion(nil, false)
            }
        }
        task.resume()
    }
}
