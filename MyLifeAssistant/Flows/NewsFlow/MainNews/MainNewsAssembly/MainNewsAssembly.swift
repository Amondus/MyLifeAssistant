//
//  MainNewsAssembly.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 22.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation
import EasyDi

class MainNewsAssembly: Assembly {
    
    func defineInjection(into view: MainNewsViewController) {
        defineInjection(key: "view", into: view) {
            $0.presenter = self.presenter
            return $0
        }
    }
    
    var view: MainNewsView {
        return self.definePlaceholder()
    }
    
    var state: MainNewsPresenterState {
        return define(scope: .prototype, init: MainNewsPresenterState())
    }
    
    var presenter: MainNewsPresenter {
        return define(init: MainNewsPresenterImp(view: self.view,
                                                      state: self.state)) {
            $0.view = self.view
            $0.state = self.state
            return $0
        }
    }
}
