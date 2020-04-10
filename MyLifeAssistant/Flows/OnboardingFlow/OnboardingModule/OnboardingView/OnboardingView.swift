//
//  OnboardingView.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 11.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

protocol OnboardingView: BaseView {
    var onFinishOnboarding: (() -> Void)?           {get set}
}
