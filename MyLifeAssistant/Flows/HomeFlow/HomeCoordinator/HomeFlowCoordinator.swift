//
//  HomeFlowCoordinator.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 22.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

final class HomeFlowCoordinator: BaseCoordinator, HomeFlowCoordinatorOutput {
    var finishFlow: (() -> Void)?
    
    private let router: Router
    private let coordinatorFactory: CoordinatorFactory
    private let factory: HomeFlowFactory
    
    init(router: Router, coordinatorFactory: CoordinatorFactory, factory: HomeFlowFactory) {
        self.factory = factory
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        showHomePage()
    }
    
    // MARK: - Run current flow's controllers
    private func showHomePage() {
        let homePageOutput = factory.makeHomePageOutput()
        router.setRootModule(homePageOutput)
    }
}
