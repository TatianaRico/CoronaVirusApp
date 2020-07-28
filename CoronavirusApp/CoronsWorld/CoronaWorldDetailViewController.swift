//
//  CoronaWorldDetailViewController.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 25/06/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class CoronaWorldDetailViewController: UIViewController {

    @IBOutlet weak var stateLb: UILabel!
    @IBOutlet weak var newConfirmedLb: UILabel!
    @IBOutlet weak var totalConfirmedLb: UILabel!
    @IBOutlet weak var newDeathLb: UILabel!
    @IBOutlet weak var totalDeathLb: UILabel!
    @IBOutlet weak var newRecoveredLb: UILabel!
    @IBOutlet weak var totalRecovered: UILabel!
    
    var model: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        self.stateLb.text = model?.country ?? ""
        self.newConfirmedLb.text = String(model?.newConfirmed ?? 0)
        self.totalConfirmedLb.text = String(model?.totalConfirmed ?? 0)
        self.newDeathLb.text = String(model?.newDeaths ?? 0)
        self.totalDeathLb.text = String(model?.totalDeaths ?? 0)
        self.newRecoveredLb.text = String(model?.newRecovered ?? 0)
        self.totalRecovered.text = String(model?.totalRecovered ?? 0)
    }
    
}
