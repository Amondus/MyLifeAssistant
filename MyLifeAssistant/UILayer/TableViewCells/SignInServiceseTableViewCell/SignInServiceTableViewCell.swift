//
//  SignInServiceTableViewCell.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 07.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

class SignInServiceTableViewCell: UITableViewCell {
    
    var onGoogleButtonTapped: (() -> Void)?
    var onFacebookButtonTapped: (() -> Void)?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func googleButtonTapped(_ sender: UIButton) {
        onGoogleButtonTapped?()
    }
    
    @IBAction func facebookButtonTapped(_ sender: UIButton) {
        onFacebookButtonTapped?()
    }
        
}
