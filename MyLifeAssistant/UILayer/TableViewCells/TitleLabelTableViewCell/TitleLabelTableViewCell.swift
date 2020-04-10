//
//  TitleLabelTableViewCell.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 07.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

class TitleLabelTableViewCell: UITableViewCell {

    @IBOutlet weak var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(title: String) {
        mainLabel.text = title
    }
    
}
