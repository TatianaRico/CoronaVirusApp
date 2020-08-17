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
         navigationController.navigationBar.isHidden = false
    }
    deinit {
        print("SelectCoordinator deinit")
    }
    
    func star() {
        let storyboard = UIStoryboard(name: "Select", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SelectViewController") as? SelectViewController
        vc?.coordinator = self
        navigationController.pushViewController(vc ?? SelectViewController(), animated: false)
    }
    
    func goCoronaBrasil() {
        let childCoordinator = CoronoBrCoordinator(navigationController: navigationController)
                      childCoordinator.parentCoordinator = self
                      add(childCoordinator: childCoordinator)
                      childCoordinator.star()
    }
    
    func goCoronaWorld() {
        let childCoordinator = CoronaWorldCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.star()
    }
    
    func childDidFinish(_ child: Coordinator) {
          parentCoordinator?.childDidFinish(self)
    }
}

