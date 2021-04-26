//
//  MapCoordinator.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 13/08/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class MapCoordinator: Coordinator {
    
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
        let vc = MapViewController.instantiateFromStoryBoard(.map)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator) {
        parentCoordinator?.childDidFinish(self)
    }
}
