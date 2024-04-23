//
//  LoginViewController.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 23.04.24.
//

import UIKit

class LoginViewController: BaseViewController {

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
        lbl.text = "Login"
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
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
    
    private lazy var loginButton: AppPrimaryButton = {
        let btn = AppPrimaryButton()
        btn.setTitle("Login", for: .normal)
        btn.addTarget(self, action: #selector(onLoginBtnTapped), for: .touchUpInside)
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
        navigationItem.rightBarButtonItem = .init(title: "Sign up", style: .plain, target: self, action: #selector(onSignupBtnTapped))
        navigationItem.rightBarButtonItem?.tintColor = .unselectedBar
        navigationItem.leftBarButtonItem = UIBarButtonItem()
    }
    private func addSubviews() {
        self.view.addSubview(stackView)
        stackView.addArrangedSubview(headerLabel)
        stackView.setCustomSpacing(24, after: headerLabel)
        stackView.addArrangedSubview(usernameField)
        stackView.addArrangedSubview(passwordField)
        
        self.view.addSubview(loginButton)
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    @objc private func onSignupBtnTapped() {
        let vc = SignupViewController()
        navigationController?.removeAllViewControllersAndPush(to: vc, animated: true)
    }

    @objc func onLoginBtnTapped() {
      validate()
    }
    
    func validate() {
        do {
            let username = try  usernameField.validatedText(validationType: ValidatorType.name)
            
            let password = try passwordField.validatedText(validationType: ValidatorType.password)
            
            let user = authManager.login(username: username, password: password)
            
            if user != nil {
               let vc = TabBarViewController()
                self.navigationController?.removeAllViewControllersAndPush(to: vc, animated: true)
                self.navigationController?.isNavigationBarHidden = true
    
            }
            else {
                let errorMsg = "No user found with these credentials"
                showErrorAlert(errorMsg: errorMsg)
            }
        }
        
        catch(let error) {
            let errorMsg = (error as! ValidationError).message
            showErrorAlert(errorMsg: errorMsg)
        }
    }
}



//MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            textField.resignFirstResponder()
            passwordField.becomeFirstResponder()
        
        }
        else if textField == passwordField {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
