//
//  ForgotPasswordTableViewCell.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 10.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

class ForgotPasswordTableViewCell: UITableViewCell {

    var onButtonTapped: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        onButtonTapped?()
    }
}
