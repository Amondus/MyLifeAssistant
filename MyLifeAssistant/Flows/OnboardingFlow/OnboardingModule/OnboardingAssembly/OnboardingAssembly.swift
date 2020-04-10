//
//  OnboardingAssembly.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 08.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation
import EasyDi

class OnboardingAssembly: Assembly {
    
    func defineInjection(into view: OnboardingViewController) {
        defineInjection(key: "view", into: view) {
            $0.presenter = self.presenter
            return $0
        }
    }
    
    var view: OnboardingView {
        return self.definePlaceholder()
    }
    
    var state: OnboardingPresenterState {
        return define(scope: .prototype, init: OnboardingPresenterState())
    }
    
    var presenter: OnboardingPresenter {
        return define(init: OnboardingPresenterImp(view: self.view,
                                                state: self.state)) {
            $0.view = self.view
            $0.state = self.state
            return $0
        }
    }
}
