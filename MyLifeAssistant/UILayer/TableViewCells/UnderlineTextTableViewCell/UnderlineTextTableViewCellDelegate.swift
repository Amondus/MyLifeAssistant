//
//  UnderlineTextTableViewCellDelegate.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 07.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

protocol UnderlineTextTableViewCellDelegate {
    var onTextEnter: ((_ text: String?) -> Void)?          {get set}
}
