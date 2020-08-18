//
//  CoronaWorldCoordinator.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 13/08/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class CoronaWorldCoordinator: Coordinator {
    
    // MARK: - Properties
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    // MARK: - Super Methods
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    // MARK: Methods
    func star() {
        let vc = CoronaWorldTableViewController.instantiateFromStoryBoard(.world)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func getElement(contry:  Country){
        let childCoordinator = DetailWorldCoordinator(navigationController: navigationController, country: contry)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.star()
    }
    
    func childDidFinish(_ child: Coordinator) {
        parentCoordinator?.childDidFinish(self)
    }
}
