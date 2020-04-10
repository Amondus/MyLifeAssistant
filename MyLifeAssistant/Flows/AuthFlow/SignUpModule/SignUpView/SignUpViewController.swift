//
//  SignUpViewController.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 02.04.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, SignUpView {

    var presenter: SignUpPresenter?
    
    var onFinishSignUp: (() -> Void)?
    var onForgotPassword: (() -> Void)?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SignUpAssembly.instance().defineInjection(into: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        hideKeyboardWhenTappedAround()
        
        tableView.register(UINib(nibName: "TitleLabelTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleLabelTableViewCell")
        tableView.register(UINib(nibName: "UnderlineTextTableViewCell", bundle: nil), forCellReuseIdentifier: "UnderlineTextTableViewCell")
        tableView.register(UINib(nibName: "GradientButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "GradientButtonTableViewCell")
        tableView.register(UINib(nibName: "SignInServiceTableViewCell", bundle: nil), forCellReuseIdentifier: "SignInServiceTableViewCell")
    }
}

// MARK: - TableViewDataSource Methods
extension SignUpViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let labelCell = tableView.dequeueReusableCell(withIdentifier: "TitleLabelTableViewCell", for: indexPath) as! TitleLabelTableViewCell
            labelCell.configureCell(title: "Регистрация")
            return labelCell
        case 1:
            let underlineCell = tableView.dequeueReusableCell(withIdentifier: "UnderlineTextTableViewCell", for: indexPath) as! UnderlineTextTableViewCell
            underlineCell.configureCell(title: "Имя", text: nil, placeholder: "Иван", keyboardType: UIKeyboardType.default, image: UIImage(named: "personIcon"))
            underlineCell.onTextEnter = { text in
                self.presenter?.state?.firstName = text
            }
            return underlineCell
        case 2:
            let underlineCell = tableView.dequeueReusableCell(withIdentifier: "UnderlineTextTableViewCell", for: indexPath) as! UnderlineTextTableViewCell
            underlineCell.configureCell(title: "Фамилия", text: nil, placeholder: "Иванов", keyboardType: UIKeyboardType.default, image: UIImage(named: "personIcon"))
            underlineCell.onTextEnter = { text in
                self.presenter?.state?.lastName = text
            }
            return underlineCell
        case 3:
            let underlineCell = tableView.dequeueReusableCell(withIdentifier: "UnderlineTextTableViewCell", for: indexPath) as! UnderlineTextTableViewCell
            underlineCell.configureCell(title: "Email", text: nil, placeholder: "email@example.com", keyboardType: UIKeyboardType.emailAddress, image: UIImage(named: "mailIcon"))
            underlineCell.onTextEnter = { text in
                self.presenter?.state?.email = text
            }
            return underlineCell
        case 4:
            let underlineCell = tableView.dequeueReusableCell(withIdentifier: "UnderlineTextTableViewCell", for: indexPath) as! UnderlineTextTableViewCell
            underlineCell.configureCell(title: "Пароль", text: nil, placeholder: "******", keyboardType: UIKeyboardType.default, image: UIImage(named: "lockIcon"))
            underlineCell.cellTextField.isSecureTextEntry = true
            underlineCell.onTextEnter = { text in
                self.presenter?.state?.password = text
            }
            return underlineCell
        case 5:
            let underlineCell = tableView.dequeueReusableCell(withIdentifier: "UnderlineTextTableViewCell", for: indexPath) as! UnderlineTextTableViewCell
            underlineCell.configureCell(title: "Подтверждение пароля", text: nil, placeholder: "******", keyboardType: UIKeyboardType.default, image: UIImage(named: "lockIcon"))
            underlineCell.cellTextField.isSecureTextEntry = true
            underlineCell.onTextEnter = { text in
                self.presenter?.state?.confirmPassword = text
            }
            return underlineCell
        default:
            let gradientButtonCell = tableView.dequeueReusableCell(withIdentifier: "GradientButtonTableViewCell", for: indexPath) as! GradientButtonTableViewCell
            gradientButtonCell.configureCell(title: "Зарегестрироваться")
            gradientButtonCell.onButtonTapped = {
                self.presenter?.signUpNewUser()
            }
            return gradientButtonCell
        }
    }
}
