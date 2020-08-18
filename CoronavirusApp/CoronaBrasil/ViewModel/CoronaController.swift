//
//  CoronaController.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 15/06/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation

class CoronaController {
    
     // MARK: - Properties
   private var controller = ApiRest()
    var model: [Corona]?
    
    // MARK: Methods
    func loadCorona(completion: @escaping (Bool) -> Void) {
        controller.request {[weak self](corona, sucess) in
            guard let self = self else {return}
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
