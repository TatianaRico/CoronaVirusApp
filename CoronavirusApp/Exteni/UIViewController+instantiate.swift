//
//  UIViewController+instantiate.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 18/08/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

extension UIViewController {
    
   static func instantiateFromStoryBoard(_ storyboard: UIStoryboard)-> Self {
        let name = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: name) as! Self
    }
}
