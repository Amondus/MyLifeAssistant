//
//  Presentable.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 01.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
    
}

extension UIViewController: Presentable {
    func toPresent() -> UIViewController? {
        return self
    }
}
