//
//  CoronaWorldTableViewController.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 25/06/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class CoronaWorldTableViewController: UITableViewController {
    
    var controller = CoronaWorldController()

    override func viewDidLoad() {
        super.viewDidLoad()
        controller.getApi { (sucess) in
            self.tableView.reloadData()
        }
    }
   
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.numberOfRow()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CoronaWorldTableViewCell

        cell?.setup(corona: controller.cellForRow(indexPath: indexPath))
        

        return cell ?? CoronaWorldTableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "CoronaWorldDetailViewController")  as? CoronaWorldDetailViewController {
            
            vc.model = controller.cellForRow(indexPath: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
    }
}
