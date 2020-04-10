//
//  AuthFlowFactoryImp.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 22.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

final class AuthFlowFactoryImp: AuthFlowFactory {
    func makeLoginOutput() -> AuthorizationView {
        return AuthorizationViewController.controllerFromStoryboard(.authorization)
    }
    
    func makeSignInOutput() -> SignInView {
        return SignInViewController.controllerFromStoryboard(.signIn)
    }
    
    func makeSignUpOutput() -> SignUpView {
        return SignUpViewController.controllerFromStoryboard(.signUp)
    }
    
    func makeForgotPasswordOutput() -> ForgotPasswordView {
        return ForgotPasswordViewController.controllerFromStoryboard(.forgotPassword)
    }
}
