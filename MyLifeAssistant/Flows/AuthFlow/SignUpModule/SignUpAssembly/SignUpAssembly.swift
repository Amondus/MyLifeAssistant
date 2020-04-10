//
//  SignUpAssembly.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 02.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation
import EasyDi

class SignUpAssembly: Assembly {
    
    func defineInjection(into view: SignUpViewController) {
        defineInjection(key: "view", into: view) {
            $0.presenter = self.presenter
            return $0
        }
    }
    
    var view: SignUpView {
        return self.definePlaceholder()
    }
    
    var state: SignUpPresenterState {
        return define(scope: .prototype, init: SignUpPresenterState())
    }
    
    var presenter: SignUpPresenter {
        return define(init: SignUpPresenterImp(view: self.view,
                                                      state: self.state)) {
            $0.view = self.view
            $0.state = self.state
            return $0
        }
    }
}
