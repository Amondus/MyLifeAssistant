//
//  SignUpPresenter.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 02.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

protocol SignUpPresenter: class {
    var state: SignUpPresenterState?            {get set}
    
    func signUpNewUser()
}

