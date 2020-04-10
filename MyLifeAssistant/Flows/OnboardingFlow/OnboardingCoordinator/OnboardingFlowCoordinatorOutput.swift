//
//  OnboardingCoordinatorOutput.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 08.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

protocol OnboardingFlowCoordinatorOutput: class {
  var finishFlow: (() -> Void)? { get set }
}
