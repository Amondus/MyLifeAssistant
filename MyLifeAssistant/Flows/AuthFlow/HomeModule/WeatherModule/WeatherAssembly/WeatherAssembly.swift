//
//  WeatherAssembly.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 01.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//


import Foundation
import EasyDi

class WeatherAssembly: Assembly {
    
    func defineInjection(into view: WeatherViewController) {
        defineInjection(key: "view", into: view) {
            $0.presenter = self.presenter
            return $0
        }
    }
    
    var view: WeatherView {
        return self.definePlaceholder()
    }
    
    var state: WeatherPresenterState {
        return define(scope: .lazySingleton, init: WeatherPresenterState())
    }
    
    var presenter: WeatherPresenter {
        return define(init: WeatherPresenterImp(view: self.view,
                                                state: self.state)) {
            $0.view = self.view
            $0.state = self.state
            return $0
        }
    }
}
