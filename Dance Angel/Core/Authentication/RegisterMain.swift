//
//  RegisterMain.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 12/14/24.
//

import UIKit

class RegisterMain: BaseViewController, UITextFieldDelegate {
    
    private let firstNameErrorLabel = ErrorLabel() // Error label for first name
    private let lastNameErrorLabel = ErrorLabel() // Error label for last name
    private let emailErrorLabel = ErrorLabel() // Error label for email
    
    private var firstNameErrorLabelHeightConstraint: NSLayoutConstraint!
    private var lastNameErrorLabelHeightConstraint: NSLayoutConstraint!
    private var emailErrorLabelHeightConstraint: NSLayoutConstraint!
    private var lastNamePlaceholderTopConstraint: NSLayoutConstraint!
    private var emailPlaceholderTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up error labels
        firstNameErrorLabel.isHidden = true
        lastNameErrorLabel.isHidden = true
        emailErrorLabel.isHidden = true
        
        view.addSubview(firstNameErrorLabel)
        view.addSubview(lastNameErrorLabel)
        view.addSubview(emailErrorLabel)
        
        let registerButton = ActionPlaceholder(title: "Sign up".uppercased())
        registerButton.addTarget(self, action: #selector(navigateToNextScreen), for: .touchUpInside)
        view.addSubview(registerButton)
        
        // Add credentials placeholders
        let firstNamePlaceholder = CredentialsPlaceholder(placeholder: "First Name")
        let lastNamePlaceholder = CredentialsPlaceholder(placeholder: "Last Name")
        let emailPlaceholder = CredentialsPlaceholder(placeholder: "Email")
        
        // Assign text field delegates
        firstNamePlaceholder.textField.delegate = self
        lastNamePlaceholder.textField.delegate = self
        emailPlaceholder.textField.delegate = self
        
        // Add placeholders to the view
        view.addSubview(firstNamePlaceholder)
        view.addSubview(lastNamePlaceholder)
        view.addSubview(emailPlaceholder)
        
        // Add login question
        let loginQuestion = CustomLabel(style: .secondaryText)
        loginQuestion.text = "Already have an account? Login"
        loginQuestion.textAlignment = .center
        loginQuestion.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginQuestion)
        
        // Add constraints
        firstNameErrorLabelHeightConstraint = firstNameErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        lastNameErrorLabelHeightConstraint = lastNameErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        emailErrorLabelHeightConstraint = emailErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        
        lastNamePlaceholderTopConstraint = lastNamePlaceholder.topAnchor.constraint(equalTo: firstNamePlaceholder.bottomAnchor, constant: 30)
        emailPlaceholderTopConstraint = emailPlaceholder.topAnchor.constraint(equalTo: lastNamePlaceholder.bottomAnchor, constant: 30)
        
        NSLayoutConstraint.activate([
            // Register button constraints
            // Continue button constraints
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            registerButton.widthAnchor.constraint(equalToConstant: 264),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            
            // First Name Placeholder
            firstNamePlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstNamePlaceholder.topAnchor.constraint(equalTo: view.topAnchor, constant: 240),
            
            // First Name Error Label
            firstNameErrorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            firstNameErrorLabel.topAnchor.constraint(equalTo: firstNamePlaceholder.bottomAnchor, constant: 10),
            firstNameErrorLabelHeightConstraint,
            
            // Last Name Placeholder
            lastNamePlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lastNamePlaceholderTopConstraint,
            
            // Last Name Error Label
            lastNameErrorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            lastNameErrorLabel.topAnchor.constraint(equalTo: lastNamePlaceholder.bottomAnchor, constant: 10),
            lastNameErrorLabelHeightConstraint,
            
            // Email Placeholder
            emailPlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailPlaceholderTopConstraint,
            
            // Email Error Label
            emailErrorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            emailErrorLabel.topAnchor.constraint(equalTo: emailPlaceholder.bottomAnchor, constant: 10),
            emailErrorLabelHeightConstraint,
            
            // Login question constraints
            loginQuestion.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginQuestion.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 10),
        ])
    }
    
    // MARK: - Validation
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.placeholder == "First Name" {
            guard let firstName = textField.text, !firstName.trimmingCharacters(in: .whitespaces).isEmpty else {
                showFirstNameError(show: true, message: "Please enter your first name")
                return
            }
            showFirstNameError(show: false)
        }
        
        if textField.placeholder == "Last Name" {
            guard let lastName = textField.text, !lastName.trimmingCharacters(in: .whitespaces).isEmpty else {
                showLastNameError(show: true, message: "Please enter your last name")
                return
            }
            showLastNameError(show: false)
        }
        
        if textField.placeholder == "Email" {
            guard let email = textField.text, isValidEmail(email) else {
                showEmailError(show: true, message: "Email is not valid")
                return
            }
            showEmailError(show: false)
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        // Regex pattern for email validation
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func showFirstNameError(show: Bool, message: String = "") {
        if show {
            firstNameErrorLabel.setErrorMessage(message)
            lastNamePlaceholderTopConstraint.constant = 55
            firstNameErrorLabelHeightConstraint.constant = 30
            firstNameErrorLabel.isHidden = false
        } else {
            firstNameErrorLabelHeightConstraint.constant = 0
            lastNamePlaceholderTopConstraint.constant = 30
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func showLastNameError(show: Bool, message: String = "") {
        if show {
            lastNameErrorLabel.setErrorMessage(message)
            emailPlaceholderTopConstraint.constant = 55
            lastNameErrorLabelHeightConstraint.constant = 30
            lastNameErrorLabel.isHidden = false
        } else {
            lastNameErrorLabelHeightConstraint.constant = 0
            emailPlaceholderTopConstraint.constant = 30
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func showEmailError(show: Bool, message: String = "") {
        if show {
            emailErrorLabel.setErrorMessage(message)
            emailErrorLabelHeightConstraint.constant = 30
            emailErrorLabel.isHidden = false
        } else {
            emailErrorLabelHeightConstraint.constant = 0
            emailErrorLabel.isHidden = true
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func navigateToNextScreen() {
        // Fetch text values from all placeholders
        let firstName = (view.subviews.first { $0 is CredentialsPlaceholder && ($0 as! CredentialsPlaceholder).textField.placeholder == "First Name" } as? CredentialsPlaceholder)?.textField.text
        let lastName = (view.subviews.first { $0 is CredentialsPlaceholder && ($0 as! CredentialsPlaceholder).textField.placeholder == "Last Name" } as? CredentialsPlaceholder)?.textField.text
        let email = (view.subviews.first { $0 is CredentialsPlaceholder && ($0 as! CredentialsPlaceholder).textField.placeholder == "Email" } as? CredentialsPlaceholder)?.textField.text
        
        var hasErrors = false
        
        // Validate First Name
        if firstName?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true {
            showFirstNameError(show: true, message: "Please enter your first name")
            hasErrors = true
        } else {
            showFirstNameError(show: false)
        }
        
        // Validate Last Name
        if lastName?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true {
            showLastNameError(show: true, message: "Please enter your last name")
            hasErrors = true
        } else {
            showLastNameError(show: false)
        }
        
        // Validate Email
        if !isValidEmail(email ?? "") {
            showEmailError(show: true, message: "Email is not valid")
            hasErrors = true
        } else {
            showEmailError(show: false)
        }
        
        if !hasErrors {
            let registerLocation = RegisterLocation()
            navigateTo(registerLocation)
        }
    }
}
