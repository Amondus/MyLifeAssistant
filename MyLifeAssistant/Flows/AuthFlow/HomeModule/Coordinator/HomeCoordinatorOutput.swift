//
//  HomeCoordinatorOutput.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 09.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

protocol HomeCoordinatorOutput: class {
    var finishFlow: CompletionBlock? { get set }
}
