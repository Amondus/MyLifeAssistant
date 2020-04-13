//
//  UIViewExtensions.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 01.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

extension UIView {
    
    private class func viewInNibNamed<T: UIView>(_ nibNamed: String) -> T {
        return Bundle.main.loadNibNamed(nibNamed, owner: nil, options: nil)!.first as! T
    }
    
    class func nib() -> Self {
        return viewInNibNamed(nameOfClass)
    }
    
    class func nib(_ frame: CGRect) -> Self {
        let view = nib()
        view.frame = frame
        view.layoutIfNeeded()
        return view
    }
    
    /// This method add gradient layer on UIView
    /// - Parameter colors: array of colors which will use in gradient layer
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
