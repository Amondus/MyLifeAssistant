//
//  AuthFlowFactory.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 22.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

protocol AuthFlowFactory {
    func makeLoginOutput() -> AuthorizationView
    func makeSignInOutput() -> SignInView
    func makeSignUpOutput() -> SignUpView
    func makeForgotPasswordOutput() -> ForgotPasswordView
}
