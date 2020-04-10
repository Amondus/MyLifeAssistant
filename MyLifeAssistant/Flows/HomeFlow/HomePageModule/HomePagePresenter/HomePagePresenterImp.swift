//
//  HomePagePresenterImp.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 22.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

final class HomePagePresenterImp {
    
    weak var view: HomePageView?
    var state: HomePagePresenterState?
    
    init(view: HomePageView, state: HomePagePresenterState) {
        self.view = view
        self.state = state
    }
    
}

// MARK:- HomePagePresenterInput
extension HomePagePresenterImp: HomePagePresenter {
        
}
