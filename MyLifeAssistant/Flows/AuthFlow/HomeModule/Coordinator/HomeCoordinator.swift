//
//  HomeCoordinator.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 08.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

final class HomeCoordinator: BaseCoordinator, HomeCoordinatorOutput {
    
    var finishFlow: CompletionBlock?
    
    fileprivate let factory: HomeFactoryProtocol
    fileprivate let router : Routable
    
    init(with factory: HomeFactoryProtocol, router: Routable) {
        self.router  = router
        self.factory = factory
    }
}

// MARK:- Coordinatable
extension HomeCoordinator: Coordinatable {
    func start() {
        performFlow()
    }
}

// MARK:- Private methods
private extension HomeCoordinator {
    func performFlow() {
        let view = factory.makeHomePageView()
        router.push(view)
    }
}
