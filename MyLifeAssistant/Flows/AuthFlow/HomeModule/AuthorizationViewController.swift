//
//  AuthorizationViewController.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 08.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

class AuthorizationViewController: UIViewController, AuthorizationView {
    
    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var gradientButton: UIButton!
    
    var onSignIn: (() -> Void)?
    var onSignUp: (() -> Void)?
    
    var gradientLayer: CAGradientLayer!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setLifeLabel()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        createGradientLayer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    func setLifeLabel() {
        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: "Control your.  ",
                                       attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]))
        text.append(NSAttributedString(string: "Life.",
                                       attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.8156862745, blue: 0.631372549, alpha: 1),
                                                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: lifeLabel.font.pointSize)]))
        lifeLabel.attributedText = text
    }
    
    func createGradientLayer() {
        gradientButton.applyGradient(colors: [#colorLiteral(red: 0, green: 0.7764705882, blue: 0.737254902, alpha: 1), #colorLiteral(red: 0, green: 0.868796885, blue: 0.538926661, alpha: 1)])
    }
    
//    func setNavigationBar() {
//        UIBarButtonItem.appearance().setBackButtonBackgroundImage(UIImage(named: "backArrow"), for: .normal, barMetrics: .default)
//        self.navigationController?.navigationBar.tintColor = UIColor.clear
//
//    }
    
    
    @IBAction func signInTapped(_ sender: UIButton) {
        onSignIn?()
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        onSignUp?()
    }
    
}
