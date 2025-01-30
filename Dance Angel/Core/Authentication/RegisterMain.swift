//
//  RegisterMain.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 12/14/24.
//

import UIKit

class RegisterMain: BaseViewController, UITextFieldDelegate {
    
    private let emailErrorLabel = ErrorLabel() // Reusable error label for email
    private let passwordErrorLabel = ErrorLabel() // Reusable error label for password
    private let confirmPasswordErrorLabel = ErrorLabel() // Reusable error label for confirm password
    private let fullNameErrorLabel = ErrorLabel() // Reusable error label for full name
    
    private var passwordPlaceholderTopConstraint: NSLayoutConstraint!
    private var emailErrorLabelHeightConstraint: NSLayoutConstraint!
    private var passwordErrorLabelHeightConstraint: NSLayoutConstraint!
    private var confirmPasswordErrorLabelHeightConstraint: NSLayoutConstraint!
    private var fullNameErrorLabelHeightConstraint: NSLayoutConstraint!
    private var emailPlaceholderTopConstraint: NSLayoutConstraint!
    private var confirmPasswordPlaceholderTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the error labels
        emailErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        confirmPasswordErrorLabel.isHidden = true
        fullNameErrorLabel.isHidden = true
        view.addSubview(emailErrorLabel)
        view.addSubview(passwordErrorLabel)
        view.addSubview(confirmPasswordErrorLabel)
        view.addSubview(fullNameErrorLabel)
        
        let registerButton = ActionPlaceholder(title: "Register".uppercased())
        registerButton.addTarget(self, action: #selector(navigateToNextScreen), for: .touchUpInside)
        view.addSubview(registerButton)
        
        // Add credentials placeholders
        let fullNamePlaceholder = CredentialsPlaceholder(placeholder: "Full Name or Company Name")
        let emailPlaceholder = CredentialsPlaceholder(placeholder: "Email")
        let passwordPlaceholder = CredentialsPlaceholder(placeholder: "Password", isSecure: true)
        let confirmPasswordPlaceholder = CredentialsPlaceholder(placeholder: "Confirm Password", isSecure: true)
        
        // Assign the text field delegate for validation
        fullNamePlaceholder.textField.delegate = self
        emailPlaceholder.textField.delegate = self
        passwordPlaceholder.textField.delegate = self
        confirmPasswordPlaceholder.textField.delegate = self
        
        // Add placeholders to the view
        view.addSubview(fullNamePlaceholder)
        view.addSubview(emailPlaceholder)
        view.addSubview(passwordPlaceholder)
        view.addSubview(confirmPasswordPlaceholder)
        
        // Add login question
        let loginQuestion = CustomLabel(style: .secondaryText)
        loginQuestion.text = "Already have an account? Login"
        loginQuestion.textAlignment = .center
        loginQuestion.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginQuestion)
        
        // Add constraints
        fullNameErrorLabelHeightConstraint = fullNameErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        emailErrorLabelHeightConstraint = emailErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        passwordErrorLabelHeightConstraint = passwordErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        confirmPasswordErrorLabelHeightConstraint = confirmPasswordErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        emailPlaceholderTopConstraint = emailPlaceholder.topAnchor.constraint(equalTo: fullNamePlaceholder.bottomAnchor, constant: 30)
        passwordPlaceholderTopConstraint = passwordPlaceholder.topAnchor.constraint(equalTo: emailPlaceholder.bottomAnchor, constant: 30)
        confirmPasswordPlaceholderTopConstraint = confirmPasswordPlaceholder.topAnchor.constraint(equalTo: passwordPlaceholder.bottomAnchor, constant: 30)
        
        NSLayoutConstraint.activate([
            // Register button constraints
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 765),
            
            // Credentials placeholders constraints
            fullNamePlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fullNamePlaceholder.topAnchor.constraint(equalTo: view.topAnchor, constant: 240),
            
            // Full Name error label constraints
            fullNameErrorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            fullNameErrorLabel.topAnchor.constraint(equalTo: fullNamePlaceholder.bottomAnchor, constant: 10),
            fullNameErrorLabelHeightConstraint,
            
            emailPlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailPlaceholderTopConstraint,
            
            // Email error label constraints
            emailErrorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            emailErrorLabel.topAnchor.constraint(equalTo: emailPlaceholder.bottomAnchor, constant: 10),
            emailErrorLabelHeightConstraint,
            
            passwordPlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordPlaceholderTopConstraint,
            
            // Password error label constraints
            passwordErrorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            passwordErrorLabel.topAnchor.constraint(equalTo: passwordPlaceholder.bottomAnchor, constant: 10),
            passwordErrorLabelHeightConstraint,
            
            confirmPasswordPlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmPasswordPlaceholderTopConstraint,
            
            // Confirm password error label constraints
            confirmPasswordErrorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            confirmPasswordErrorLabel.topAnchor.constraint(equalTo: confirmPasswordPlaceholder.bottomAnchor, constant: 10),
            confirmPasswordErrorLabelHeightConstraint,
            
            // Login question constraints
            loginQuestion.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginQuestion.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 10),
        ])
    }
    
    // Validate full name, email, and password format
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.placeholder == "Full Name or Company Name" {
            guard let fullName = textField.text, !fullName.trimmingCharacters(in: .whitespaces).isEmpty else {
                showFullNameError(show: true, message: "Please enter your full name or company name")
                return
            }
            showFullNameError(show: false)
        }
        
        if textField.placeholder == "Email" {
            guard let email = textField.text, isValidEmail(email) else {
                showEmailError(show: true, message: "Email is not valid")
                return
            }
            showEmailError(show: false)
        }
        
        if textField.placeholder == "Password" {
            guard let password = textField.text, isValidPassword(password) else {
                showPasswordError(show: true, message: "Password must be at least 8 characters")
                return
            }
            showPasswordError(show: false)
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        // Regex pattern for email validation
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        // Password validation: minimum 8 characters
        return password.count >= 8
    }
    
    private func showFullNameError(show: Bool, message: String = "") {
        if show {
            fullNameErrorLabel.setErrorMessage(message)
            emailPlaceholderTopConstraint.constant = 55 // Adjust position of emailPlaceholder
            fullNameErrorLabelHeightConstraint.constant = 30 // Show full name error label
            fullNameErrorLabel.isHidden = false
        } else {
            fullNameErrorLabelHeightConstraint.constant = 0
            emailPlaceholderTopConstraint.constant = 30 // Reset position of emailPlaceholder
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func showEmailError(show: Bool, message: String = "") {
        if show {
            emailErrorLabel.setErrorMessage(message)
            passwordPlaceholderTopConstraint.constant = 55
            emailErrorLabelHeightConstraint.constant = 30
            emailErrorLabel.isHidden = false
        } else {
            emailErrorLabelHeightConstraint.constant = 0
            passwordPlaceholderTopConstraint.constant = 30
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func showPasswordError(show: Bool, message: String = "") {
        if show {
            passwordErrorLabel.setErrorMessage(message)
            confirmPasswordPlaceholderTopConstraint.constant = 55
            passwordErrorLabelHeightConstraint.constant = 30
            passwordErrorLabel.isHidden = false
        } else {
            passwordErrorLabelHeightConstraint.constant = 0
            confirmPasswordPlaceholderTopConstraint.constant = 30
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func showConfirmPasswordError(show: Bool, message: String = "") {
        if show {
            confirmPasswordErrorLabel.setErrorMessage(message)
            confirmPasswordErrorLabelHeightConstraint.constant = 30
            confirmPasswordErrorLabel.isHidden = false
        } else {
            confirmPasswordErrorLabelHeightConstraint.constant = 0
            confirmPasswordErrorLabel.isHidden = true
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func navigateToNextScreen() {
        // Fetch the text values from all placeholders
        let fullName = (view.subviews.first { $0 is CredentialsPlaceholder && ($0 as! CredentialsPlaceholder).textField.placeholder == "Full Name or Company Name" } as? CredentialsPlaceholder)?.textField.text
        let email = (view.subviews.first { $0 is CredentialsPlaceholder && ($0 as! CredentialsPlaceholder).textField.placeholder == "Email" } as? CredentialsPlaceholder)?.textField.text
        let password = (view.subviews.first { $0 is CredentialsPlaceholder && ($0 as! CredentialsPlaceholder).textField.placeholder == "Password" } as? CredentialsPlaceholder)?.textField.text
        let confirmPassword = (view.subviews.first { $0 is CredentialsPlaceholder && ($0 as! CredentialsPlaceholder).textField.placeholder == "Confirm Password" } as? CredentialsPlaceholder)?.textField.text
        
        var hasErrors = false
        
        // Validate Full Name
        if fullName?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true {
            showFullNameError(show: true, message: "Please enter your full name or company name")
            hasErrors = true
        } else {
            showFullNameError(show: false)
        }
        
        // Validate Email
        if !isValidEmail(email ?? "") {
            showEmailError(show: true, message: "Email is not valid")
            hasErrors = true
        } else {
            showEmailError(show: false)
        }
        
        // Validate Password
        if !isValidPassword(password ?? "") {
            showPasswordError(show: true, message: "Password must be at least 8 characters")
            hasErrors = true
        } else {
            showPasswordError(show: false)
        }
        
        // Validate Confirm Password
        if password != confirmPassword {
            showConfirmPasswordError(show: true, message: "Passwords do not match")
            hasErrors = true
        } else {
            showConfirmPasswordError(show: false)
        }
        
        // Navigate to the next screen only if there are no errors
        if !hasErrors {
            let registerLocation = RegisterLocation()
            navigateTo(registerLocation) // Uses the smooth fade animation
        }
    }
}
