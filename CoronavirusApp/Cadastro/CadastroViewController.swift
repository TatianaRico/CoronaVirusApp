 //
 //  CadastroViewController.swift
 //  CoronavirusApp
 //
 //  Created by Tatiana Rico on 08/07/20.
 //  Copyright © 2020 Tatiana Rico. All rights reserved.
 //
 
 import UIKit
 import Firebase
 
 class CadastroViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var cadastroBtn: UIButton!
    //MARK: - Properties
    lazy var auth = Auth.auth()
    var controller = ControllerCadastro()
    weak var coordinator: CadastroCoordinator?
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView()
        configLoginBtn()
    }
    
    // MARK: IBActions
    @IBAction func singUpBtn(_ sender: UIButton) {
        
        controller.login(email: emailTextField.text ?? "", passaword: passwordTextField.text ?? "", view: self) { (result) in
            self.coordinator?.goToNewClass()
        }
    }
    
    @IBAction func cadastroBtn(_ sender: UIButton) {
        
        controller.cadastro(email: emailTextField.text ?? "", passaword: passwordTextField.text ?? "", view: self) { (sucess) in
            self.coordinator?.goToNewClass()
        }
    }
    
    func recuperarEmail() {
    }
    
    func colorView() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.blue.cgColor, UIColor.systemBlue.cgColor]
        gradient.frame = view.bounds
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    func configLoginBtn() {
        loginBtn.layer.cornerRadius = 10
        loginBtn.backgroundColor = .systemOrange
        cadastroBtn.layer.cornerRadius = 10
        cadastroBtn.backgroundColor = .systemOrange
    }
 }
