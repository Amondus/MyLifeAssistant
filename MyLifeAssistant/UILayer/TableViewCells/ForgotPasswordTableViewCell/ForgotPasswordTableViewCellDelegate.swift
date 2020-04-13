//
//  ForgotPasswordTableViewCellDelegate.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 10.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

protocol ForgotPasswordTableViewCellDelegate: class {
    var onButtonTapped: (() -> Void)?          {get set}
}
