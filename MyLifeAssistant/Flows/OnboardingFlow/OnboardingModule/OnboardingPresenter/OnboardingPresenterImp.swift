//
//  OnboardingPresenterImp.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 08.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

final class OnboardingPresenterImp: OnboardingPresenter {
    
    weak var view: OnboardingView?
    var state: OnboardingPresenterState
    
    init(view: OnboardingView, state: OnboardingPresenterState) {
        self.view = view
        self.state = state
    }
  
    
    
}
