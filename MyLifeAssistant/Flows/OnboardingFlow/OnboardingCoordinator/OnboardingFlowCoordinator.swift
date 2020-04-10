//
//  OnboardingFLowCoordinator.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 08.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

class OnboardingFlowCoordinator: BaseCoordinator, OnboardingFlowCoordinatorOutput {

  var finishFlow: (() -> Void)?
  
  private let factory: OnboardingFlowFactory
  private let router: Router
  
  init(with factory: OnboardingFlowFactory, router: Router) {
    self.factory = factory
    self.router = router
  }
  
  override func start() {
    showOnboarding()
  }
  
  func showOnboarding() {
    let onboardingModule = factory.makeOnboardingOutput()
    onboardingModule.onFinishOnboarding = { [weak self] in
      self?.finishFlow?()
    }
    router.setRootModule(onboardingModule.toPresent())
  }
}
