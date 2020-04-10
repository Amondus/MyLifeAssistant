//
//  UIButtonExtensions.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 03.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

extension UIButton {
    func applyGradient(colors: [CGColor]) {
        self.clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = 10
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
