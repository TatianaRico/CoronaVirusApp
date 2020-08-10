//
//  CoronaWorldTableViewCell.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 25/06/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class CoronaWorldTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var contryLb: UILabel!
    
    // MARK: Methods
    func setup(corona: Country) {
        contryLb.text = corona.country
    }
}
