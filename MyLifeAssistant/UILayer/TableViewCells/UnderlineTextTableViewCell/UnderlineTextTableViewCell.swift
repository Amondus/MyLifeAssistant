//
//  UnderlineTextTableViewCell.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 03.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

class UnderlineTextTableViewCell: UITableViewCell, UnderlineTextTableViewCellDelegate {
    
    var onTextEnter: ((_ text: String?) -> Void)?
    
    @IBOutlet weak var cellNameLabel: UILabel!
    @IBOutlet weak var leftCellImage: UIImageView!
    @IBOutlet weak var cellTextField: UITextField!
        
    let bottomLine = CALayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styleTextField()
        cellTextField.addTarget(self, action: #selector(editingBegan(_:)), for: .editingDidBegin)
        cellTextField.addTarget(self, action: #selector(editingEnded(_:)), for: .editingDidEnd)
    }
    
    @objc func editingBegan(_ textField: UITextField) {
        cellNameLabel.textColor = #colorLiteral(red: 0, green: 0.7764705882, blue: 0.737254902, alpha: 1)
        bottomLine.backgroundColor = #colorLiteral(red: 0, green: 0.7764705882, blue: 0.737254902, alpha: 1)
        leftCellImage.tintColor = #colorLiteral(red: 0, green: 0.7764705882, blue: 0.737254902, alpha: 1)
    }
    
    @objc func editingEnded(_ textField: UITextField) {
        cellNameLabel.textColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.6156862745, alpha: 1)
        bottomLine.backgroundColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.6156862745, alpha: 1)
        leftCellImage.tintColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.6156862745, alpha: 1)
        onTextEnter?(cellTextField.text)
    }
        
    func styleTextField() {
        bottomLine.frame = CGRect(x: 0,
                                  y: cellTextField.frame.height + 2,
                                  width: self.frame.width,
                                  height: 2)
        
        cellTextField.tintColor = #colorLiteral(red: 0, green: 0.7764705882, blue: 0.737254902, alpha: 1)
        cellNameLabel.textColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.6156862745, alpha: 1)
        bottomLine.backgroundColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.6156862745, alpha: 1)
        leftCellImage.tintColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.6156862745, alpha: 1)
        cellTextField.borderStyle = .none
        cellTextField.layer.addSublayer(bottomLine)
    }
    
    func configureCell(title: String, text: String?, placeholder: String?, keyboardType: UIKeyboardType, image: UIImage?) {
        cellNameLabel.text = title
        cellTextField.text = text
        
        if placeholder != nil {
            cellTextField.placeholder = placeholder
        }
        
        cellTextField.keyboardType = keyboardType
        
        if image != nil {
            leftCellImage.image = image
        }
    }
    
}
