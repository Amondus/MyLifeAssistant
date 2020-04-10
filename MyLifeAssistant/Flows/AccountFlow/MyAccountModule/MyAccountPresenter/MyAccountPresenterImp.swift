//
//  MyAccountPresenterImp.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 25.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

final class MyAccountPresenterImp {
    
    weak var view: MyAccountView?
    var state: MyAccountPresenterState
    
    init(view: MyAccountView, state: MyAccountPresenterState) {
        self.view = view
        self.state = state
    }
    
}

extension MyAccountPresenterImp: MyAccountPresenter {
    
}
