//
//  SignInAssembly.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 02.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation
import EasyDi

class SignInAssembly: Assembly {
    
    func defineInjection(into view: SignInViewController) {
        defineInjection(key: "view", into: view) {
            $0.presenter = self.presenter
            return $0
        }
    }
    
    var view: SignInView {
        return self.definePlaceholder()
    }
    
    var state: SignInPresenterState {
        return define(scope: .prototype, init: SignInPresenterState())
    }
    
    
    var presenter: SignInPresenter {
        return define(init: SignInPresenterImp(view: self.view, state: self.state)) {
            $0.view = self.view
            $0.state = self.state
            return $0
        }
    }
}
