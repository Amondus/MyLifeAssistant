//
//  HomePageAssembly.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 22.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation
import EasyDi

class HomePageAssembly: Assembly {
    
    func defineInjection(into view: HomePageViewController) {
        defineInjection(key: "view", into: view) {
            $0.presenter = self.presenter
            return $0
        }
    }
    
    var view: HomePageView {
        return self.definePlaceholder()
    }
    
    var state: HomePagePresenterState {
        return define(scope: .prototype, init: HomePagePresenterState())
    }
    
    var presenter: HomePagePresenter {
        return define(init: HomePagePresenterImp(view: self.view,
                                                      state: self.state)) {
            $0.view = self.view
            $0.state = self.state
            return $0
        }
    }
}

