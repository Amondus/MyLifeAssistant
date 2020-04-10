//
//  NewsFlowFactoryImp.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 25.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

final class NewsFlowFactoryImp: NewsFlowFactory {
    func makeMainNewsOutput() -> MainNewsView {
        return MainNewsViewController.controllerFromStoryboard(.mainNews)
    }
}
