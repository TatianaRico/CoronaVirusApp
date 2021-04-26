//
//  AppCoordinator.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 12/08/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    // MARK: - Super Methods
    init() {
        navigationController = UINavigationController()
    }
    
    // MARK: Methods
    func star() {
        let childCoordinator = CadastroCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.star()
    }
    
    func childDidFinish(_ child: Coordinator) {
        parentCoordinator?.childDidFinish(self)
    }
}
