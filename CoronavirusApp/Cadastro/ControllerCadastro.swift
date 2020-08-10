//
//  ControllerCadastro.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 07/08/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation
import Firebase

class ControllerCadastro {
    
    var auth = Auth.auth()
    
    func login(email: String, passaword: String, view: UIViewController, completion: @escaping (Bool) -> Void ) {
        auth.signIn(withEmail: email, password: passaword) { [weak self](result, error) in
            guard self != nil else{return}
            if let error = error {
                print(error)
                Alert.alert(title: "Error", message: "Senha ou E-mail incorretos", view: view, titleBTN: "Cancelar")
            } else {
                print("criado com sucesso")
                completion(true)
            }
        }
    }
    
    func cadastro(email: String, passaword: String, view: UIViewController, completion: @escaping (Bool) -> Void ){
        auth.createUser(withEmail: email , password: passaword) { [weak self] (result, error) in
            guard self != nil else{return}
            if let error = error {
                print(error)
                Alert.alert(title: "Error", message: "Não foi possível realizar seu cadastro", view: view, titleBTN: "Cancelar")
            } else {
                print("criado com sucesso")
                completion(true)
            }
            
        }
    }
}
