//
//  RegisterMain.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 12/14/24.
//

import UIKit

class RegisterMain: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        view.backgroundColor = .black
        
        // Add rectangle button
        let rectangleButton = UIButton()
        rectangleButton.setImage(UIImage(named: "ic-main_rectangle"), for: .normal) // Use image from assets
        rectangleButton.translatesAutoresizingMaskIntoConstraints = false
        rectangleButton.addTarget(self, action: #selector(navigateToNextScreen), for: .touchUpInside)
        view.addSubview(rectangleButton)
        
        // Add label on top of the rectangle button
        let buttonTextLabel = UILabel()
        buttonTextLabel.text = "Register".uppercased()
        buttonTextLabel.font = .buttonText // Use the custom font defined for buttons
        buttonTextLabel.textColor = .white
        buttonTextLabel.textAlignment = .center
        buttonTextLabel.translatesAutoresizingMaskIntoConstraints = false
        rectangleButton.addSubview(buttonTextLabel) // Add label as a subview of the button
        
        // Add credentials buttons
        let credentialsButton1 = UIButton()
        credentialsButton1.setImage(UIImage(named: "ic-credentials_rectangle"), for: .normal) // Use image from assets
        credentialsButton1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(credentialsButton1)
        
       
        let credentialsButton2 = UIButton()
        credentialsButton2.setImage(UIImage(named: "ic-credentials_rectangle"), for: .normal) // Use image from assets
        credentialsButton2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(credentialsButton2)
        
        let credentialsButton3 = UIButton()
        credentialsButton3.setImage(UIImage(named: "ic-credentials_rectangle"), for: .normal) // Use image from assets
        credentialsButton3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(credentialsButton3)
        
        // Add text fields inside credentials button
        let usernameTextField = UITextField()
        usernameTextField.attributedPlaceholder = NSAttributedString(
            string: "Username",
            attributes: [
                .foregroundColor: UIColor.white.withAlphaComponent(0.8) // White with 80% opacity
            ]
        )
        usernameTextField.font = .generalText // Use the custom font defined for buttons
        usernameTextField.textColor = UIColor.white.withAlphaComponent(0.8) // White with 80% opacity
        usernameTextField.tintColor = .white // Cursor color
        usernameTextField.textAlignment = .left // Align text to the left
        usernameTextField.backgroundColor = .clear // Transparent background
        usernameTextField.borderStyle = .none // No border
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        credentialsButton1.addSubview(usernameTextField) // Add text field as a subview of the credentials button
        
        let emailTextField = UITextField()
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [
                .foregroundColor: UIColor.white.withAlphaComponent(0.8) // White with 80% opacity
            ]
        )
        emailTextField.font = .generalText // Use the custom font defined for buttons
        emailTextField.textColor = UIColor.white.withAlphaComponent(0.8) // White with 80% opacity
        emailTextField.tintColor = .white // Cursor color
        emailTextField.textAlignment = .left // Align text to the left
        emailTextField.backgroundColor = .clear // Transparent background
        emailTextField.borderStyle = .none // No border
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        credentialsButton2.addSubview(emailTextField) // Add text field as a subview of the credentials button
        
        let passwordTextField = UITextField()
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [
                .foregroundColor: UIColor.white.withAlphaComponent(0.8) // White with 80% opacity
            ]
        )
        passwordTextField.font = .generalText // Use the custom font defined for buttons
        passwordTextField.textColor = UIColor.white.withAlphaComponent(0.8) // White with 80% opacity
        passwordTextField.tintColor = .white // Cursor color
        passwordTextField.textAlignment = .left // Align text to the left
        passwordTextField.backgroundColor = .clear // Transparent background
        passwordTextField.borderStyle = .none // No border
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        credentialsButton3.addSubview(passwordTextField) // Add text field as a subview of the credentials button
        
        // Add login question
        let loginQuestion = UILabel()
        loginQuestion.text = "Already have an account? Login"
        loginQuestion.font = .secondaryText
        loginQuestion.textColor = .white
        loginQuestion.textAlignment = .center
        loginQuestion.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginQuestion)
        
        // Add constraints
        NSLayoutConstraint.activate([
            // Position and size for the rectangle button
            rectangleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),  // Center on x-axis
            rectangleButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 710),        // Y = 710
            rectangleButton.widthAnchor.constraint(equalToConstant: 264),                      // W = 264
            rectangleButton.heightAnchor.constraint(equalToConstant: 50),                      // H = 50
            
            // Position for the label inside rectangle button
            buttonTextLabel.centerXAnchor.constraint(equalTo: rectangleButton.centerXAnchor),  // Center horizontally in the button
            buttonTextLabel.centerYAnchor.constraint(equalTo: rectangleButton.centerYAnchor),  // Center vertically in the button
            
            // Position and size for the credentials buttons
            credentialsButton1.centerXAnchor.constraint(equalTo: view.centerXAnchor),  // Center on x-axis
            credentialsButton1.topAnchor.constraint(equalTo: view.topAnchor, constant: 210),        // Y = 223
            credentialsButton1.widthAnchor.constraint(equalToConstant: 400),                      // W = 350
            credentialsButton1.heightAnchor.constraint(equalToConstant: 200),                      // H = 100
            
            // Second button positioned 100 points below the first button
                credentialsButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            credentialsButton2.topAnchor.constraint(equalTo: credentialsButton1.bottomAnchor, constant: -120), // 100 points below the first button
                credentialsButton2.widthAnchor.constraint(equalToConstant: 400),
                credentialsButton2.heightAnchor.constraint(equalToConstant: 200),
            
            credentialsButton3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            credentialsButton3.topAnchor.constraint(equalTo: credentialsButton2.bottomAnchor, constant: -120),
            credentialsButton3.widthAnchor.constraint(equalToConstant: 400),
            credentialsButton3.heightAnchor.constraint(equalToConstant: 200),
            
            // Position and size for the text field inside credentials button
            usernameTextField.leadingAnchor.constraint(equalTo: credentialsButton1.leadingAnchor, constant: 55), // 20 points from the left edge of the button
            usernameTextField.centerYAnchor.constraint(equalTo: credentialsButton1.centerYAnchor, constant: -30), // Slightly higher (negative constant)
            
            emailTextField.leadingAnchor.constraint(equalTo: credentialsButton2.leadingAnchor, constant: 55), // 20 points from the left edge of the button
            emailTextField.centerYAnchor.constraint(equalTo: credentialsButton2.centerYAnchor, constant: -30), // Slightly higher (negative constant)
            
            passwordTextField.leadingAnchor.constraint(equalTo: credentialsButton3.leadingAnchor, constant: 55), // 20 points from the left edge of the button
            passwordTextField.centerYAnchor.constraint(equalTo: credentialsButton3.centerYAnchor, constant: -30), // Slightly higher (negative constant)
            
            // Position and size for the login question
            loginQuestion.centerXAnchor.constraint(equalTo: view.centerXAnchor),  // Center on x-axis
            loginQuestion.topAnchor.constraint(equalTo: rectangleButton.bottomAnchor, constant: 30),


        ])
    }
    
    @objc func navigateToNextScreen() {
        // Navigate to the next screen
        let registerLocation = RegisterLocation() // Replace with your actual next screen
        registerLocation.modalPresentationStyle = .fullScreen
        present(registerLocation, animated: true, completion: nil)
    }
}
