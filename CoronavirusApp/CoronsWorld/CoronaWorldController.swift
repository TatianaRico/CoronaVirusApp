//
//  CoronaWorldController.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 25/06/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation

class CoronaWorldController {
    
    // MARK: - Properties
   private let controller = RequestApiWorld()
    var model: [Country]?
    
    // MARK: Methods
    func getApi(completion: @escaping (Bool)-> Void) {
        controller.request { [weak self] (contry, success) in
             guard let self = self else {return}
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
