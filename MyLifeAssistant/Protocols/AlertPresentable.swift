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
    func presentAlert(title: String?,
                      message: String?,
                      actions: [UIAlertAction],
                      style: UIAlertController.Style,
                      completion: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach { alert.addAction($0) }
        present(alert, animated: true, completion: completion)
  }
}
