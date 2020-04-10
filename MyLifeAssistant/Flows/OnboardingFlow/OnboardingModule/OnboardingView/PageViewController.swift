//
//  PageViewController.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 08.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {
  
  var pageViewController: UIPageViewController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    pageViewController = UIPageViewController(
      transitionStyle: .scroll,
      navigationOrientation: .horizontal,
      options: nil
    )
    pageViewController.delegate = self
    addChild(pageViewController)
    view.addSubview(pageViewController.view)
  }
}

extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
  
  func pageViewController(_ pageViewController: UIPageViewController,
                          viewControllerBefore viewController: UIViewController) -> UIViewController? {
    return UIViewController()
  }
  
  func pageViewController(_ pageViewController: UIPageViewController,
                          viewControllerAfter viewController: UIViewController) -> UIViewController? {
    return UIViewController()
  }
  
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return 3
  }
  
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    return 2
  }
}
