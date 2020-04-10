//
//  AccountFlowCoordinator.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 25.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

final class AccountFlowCoordinator: BaseCoordinator, AccountFlowCoordinatorOutput {
    var finishFlow: (() -> Void)?
    
    private let router: Router
    private let coordinatorFactory: CoordinatorFactory
    private let factory: AccountFlowFactory
    
    init(router: Router, coordinatorFactory: CoordinatorFactory, factory: AccountFlowFactory) {
        self.factory = factory
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        showMyAccount()
    }
    
    // MARK: - Run current flow's controllers
    private func showMyAccount() {
        let myAccountOutput = factory.makeMyAccountOutput()
        router.setRootModule(myAccountOutput)
    }
}
