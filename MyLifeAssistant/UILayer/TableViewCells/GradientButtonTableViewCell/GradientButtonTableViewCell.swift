//
//  GradientButtonTableViewCell.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 05.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

class GradientButtonTableViewCell: UITableViewCell, GradientButtonTableViewCellDelegate {
    
    var onButtonTapped: (() -> Void)?
    
    @IBOutlet weak var gradientButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        gradientButton.applyGradient(colors: [#colorLiteral(red: 0, green: 0.7764705882, blue: 0.737254902, alpha: 1), #colorLiteral(red: 0, green: 0.868796885, blue: 0.538926661, alpha: 1)])
    }
    
    @IBAction func gradientButtonTapped(_ sender: UIButton) {
        onButtonTapped?()
    }
    
    func configureCell(title: String) {
        gradientButton.setTitle(title, for: .normal)
    }
}
