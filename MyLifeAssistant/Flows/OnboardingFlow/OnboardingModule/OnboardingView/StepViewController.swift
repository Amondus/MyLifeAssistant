//
//  StepViewController.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 08.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

class StepViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  var titleText: String? {
    get { return titleLabel.text }
    set { titleLabel.text = newValue }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func skipTapped(_ sender: Any) {
  }
  
  @IBAction func nextTapped(_ sender: Any) {
  }
}
