//
//  GradientButtonTableViewCellDelegate.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 05.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

protocol GradientButtonTableViewCellDelegate: class {
    var onButtonTapped: (() -> Void)?          {get set}
}
