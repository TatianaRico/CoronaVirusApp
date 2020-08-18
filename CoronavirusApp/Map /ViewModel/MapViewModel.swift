//
//  MapController.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 07/07/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation

class MapViewModel {
    
    // MARK: - Properties
    var modelController: [ApiMap]?
    var controller = RequestMapAPI()
    
    // MARK: Methods
    func getMap(country: String, completion: @escaping (Bool) -> Void) {
        controller.requestMap(country: country) {[weak self](model, sucess) in
            if sucess {
                self?.modelController = model
                completion(true)
            }
            completion(false)
        }
    }
    
    func latitudeMap() -> Double {
        let model = modelController?.first
        let latitude = Double(model?.lat ?? "") ?? 0
        return latitude
    }
    
    func longitudeMap() -> Double {
        let model = modelController?.first
        let long =  Double(model?.lon ?? "") ?? 0
        return long
    }
}
