//
//  Gradient.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 05/08/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation
import UIKit

class Gradient: UIViewController {
    
    static let gradientLayer = CAGradientLayer()
    
    func gradientF() {
        Gradient.gradientLayer.frame = view.bounds
        Gradient.gradientLayer.colors = [UIColor.blue.cgColor, UIColor.white.cgColor]
        self.view.layer.insertSublayer(Gradient.gradientLayer, at: 0)
    }
  
    

}

