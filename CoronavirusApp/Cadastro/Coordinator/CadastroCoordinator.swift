//
//  CadastroCoordinator.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 13/08/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class CadastroCoordinator: Coordinator {
    
    // MARK: - IBOutlets
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    // MARK: - Super Methods
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = true
    }
    
    // MARK: Methods
    func star() {
        let vc = CadastroViewController.instantiateFromStoryBoard(.login)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToNewClass() {
        let childCoordinator = SelectCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.star()
    }
    
    func childDidFinish(_ child: Coordinator) {
        parentCoordinator?.childDidFinish(self)
    }
}
