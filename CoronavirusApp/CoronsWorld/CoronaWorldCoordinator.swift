//
//  CoronaWorldCoordinator.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 13/08/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class CoronaWorldCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func star() {
        let storyboard = UIStoryboard(name: "CoronaWord", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CoronaWorldTableViewController") as? CoronaWorldTableViewController
        vc?.coordinator = self
        navigationController.pushViewController(vc ?? CoronaWorldTableViewController(), animated: true)
    }
    
    func getElement(contry:  Country){
        let childCoordinator = DetailWorldCoordinator(navigationController: navigationController, country: contry)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.star()
    }
    
    
}
