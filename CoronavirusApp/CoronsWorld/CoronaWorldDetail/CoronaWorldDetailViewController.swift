//
//  CoronaWorldDetailViewController.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 25/06/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class CoronaWorldDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var stateLb: UILabel!
    @IBOutlet weak var newConfirmedLb: UILabel!
    @IBOutlet weak var totalConfirmedLb: UILabel!
    @IBOutlet weak var newDeathLb: UILabel!
    @IBOutlet weak var totalDeathLb: UILabel!
    @IBOutlet weak var newRecoveredLb: UILabel!
    @IBOutlet weak var totalRecovered: UILabel!
    
    // MARK: - Properties
    var model: Country?
    var coordinator: DetailWorldCoordinator?
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    deinit {
        coordinator?.childDidFinish(coordinator)
        print("CoronaWorldDetailViewController de init")
    }
    
    // MARK: Methods
    func setup() {
        self.stateLb.text = model?.country
        self.newConfirmedLb.text = String("Casos novos Confirmados \(model?.newConfirmed ?? 0)")
        self.totalConfirmedLb.text = String("Total de Casos Confirmados \(model?.totalConfirmed ?? 0)")
        self.newDeathLb.text = String("Novos falecimentos \(model?.newDeaths ?? 0)")
        self.totalDeathLb.text = String("Total de mortes \(model?.totalDeaths ?? 0)")
        self.newRecoveredLb.text = String("Novos casos de recuperação \(model?.newRecovered ?? 0)")
        self.totalRecovered.text = String("Numeros de recuperados \(model?.totalRecovered ?? 0)")
    }
    
    func goToMap()-> String {
        return model?.slug ?? ""
    }
    
    // MARK: IBActions
    @IBAction func goToMapBtn(_ sender: UIButton) {
        coordinator?.goMap(country: goToMap())
    }
}
