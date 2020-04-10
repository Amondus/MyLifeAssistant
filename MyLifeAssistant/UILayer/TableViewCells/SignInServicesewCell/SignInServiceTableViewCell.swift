//
//  SignInServiceTableViewCell.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 07.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

class SignInServiceTableViewCell: UITableViewCell {
    
    var onButtonTapped: (() -> Void)?
    
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var buttonView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        buttonView.layer.cornerRadius = 10
        let buttonTapped = UITapGestureRecognizer(target: self, action: #selector(self.didTapButton(_:)))
        buttonTapped.delegate = self
        buttonView.addGestureRecognizer(buttonTapped)
    }
    
    @objc func didTapButton(_ sender: UITapGestureRecognizer) {
        onButtonTapped?()
    }
    
    func configureCell(title: String, image: UIImage?, backgroundColor: UIColor) {
        serviceLabel.text = title
        if image != nil {
            serviceImage.image = image
        }
        buttonView.backgroundColor = backgroundColor
    }
        
}
