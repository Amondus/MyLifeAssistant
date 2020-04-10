//
//  CoordinatorFactory.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 08.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

protocol CoordinatorFactory {
    func makeAuthFlowCoordinator(router: Router) -> Coordinator & AuthFlowCoordinatorOutput
    
    func makeOnboardingFlowCoordinator(router: Router) -> Coordinator & OnboardingFlowCoordinatorOutput
    
    func makeTabbarFlowCoordinator() -> (configurator: Coordinator, toPresent: Presentable?)
  
    func makeHomeFlowCoordinator(navController: UINavigationController?) -> Coordinator
    func makeHomeFlowCoordinator() -> Coordinator
    
    func makeNewsFlowCoordinator() -> Coordinator
    func makeNewsFlowCoordinator(navController: UINavigationController?) -> Coordinator
    
    func makeAccountFlowCoordinator() -> Coordinator
    func makeAccountFlowCoordinator(navController: UINavigationController?) -> Coordinator
  
}
