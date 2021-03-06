//
//  HomeFlowFactoryImp.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 22.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

final class HomeFlowFactoryImp: HomeFlowFactory {
    func makeHomePageOutput() -> HomePageView {
        return HomePageViewController.controllerFromStoryboard(.homePage)
    }
}
 
