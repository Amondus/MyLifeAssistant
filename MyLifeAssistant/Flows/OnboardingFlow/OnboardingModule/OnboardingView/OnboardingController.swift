//
//  OnboardingViewController.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 08.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, OnboardingView {
  
    var presenter: OnboardingPresenter?
        
    var onFinishOnboarding: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func finishTapped(_ sender: Any) {
        onFinishOnboarding?()
    }
}
