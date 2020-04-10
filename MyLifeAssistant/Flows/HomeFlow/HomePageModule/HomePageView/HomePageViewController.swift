//
//  HomePageViewController.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 22.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    var presenter: HomePagePresenter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        HomePageAssembly.instance().defineInjection(into: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension HomePageViewController: HomePageView {
    
}
