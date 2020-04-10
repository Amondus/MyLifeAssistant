//
//  AuthFlowCoordinator.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 08.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

final class AuthFlowCoordinator: BaseCoordinator, AuthFlowCoordinatorOutput {
    var finishFlow: (() -> Void)?
    
    private let factory: AuthFlowFactory
    private let router: Router
    
    init(router: Router, factory: AuthFlowFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showLogin()
    }
    
    // MARK: - Run current flow's controllers
    private func showLogin() {
        let controller = factory.makeLoginOutput()
        
        controller.onSignIn = { [weak self] in
            self?.showSignIn()
        }
        
        controller.onSignUp = { [weak self] in
            self?.showSignUp()
        }
        
        router.setRootModule(controller)
    }
    
    private func showSignIn() {
        let controller = factory.makeSignInOutput()
        
        controller.onFinishSignIn = { [weak self] in
            self?.finishFlow?()
        }
        
        controller.onForgotPassword = { [weak self] in
            self?.showForgotPassword()
        }
        
        router.push(controller)
    }
    
    private func showSignUp() {
        let controller = factory.makeSignUpOutput()
        
        controller.onFinishSignUp = { [weak self] in
            self?.finishFlow?()
        }
        
        controller.onForgotPassword = { [weak self] in
            self?.showForgotPassword()
        }
        
        router.push(controller)
    }
    
    private func showForgotPassword() {
        let controller = factory.makeForgotPasswordOutput()
        
        router.present(controller)
    }
}
