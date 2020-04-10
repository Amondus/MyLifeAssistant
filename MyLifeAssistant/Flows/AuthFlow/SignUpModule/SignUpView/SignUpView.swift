//
//  SignUpView.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 02.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

protocol SignUpView: BaseView, AlertPresentable {
    var onFinishSignUp: (() -> Void)?                {get set}
    var onForgotPassword: (() -> Void)?              {get set}
}
