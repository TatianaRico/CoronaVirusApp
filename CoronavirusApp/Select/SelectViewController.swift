//
//  SelectViewController.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 19/06/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    
    deinit {
    }
    
    @IBAction func goWorld(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "CoronaWorldTableViewController") as? UITableViewController else{return}
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func goBrasilBtn(_ sender: UIButton) {
  
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "CoronaTableViewController") as? UITableViewController else{return}
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
