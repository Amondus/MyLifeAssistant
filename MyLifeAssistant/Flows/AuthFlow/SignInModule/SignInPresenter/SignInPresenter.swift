//
//  SignInPresenter.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 02.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation
import Firebase

protocol SignInPresenter: class {
    var state: SignInPresenterState?            {get set}
    
    func signInUser()
    func signInUserWithGoogle(_ credential: AuthCredential)
}
