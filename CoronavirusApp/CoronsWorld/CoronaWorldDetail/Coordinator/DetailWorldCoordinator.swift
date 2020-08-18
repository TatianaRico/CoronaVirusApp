//
//  DetailWorldCoordinator.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 17/08/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class DetailWorldCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var country: Country
    
    init(navigationController: UINavigationController, country: Country) {
        self.navigationController = navigationController
        self.country = country
    }
    
    func star() {
        let vc = CoronaWorldDetailViewController.instantiateFromStoryBoard(.detailWorld)
        vc.coordinator = self
        vc.model = self.country
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goMap(country: String){
        let childCoordinator = MapCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.star()
    }
    
    func childDidFinish(_ child: Coordinator) {
        parentCoordinator?.childDidFinish(child)
    }
}
