//
//  SignInViewController.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 02.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class SignInViewController: UIViewController, SignInView {
    
    var onFinishSignIn: (() -> Void)?
    var onForgotPassword: (() -> Void)?
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: SignInPresenter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SignInAssembly.instance().defineInjection(into: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        hideKeyboardWhenTappedAround()
        self.view.applyGradient(colors: [#colorLiteral(red: 0.1720973253, green: 0.4694767594, blue: 0.5657689571, alpha: 1), #colorLiteral(red: 0.1755579114, green: 0.1943700016, blue: 0.2773140669, alpha: 1)])
        
        tableView.register(UINib(nibName: "TitleLabelTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleLabelTableViewCell")
        tableView.register(UINib(nibName: "UnderlineTextTableViewCell", bundle: nil), forCellReuseIdentifier: "UnderlineTextTableViewCell")
        tableView.register(UINib(nibName: "ForgotPasswordTableViewCell", bundle: nil), forCellReuseIdentifier: "ForgotPasswordTableViewCell")
        tableView.register(UINib(nibName: "GradientButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "GradientButtonTableViewCell")
        tableView.register(UINib(nibName: "SignInServiceTableViewCell", bundle: nil), forCellReuseIdentifier: "SignInServiceTableViewCell")
    }
}

// MARK: - TableViewDataSource Methods
extension SignInViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let labelCell = tableView.dequeueReusableCell(withIdentifier: "TitleLabelTableViewCell", for: indexPath) as! TitleLabelTableViewCell
            labelCell.configureCell(title: "Войдите в свой аккаунт")
            return labelCell
        case 1:
            let underlineCell = tableView.dequeueReusableCell(withIdentifier: "UnderlineTextTableViewCell", for: indexPath) as! UnderlineTextTableViewCell
            underlineCell.configureCell(title: "Email", text: nil, placeholder: "email@example.com", keyboardType: UIKeyboardType.emailAddress, image: UIImage(named: "mailIcon"))
            underlineCell.onTextEnter = { text in
                self.presenter?.state?.email = text
            }
            return underlineCell
        case 2:
            let underlineCell = tableView.dequeueReusableCell(withIdentifier: "UnderlineTextTableViewCell", for: indexPath) as! UnderlineTextTableViewCell
            underlineCell.configureCell(title: "Пароль", text: nil, placeholder: "******", keyboardType: UIKeyboardType.default, image: UIImage(named: "lockIcon"))
            underlineCell.cellTextField.isSecureTextEntry = true
            underlineCell.onTextEnter = { text in
                self.presenter?.state?.password = text
            }
            return underlineCell
        case 3:
            let forgotPasswordButtonCell = tableView.dequeueReusableCell(withIdentifier: "ForgotPasswordTableViewCell", for: indexPath) as! ForgotPasswordTableViewCell
            forgotPasswordButtonCell.onButtonTapped = {
                self.onForgotPassword?()
            }
            return forgotPasswordButtonCell
        case 4:
            let gradientButtonCell = tableView.dequeueReusableCell(withIdentifier: "GradientButtonTableViewCell", for: indexPath) as! GradientButtonTableViewCell
            gradientButtonCell.configureCell(title: "Войти")
            gradientButtonCell.onButtonTapped = {
                self.presenter?.signInUser()
            }
            return gradientButtonCell
        default:
            let serviceButtonCell = tableView.dequeueReusableCell(withIdentifier: "SignInServiceTableViewCell", for: indexPath) as! SignInServiceTableViewCell
            
            serviceButtonCell.onGoogleButtonTapped = {
                GIDSignIn.sharedInstance()?.signIn()
            }
            
            serviceButtonCell.onFacebookButtonTapped = {
                
            }
            return serviceButtonCell
        }
    }
}

extension SignInViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
}

extension SignInViewController: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            presentAlert(title: "Ошибка",
                         message: error.localizedDescription,
                         actions: [.init(title: "ОК", style: .default, handler: nil)],
                         style: .alert)
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        presenter?.signInUserWithGoogle(credential)
    }
}
