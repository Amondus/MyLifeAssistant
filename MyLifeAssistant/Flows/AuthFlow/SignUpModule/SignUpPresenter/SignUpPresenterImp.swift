//
//  SignUpPresenterImp.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 02.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation
import Firebase

final class SignUpPresenterImp {
    
    weak var view: SignUpView?
    var state: SignUpPresenterState?
    
    init(view: SignUpView, state: SignUpPresenterState) {
        self.view = view
        self.state = state
    }
    
    func validateFields() -> Bool {
        
        if  state?.firstName == nil ||
            state?.firstName == "" ||
            state?.lastName == nil ||
            state?.lastName == "" ||
            state?.email == nil ||
            state?.email == "" ||
            state?.password == nil ||
            state?.password == "" {
            view?.presentAlert(title: "Ошибка",
                               message: "Пожалуйста заполните все поля.",
                               actions: [.init(title: "ОК", style: .default, handler: nil)],
                               style: .alert)
            
            return false
        }
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        
        if emailPred.evaluate(with: state?.email) == false {
            view?.presentAlert(title: "Ошибка",
                               message: "Адрес электронной почты имеет неправильный формат.",
                               actions: [.init(title: "ОК", style: .default, handler: nil)],
                               style: .alert)
            return false
        }
        
        let passwordRegex = "^.{6,}$"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        
        if passwordPred.evaluate(with: state?.password) == false {
            view?.presentAlert(title: "Ошибка",
                               message: "Пароль должен состоять из 6 или более символов.",
                               actions: [.init(title: "ОК", style: .default, handler: nil)],
                               style: .alert)
            return false
        }
        
        if state?.password != state?.confirmPassword {
            view?.presentAlert(title: "Ошибка",
                               message: "Введенные пароли не совпадают.",
                               actions: [.init(title: "ОК", style: .default, handler: nil)],
                               style: .alert)
            return false
        }
        return true
    }
}

extension SignUpPresenterImp: SignUpPresenter {
    
    func signUpNewUser() {
        
        if validateFields() == true {
            let firstName = state?.firstName ?? ""
            let lastName = state?.lastName ?? ""
            let email = state?.email ?? ""
            let password = state?.password ?? ""
            
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                
                if error != nil {
                    if error!._code == 17007 {
                    self.view?.presentAlert(title: "Ошибка",
                                            message: "Пользователь с таким адресом электронной почты уже существует.",
                                            actions: [.init(title: "ОК", style: .default, handler: nil)],
                                            style: .alert)
                    } else {
                    self.view?.presentAlert(title: "Ошибка",
                                            message: "Ошибка регистрации нового пользователя.",
                                            actions: [.init(title: "ОК", style: .default, handler: nil)],
                                            style: .alert)
                    }
                } else {
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstName": firstName, "lastName": lastName, "userId": result!.user.uid ]) { error in
                        
                        if error != nil {
                            self.view?.presentAlert(title: "Ошибка",
                                                    message: "Ошибка при создании пользовательских данных",
                                                    actions: [.init(title: "ОК", style: .default, handler: { action in
                                                        self.view?.onFinishSignUp?()
                                                    })],
                                                    style: .alert)
                        } else {
                            self.view?.onFinishSignUp?()
                        }
                    }
                }
                
            }
            
        }
    }
    
}
