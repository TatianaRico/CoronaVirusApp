//
//  MapController.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 07/07/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation

class MapController {
    
    // MARK: - Properties
    var modelController: [ApiMap]?
    var controller = RequestAPIMap()
    
    // MARK: Methods
    func getAPIMap(country: String, completion: @escaping (Bool) -> Void) {
        controller.request(country: country) {[weak self](model, sucess) in
            if sucess {
                self?.modelController = model
                completion(true)
            }
            completion(false)
        }
    }
    
    func latitude() -> Double {
        let model = modelController?.first
        let latitude = Double(model?.lat ?? "") ?? 0
        return latitude
    }
    
    func longitude() -> Double {
        let model = modelController?.first
        let long =  Double(model?.lon ?? "") ?? 0
        return long
    }
}
