//
//  SelectViewController.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 19/06/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
    

    var coordinator: SelectCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    
    deinit {
    }
    
    @IBAction func goWorld(_ sender: UIButton) {
        coordinator?.goCoronaWorld()
    }

    @IBAction func goBrasilBtn(_ sender: UIButton) {
        coordinator?.goCoronaBrasil()
    }
}
