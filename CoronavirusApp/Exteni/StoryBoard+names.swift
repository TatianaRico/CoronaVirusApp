//
//  StoryBoard+names.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 18/08/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static var brasil: UIStoryboard {
        return UIStoryboard(name: "CoronaBrasil", bundle: nil)
    }
    
    static var detailBr: UIStoryboard {
        return UIStoryboard(name: "CoronaDetail", bundle: nil)
    }
    
    static var world: UIStoryboard {
        return UIStoryboard(name: "CoronaWorld", bundle: nil)
    }
    
    static var detailWorld: UIStoryboard {
        return UIStoryboard(name: "DetailWorld", bundle: nil)
    }
    
    static var map: UIStoryboard {
        return UIStoryboard(name: "Map", bundle: nil)
    }
    
    static var login: UIStoryboard {
        return UIStoryboard(name: "Cadastro", bundle: nil)
    }
}
