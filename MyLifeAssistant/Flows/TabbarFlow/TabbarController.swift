//
//  TabbarView.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 08.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

final class TabbarController: UITabBarController, UITabBarControllerDelegate, TabbarView {
    
    var onViewDidLoad: ((UINavigationController) -> ())?
    var onNewsFlowSelect: ((UINavigationController) -> ())?
    var onAccountFlowSelect: ((UINavigationController) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        if let controller = customizableViewControllers?.first as? UINavigationController {
            onViewDidLoad?(controller)
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }
        
        switch selectedIndex {
        case 0:
            onViewDidLoad?(controller)
        case 1:
            onNewsFlowSelect?(controller)
        default:
            onAccountFlowSelect?(controller)
        }
    }
}
