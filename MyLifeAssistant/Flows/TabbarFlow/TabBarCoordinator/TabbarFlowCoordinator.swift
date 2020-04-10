//
//  TabbarController.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 08.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

class TabbarFlowCoordinator: BaseCoordinator {
    
    private let tabbarView: TabbarView
    private let coordinatorFactory: CoordinatorFactory
    
    init(tabbarView: TabbarView, coordinatorFactory: CoordinatorFactory) {
        self.tabbarView = tabbarView
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        tabbarView.onViewDidLoad = runHomeFlow()
        tabbarView.onNewsFlowSelect = runNewsFlow()
        tabbarView.onAccountFlowSelect = runAccountFlow()
    }
    
    private func runHomeFlow() -> ((UINavigationController) -> ()) {
        return { [unowned self] navController in
            if navController.viewControllers.isEmpty == true {
                let homeCoordinator = self.coordinatorFactory.makeHomeFlowCoordinator(navController: navController)
                self.addDependency(homeCoordinator)
                homeCoordinator.start()
            }
        }
    }
    
    private func runNewsFlow() -> ((UINavigationController) -> ()) {
        return { [unowned self] navController in
            if navController.viewControllers.isEmpty == true {
                let newsCoordinator = self.coordinatorFactory.makeNewsFlowCoordinator(navController: navController)
                self.addDependency(newsCoordinator)
                newsCoordinator.start()
            }
        }
    }
        
    private func runAccountFlow() -> ((UINavigationController) -> ()) {
        return { [unowned self] navController in
            if navController.viewControllers.isEmpty == true {
                let accountCoordinator = self.coordinatorFactory.makeAccountFlowCoordinator(navController: navController)
                self.addDependency(accountCoordinator)
                accountCoordinator.start()
            }
        }
    }
}
