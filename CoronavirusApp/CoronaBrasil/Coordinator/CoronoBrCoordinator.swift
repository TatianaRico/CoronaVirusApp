//
//  CoronoBrCoordinator.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 13/08/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class CoronoBrCoordinator: Coordinator {
    
    // MARK: - Properties
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    // MARK: - Super Methods
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = false
    }
    
    // MARK: Methods
    func star() {
        let vc  = CoronaTableViewController.instantiateFromStoryBoard(.brasil)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goTableView(corona: Corona) {
        let childCoordinator = DetailBrCoordinator(navigationController: navigationController, corona: corona )
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.star()
    }
    
    func childDidFinish(_ child: Coordinator) {
        parentCoordinator?.childDidFinish(self)
    }
}
