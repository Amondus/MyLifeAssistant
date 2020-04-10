//
//  TabbarView.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 08.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

protocol TabbarView: BaseView {
    var onViewDidLoad: ((UINavigationController) -> ())? { get set }
    var onNewsFlowSelect: ((UINavigationController) -> ())? { get set }
    var onAccountFlowSelect: ((UINavigationController) -> ())? { get set }
}
