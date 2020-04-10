//
//  CoordinatorFactoryImp.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 08.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

final class CoordinatorFactoryImp: CoordinatorFactory {
    
    func makeAuthFlowCoordinator(router: Router) -> Coordinator & AuthFlowCoordinatorOutput {
        let coordinator = AuthFlowCoordinator(router: router, factory: AuthFlowFactoryImp())
        return coordinator
    }
  
    func makeOnboardingFlowCoordinator(router: Router) -> Coordinator & OnboardingFlowCoordinatorOutput {
        return OnboardingFlowCoordinator(with: OnboardingFlowFactoryImp(), router: router)
    }
    
    func makeTabbarFlowCoordinator() -> (configurator: Coordinator, toPresent: Presentable?) {
        let controller = TabbarController.controllerFromStoryboard(.tabBar)
        let coordinator = TabbarFlowCoordinator(tabbarView: controller,
                                            coordinatorFactory: CoordinatorFactoryImp())
        return (coordinator, controller)
    }
    
    func makeHomeFlowCoordinator() -> Coordinator {
        return makeHomeFlowCoordinator(navController: nil)
    }
    
    func makeHomeFlowCoordinator(navController: UINavigationController?) -> Coordinator {
        let coordinator = HomeFlowCoordinator(router: router(navController),
                                          coordinatorFactory: CoordinatorFactoryImp(),
                                          factory: HomeFlowFactoryImp())
        return coordinator
    }
  
    func makeNewsFlowCoordinator() -> Coordinator {
        return makeNewsFlowCoordinator(navController: nil)
    }
  
    func makeNewsFlowCoordinator(navController: UINavigationController? = nil) -> Coordinator {
        let coordinator = NewsFlowCoordinator(router: router(navController),
                                          coordinatorFactory: CoordinatorFactoryImp(),
                                          factory: NewsFlowFactoryImp())
        return coordinator
    }
    
    func makeAccountFlowCoordinator() -> Coordinator {
        return makeAccountFlowCoordinator(navController: nil)
    }
    
    func makeAccountFlowCoordinator(navController: UINavigationController? = nil) -> Coordinator {
        let coordinator = AccountFlowCoordinator(router: router(navController),
                                             coordinatorFactory: CoordinatorFactoryImp(),
                                             factory: AccountFlowFactoryImp())
        return coordinator
    }
  
    private func router(_ navController: UINavigationController?) -> Router {
        return RouterImp(rootController: navigationController(navController))
    }
  
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController { return navController }
        else { return UINavigationController.controllerFromStoryboard(.tabBar) }
    }
}
