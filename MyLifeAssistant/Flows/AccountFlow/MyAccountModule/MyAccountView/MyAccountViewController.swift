//
//  MyAccountViewController.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 25.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

class MyAccountViewController: UIViewController {

    var presenter: MyAccountPresenter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MyAccountAssembly.instance().defineInjection(into: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension MyAccountViewController: MyAccountView {
    
}
