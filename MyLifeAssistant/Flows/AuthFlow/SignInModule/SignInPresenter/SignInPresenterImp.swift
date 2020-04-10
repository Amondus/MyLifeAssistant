//
//  SignInPresenterImp.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 02.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation
import Firebase

final class SignInPresenterImp {
    
    weak var view: SignInView?
    var state: SignInPresenterState?
    
    init(view: SignInView, state: SignInPresenterState) {
        self.view = view
        self.state = state
    }
    
    func validateFields() -> Bool {
        
        if  state?.email == nil ||
            state?.email == "" ||
            state?.password == nil ||
            state?.password == "" {
            
            self.view?.presentAlert(title: "Ошибка",
                                    message: "Пожалуйста заполните все поля.",
                                    actions: [.init(title: "ОК", style: .default, handler: nil)],
                                    style: .alert)
            
            return false
        } else {
            return true
        }
    }
}

extension SignInPresenterImp: SignInPresenter {
    
    func signInUser() {
        
        if validateFields() == true {
            let email = state?.email ?? ""
            let password = state?.password ?? ""
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                
                if error != nil {
                    self.view?.presentAlert(title: "Ошибка",
                                            message: String("Введен неправильный логин или пароль."),
                                            actions: [.init(title: "ОК", style: .default, handler: nil)],
                                            style: .alert)
                }
                else {
                    self.view?.onFinishSignIn!()
                }
            }
        }
    }
    
    func signInUserWithGoogle(_ credential: AuthCredential) {
        
        Auth.auth().signIn(with: credential) { authResult, error in
            if error != nil {
                self.view?.presentAlert(title: "Ошибка",
                                        message: String(error?.localizedDescription ?? "Ошибка при входе в аккаунт."),
                                        actions: [.init(title: "ОК", style: .default, handler: nil)],
                                        style: .alert)
            }
            else {
                self.view?.onFinishSignIn!()
            }
        }
        
    }
}
