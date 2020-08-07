//
//  Alert.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 05/08/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class Alert {
    
    // MARK: METHODS
    class func alert(title: String, message: String, view: UIViewController, titleBTN: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let btn = UIAlertAction(title: titleBTN, style: .cancel, handler: nil)
        alert.addAction(btn)
        
       view.present(alert, animated: true, completion: nil)
    }
}
