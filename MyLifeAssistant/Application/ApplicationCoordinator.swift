//
//  ApplicationCoordinator.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 08.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

fileprivate var onboardingWasShown = true
fileprivate var isAutorized = false

fileprivate enum LaunchInstructor {
    case authorization, onboarding, tabBar
    
    static func configure(
        tutorialWasShown: Bool = onboardingWasShown,
        isAutorized: Bool = isAutorized) -> LaunchInstructor {
        
        switch (tutorialWasShown, isAutorized) {
        case (true, false), (false, false): return .authorization
        case (false, true): return .onboarding
        case (true, true): return .tabBar
        }
    }
}

final class ApplicationCoordinator: BaseCoordinator {
    
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure()
    }
  
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start(with option: DeepLinkOption?) {
        //start with deepLink
        if let option = option {
            switch option {
            case .authorization: runAuthFlow()
            case .onboarding: runOnboardingFlow()
            default: childCoordinators.forEach { coordinator in
                coordinator.start(with: option)
                }
            }
            // default start
        } else {
            switch instructor {
            case .authorization: runAuthFlow()
            case .onboarding: runOnboardingFlow()
            case .tabBar: runTabBarFlow()
            }
        }
    }
    
    private func runAuthFlow() {
        let coordinator = coordinatorFactory.makeAuthFlowCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            isAutorized = true
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
  
    private func runOnboardingFlow() {
        let coordinator = coordinatorFactory.makeOnboardingFlowCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            onboardingWasShown = true
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func runTabBarFlow() {
        let (coordinator, module) = coordinatorFactory.makeTabbarFlowCoordinator()
        addDependency(coordinator)
        router.setRootModule(module, hideBar: true)
        coordinator.start()
    }
}
