//
//  MainNewsPresenterImp.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 22.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

final class MainNewsPresenterImp {
    
    weak var view: MainNewsView?
    var state: MainNewsPresenterState
    
    init(view: MainNewsView, state: MainNewsPresenterState) {
        self.view = view
        self.state = state
    }
    
}

extension MainNewsPresenterImp: MainNewsPresenter {
    
}
