//
//  DetailBrCoordinator.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 13/08/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class DetailBrCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var corona: Corona?
    
    init(navigationController: UINavigationController, corona: Corona) {
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = false
        self.corona = corona
    }
    
    func star() {
        let vc = DetailCoronaViewController.instantiateFromStoryBoard(.detailBr)
        vc.coordinator = self
        vc.model = self.corona
        navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator) {
          parentCoordinator?.childDidFinish(self)
      }
}
