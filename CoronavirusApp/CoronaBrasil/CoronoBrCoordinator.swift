//
//  CoronoBrCoordinator.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 13/08/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class CoronoBrCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = false
    }
    
    func star() {
        let storyBoard = UIStoryboard(name: "CoronaBrasil", bundle: nil)
        let vc  = storyBoard.instantiateViewController(withIdentifier: "CoronaTableViewController") as? CoronaTableViewController
        vc?.coordinator = self
        navigationController.pushViewController(vc ?? CoronaTableViewController(), animated: true)
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
