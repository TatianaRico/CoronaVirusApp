//
//  AppCoordinator.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 12/08/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    init() {
        navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.backgroundColor = .yellow
    }
    
    func star() {
        let childCoordinator = SelectCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.star()
        
    }
}
