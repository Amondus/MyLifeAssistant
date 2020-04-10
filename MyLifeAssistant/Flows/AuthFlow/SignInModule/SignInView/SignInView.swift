//
//  SignInView.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 02.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

protocol SignInView: BaseView, AlertPresentable {
    var onFinishSignIn: (() -> Void)?                {get set}
    var onForgotPassword: (() -> Void)?              {get set}
}
