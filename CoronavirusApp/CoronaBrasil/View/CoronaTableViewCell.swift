//
//  CoronaTableViewCell.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 31/05/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class CoronaTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameLb: UILabel!
    
    // MARK: - Super Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Methods
    func setup(corona: Corona){
        nameLb.text = corona.state
    }
}
