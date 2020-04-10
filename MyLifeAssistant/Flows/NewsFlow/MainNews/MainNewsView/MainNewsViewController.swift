//
//  MainNewsViewController.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 22.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

class MainNewsViewController: UIViewController {

    var presenter: MainNewsPresenter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MainNewsAssembly.instance().defineInjection(into: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension MainNewsViewController: MainNewsView {
    
}
