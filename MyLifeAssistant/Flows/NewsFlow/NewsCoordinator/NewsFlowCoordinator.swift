//
//  NewsFlowCoordinator.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 11.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

final class NewsFlowCoordinator: BaseCoordinator, NewsFlowCoordinatorOutput {
    var finishFlow: (() -> Void)?
    
    private let router: Router
    private let coordinatorFactory: CoordinatorFactory
    private let factory: NewsFlowFactory
    
    init(router: Router, coordinatorFactory: CoordinatorFactory, factory: NewsFlowFactory) {
        self.factory = factory
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        showMainNews()
    }
    
    // MARK: - Run current flow's controllers
    private func showMainNews() {
        let newsPageOutput = factory.makeMainNewsOutput()
        router.setRootModule(newsPageOutput)
    }
}

