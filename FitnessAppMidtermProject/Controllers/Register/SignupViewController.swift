//
//  SignupViewController.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 23.04.24.
//

import UIKit

class SignupViewController: BaseViewController {

    let authManager = AuthManager()
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 12
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let headerLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 30, weight: .bold)
        lbl.text = "Register"
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    private let horizontalStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 8
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var nameField: AppTextField = {
        let tf = AppTextField()
        tf.placeholder = "Name"
        tf.returnKeyType = .next
        tf.delegate = self
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var surnameField: AppTextField = {
        let tf = AppTextField()
        tf.placeholder = "Surname"
        tf.returnKeyType = .next
        tf.delegate = self
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var usernameField: AppTextField = {
        let tf = AppTextField()
        tf.placeholder = "Username"
        tf.returnKeyType = .next
        tf.delegate = self
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var passwordField: AppTextField = {
        let tf = AppTextField()
        tf.placeholder = "Password"
        tf.returnKeyType = .done
        tf.isSecureTextEntry = true
        tf.delegate = self
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var signupButton: AppPrimaryButton = {
        let btn = AppPrimaryButton()
        btn.setTitle("Register", for: .normal)
        btn.addTarget(self, action: #selector(onSignupBtnTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        addSubviews()
        addConstraints()
    }
    private func setupNavbar() {
        navigationItem.rightBarButtonItem = .init(title: "Login", style: .plain, target: self, action: #selector(onLoginBtnTapped))
        navigationItem.rightBarButtonItem?.tintColor = .unselectedBar
        navigationItem.leftBarButtonItem = UIBarButtonItem()
    }
    private func addSubviews() {
        self.view.addSubview(stackView)
        stackView.addArrangedSubview(headerLabel)
        stackView.setCustomSpacing(24, after: headerLabel)
        stackView.addArrangedSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(nameField)
        horizontalStackView.addArrangedSubview(surnameField)
        stackView.addArrangedSubview(usernameField)
        stackView.addArrangedSubview(passwordField)
        
        self.view.addSubview(signupButton)
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            signupButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            signupButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            signupButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    @objc private func onLoginBtnTapped() {
        let vc = LoginViewController()
        navigationController?.removeAllViewControllersAndPush(to: vc, animated: true)
    }
    
    @objc private func onSignupBtnTapped() {
        
        validate()
    }
    
    func validate() {
        do {
        
            let firstName = try nameField.validatedText(validationType: ValidatorType.name)
            
            let surname = try surnameField.validatedText(validationType: ValidatorType.name)
            
            let password = try passwordField.validatedText(validationType: ValidatorType.password)
            
            let username = try self.usernameField.validatedText(validationType: .name)
            
            let user = UserItemModel(id: UUID(), name: firstName, surname: surname, username: username, password: password)
        
            authManager.register(data: user)
            
            let vc = LoginViewController()
            navigationController?.removeAllViewControllersAndPush(to: vc, animated: true)
        }
        
        catch(let error) {
            let errorMsg = (error as! ValidationError).message
            showErrorAlert(errorMsg: errorMsg)
        }
    }

}

//MARK: - UITextFieldDelegate

extension SignupViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameField {
            textField.resignFirstResponder()
            surnameField.becomeFirstResponder()
        }
        
        else if textField == surnameField {
            surnameField.resignFirstResponder()
            usernameField.becomeFirstResponder()
        }
        
        else if textField == usernameField {
            usernameField.resignFirstResponder()
            passwordField.becomeFirstResponder()
        }
        
        else if textField == passwordField {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
