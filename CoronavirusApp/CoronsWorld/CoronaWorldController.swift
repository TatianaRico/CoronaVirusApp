//
//  CoronaWorldController.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 25/06/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation

class CoronaWorldController {
    
    let request = RequestApiWorld()
    var model: [Country]?
    
    func getApi(completion: @escaping (Bool)-> Void) {
        request.request { (contry, success) in
            if success {
                self.model = contry
                completion(true)
            }
        }
    }
    
    func numberOfRow() -> Int {
        return model?.count ?? 0
    }
    
    func cellForRow(indexPath: IndexPath) -> Country {
        return model?[indexPath.row] ?? Country(country: "", countryCode: "", slug: "", newConfirmed: 0, totalConfirmed: 0, newDeaths: 0, totalDeaths: 0, newRecovered: 0, totalRecovered: 0, date: "")
    }
}
