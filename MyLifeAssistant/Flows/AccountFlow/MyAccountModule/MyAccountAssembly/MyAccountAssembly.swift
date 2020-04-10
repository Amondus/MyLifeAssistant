//
//  MyAccountAssembly.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 25.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation
import EasyDi

class MyAccountAssembly: Assembly {
    
    func defineInjection(into view: MyAccountViewController) {
        defineInjection(key: "view", into: view) {
            $0.presenter = self.presenter
            return $0
        }
    }
    
    var view: MyAccountView {
        return self.definePlaceholder()
    }
    
    var state: MyAccountPresenterState {
        return define(scope: .prototype, init: MyAccountPresenterState())
    }
    
    var presenter: MyAccountPresenter {
        return define(init: MyAccountPresenterImp(view: self.view,
                                                      state: self.state)) {
            $0.view = self.view
            $0.state = self.state
            return $0
        }
    }
}
