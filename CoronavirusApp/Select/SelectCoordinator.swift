//
//  SelectCoordinator.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 12/08/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class SelectCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func star() {
        let storyboard = UIStoryboard(name: "Select", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SelectViewController") as? SelectViewController
        navigationController.pushViewController(vc ?? SelectViewController(), animated: false)
    }
    
    
}

