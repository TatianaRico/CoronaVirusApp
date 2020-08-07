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
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView()
        configLoginBtn()
    }
    
    // MARK: IBActions
    @IBAction func singUpBtn(_ sender: UIButton) {
        auth.signIn(withEmail: emailTextField.text ?? "", password: passwordTextField.text ?? "") { [weak self](result, error) in
            guard let self = self else{return}
            if let error = error {
                print(error)
                Alert.alert(title: "Error", message: "Senha ou E-mail incorretos", view: self, titleBTN: "Cancelar")
            } else {
                print("criado com sucesso")
                guard let vc  = self.storyboard?.instantiateViewController(identifier: "SelectViewController") as? SelectViewController else{return}
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func cadastroBtn(_ sender: UIButton) {
        auth.createUser(withEmail: emailTextField.text ?? "", password: passwordTextField.text ?? "") { [weak self] (result, error) in
            guard let self = self else{return}
            if let error = error {
                print(error)
                Alert.alert(title: "Error", message: "Não foi possível realizar seu cadastro", view: self, titleBTN: "Cancelar")
            } else {
                print("criado com sucesso")
                guard let vc  =
                    self.storyboard?.instantiateViewController(identifier: "SelectViewController") as? SelectViewController else{return}
                self.navigationController?.pushViewController(vc, animated: true)
            }
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
