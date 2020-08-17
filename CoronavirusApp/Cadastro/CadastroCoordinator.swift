//
//  CadastroCoordinator.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 13/08/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class CadastroCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = true
    }
    
    func star() {
        let storyboard = UIStoryboard(name: "Cadastro", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "CadastroViewController") as? CadastroViewController
        vc?.coordinator = self
        navigationController.pushViewController(vc ?? CadastroViewController(), animated: false)
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
