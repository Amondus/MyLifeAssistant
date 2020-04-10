//
//  NewsFlowFactory.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 25.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

protocol NewsFlowFactory {
    func makeMainNewsOutput() -> MainNewsView
}
