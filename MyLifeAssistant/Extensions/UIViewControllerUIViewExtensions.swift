//
//  UIViewControllerExtension.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 01.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private class func instantiateControllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
    class func controllerInStoryboard(_ storyboard: UIStoryboard, identifier: String) -> Self {
        return instantiateControllerInStoryboard(storyboard, identifier: identifier)
    }
    
    class func controllerInStoryboard(_ storyboard: UIStoryboard) -> Self {
        return controllerInStoryboard(storyboard, identifier: nameOfClass)
    }
    
    class func controllerFromStoryboard(_ storyboard: Storyboards) -> Self {
        return controllerInStoryboard(UIStoryboard(name: storyboard.rawValue, bundle: nil), identifier: nameOfClass)
    }
        
    /// This method automatically hide keyboard when user tap on screen or scroll view
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        let views = self.view.subviews
        for filterView in views {
            if filterView is UIScrollView {
                let scrollView = filterView as? UIScrollView
                scrollView?.keyboardDismissMode = .onDrag
            }
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
