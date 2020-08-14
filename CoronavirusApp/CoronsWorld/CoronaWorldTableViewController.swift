//
//  CoronaWorldTableViewController.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 25/06/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class CoronaWorldTableViewController: UITableViewController {
    
    // MARK: - Properties
    private var controller = CoronaWorldController()
     weak var coordinator: CoronaWorldCoordinator?
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.getApi { [weak self](sucess) in
            guard let self = self else {return}
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
        
        let elemContry = controller.cellForRow(indexPath: indexPath)
        coordinator?.getElement(contry: elemContry)
    }
}

