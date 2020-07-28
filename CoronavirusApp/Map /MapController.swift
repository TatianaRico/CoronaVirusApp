//
//  MapController.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 07/07/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation

class MapController {
    
    var modelController: CoronaMapModel?
    
    var request = RequestAPIMap()
    
    
    func getAPIMap() {
        request.request {[weak self](model, sucess) in
            if sucess {
                self?.modelController = model
            }
        }
    }
    
    func latitude() -> Double {
        let latitude =  -23.5489
        return latitude
    }
    func longitude() -> Double {
        let long =  -46.6388
        
           return long
       }
}
