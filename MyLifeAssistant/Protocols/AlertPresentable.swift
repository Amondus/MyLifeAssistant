//
//  AlertPresentable.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 08.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

protocol AlertPresentable where Self: UIViewController {}

extension AlertPresentable {
    
    /// Present reusable alert controller
    /// - Parameters:
    ///   - title: title of reusable alert controller
    ///   - message: message of reusable alert controller
    ///   - actions: array of actions for reusable alert controller
    ///   - style: style of action button
    ///   - completion: The block to execute after the action button was pressed. This block has no return value and takes no parameters. You may specify nil for this parameter.
    func presentAlert(title: String?,
                      message: String?,
                      actions: [UIAlertAction],
                      style: UIAlertController.Style,
                      completion: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach { alert.addAction($0) }
        present(alert, animated: true, completion: completion)
    }
    
    /// Present reusable activity indicator
    /// - Parameter startAnimate: A Boolean value that determines whether reusable activity view is displayed.
    func customActivityIndicator(startAnimate: Bool) {
        let mainContainer: UIView = UIView(frame: self.view.frame)
        mainContainer.center = self.view.center
        mainContainer.backgroundColor = colorFromHex(rgbValue: 0xFFFFFF, alpha: 0.4)
        mainContainer.tag = 789456123
        self.view.isUserInteractionEnabled = false
        
        let viewBackgroundLoading: UIView = UIView(frame: CGRect(x:0,y: 0,width: 70,height: 70))
        viewBackgroundLoading.center = self.view.center
        viewBackgroundLoading.backgroundColor = colorFromHex(rgbValue: 0x444444, alpha: 1)
        viewBackgroundLoading.clipsToBounds = true
        viewBackgroundLoading.layer.cornerRadius = 15
        
        let activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.frame = CGRect(x:0.0,y: 0.0,width: 40.0, height: 40.0)
        activityIndicatorView.style = UIActivityIndicatorView.Style.large
        activityIndicatorView.color = .white
        activityIndicatorView.center = CGPoint(x: viewBackgroundLoading.frame.size.width / 2, y: viewBackgroundLoading.frame.size.height / 2)
        if startAnimate {
            viewBackgroundLoading.addSubview(activityIndicatorView)
            mainContainer.addSubview(viewBackgroundLoading)
            self.view.addSubview(mainContainer)
            activityIndicatorView.startAnimating()
        }else{
            self.view.isUserInteractionEnabled = true
            for subview in self.view.subviews {
                if subview.tag == 789456123{
                    subview.removeFromSuperview()
                }
            }
        }
    }
    
    func colorFromHex(rgbValue: UInt32, alpha: Double = 1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}
