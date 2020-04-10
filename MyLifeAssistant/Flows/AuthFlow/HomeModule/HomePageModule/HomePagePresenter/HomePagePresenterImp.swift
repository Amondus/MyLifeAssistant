//
//  HomePagePresenterImp.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 29.02.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

final class HomePagePresenterImp: HomePagePresenter {
    
    weak var view: HomePageView?
    var state: HomePagePresenterState
    
    init(view: HomePageView, state: HomePagePresenterState) {
        self.view = view
        self.state = state
    }
  
    
    
}
