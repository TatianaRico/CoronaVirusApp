//
//  CoronaController.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 15/06/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation

class CoronaController {
    
    var api = ApiRest()
    var model: [Corona]?
    
    func loadCorona(completion: @escaping (Bool) -> Void) {
        api.request {(corona, sucess) in
            if sucess {
                self.model = corona
                completion(true)
            }
        }
    }
    
func numberOfRow() -> Int {
    return model?.count ?? 0
}
    
    func cellForRow(indexPath: IndexPath) -> Corona {
        return model?[indexPath.row] ?? Corona(uid: 0, uf: "", state: "", cases: 0, deaths: 0, suspects: 0, refuses: 0, datetime: .none)
    }
}
