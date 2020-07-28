//
//  DetailCoronaViewController.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 16/06/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class DetailCoronaViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stateLb: UILabel!
    @IBOutlet weak var numberCaseLb: UILabel!
    @IBOutlet weak var numberDeathLb: UILabel!
    @IBOutlet weak var numberSuspectLb: UILabel!
    
    var model: Corona?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        stateLb.text = model?.state ?? ""
        numberCaseLb.text = String("Números de casos \(model?.cases ?? 0)")
        numberDeathLb.text = String("Números de mortos \(model?.deaths ?? 0)")
        numberSuspectLb.text = String("Números de suspeitos \(model?.suspects ?? 0)")
    }

}
