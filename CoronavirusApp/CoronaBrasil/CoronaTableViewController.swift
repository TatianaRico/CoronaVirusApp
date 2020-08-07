//
//  CoronaTableViewController.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 31/05/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class CoronaTableViewController: UITableViewController {
    
    // MARK: - Properties
    private var controller = CoronaController()
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller.loadCorona { [weak self](sucess) in
            guard let self = self else {return}
            if sucess {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.numberOfRow()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CoronaTableViewCell
        cell?.setup(corona: controller.cellForRow(indexPath: indexPath))
        return cell ?? CoronaTableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc  = storyboard?.instantiateViewController(identifier: "DetailCoronaViewController") as? DetailCoronaViewController {
            vc.model = controller.cellForRow(indexPath: indexPath)
            present(vc, animated: true, completion: nil)
        }
    }
}

