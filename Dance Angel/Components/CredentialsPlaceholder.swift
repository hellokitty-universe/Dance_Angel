//
//  CredentialsPlaceholder.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 1/15/25.
//

import UIKit

class CredentialsPlaceholder: UIButton {
    
    // MARK: - UI Elements
    let textField: UITextField = {
            let textField = UITextField()
            textField.font = UIFont.generalTextFont
            textField.textColor = UIFont.generalTextColor
            textField.tintColor = UIFont.generalTextColor
            textField.backgroundColor = .clear
            textField.borderStyle = .none
            textField.textAlignment = .left
            textField.autocapitalizationType = .none
            textField.autocorrectionType = .no
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        // Convert hex color F5EAEA with 30% opacity
        view.backgroundColor = UIColor(red: 245/255, green: 234/255, blue: 234/255, alpha: 0.3)
        view.layer.cornerRadius = 14  // Updated corner radius to 14
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initializer
    init(placeholder: String, isSecure: Bool = false) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI(placeholder: placeholder, isSecure: isSecure)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupUI(placeholder: String, isSecure: Bool) {
        // Add background view
        addSubview(backgroundView)
        
        // Configure background view constraints
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // Updated size constraints
            self.heightAnchor.constraint(equalToConstant: 50),
            self.widthAnchor.constraint(equalToConstant: 312)
        ])
        
        // Configure text field
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                .foregroundColor: UIColor.white.withAlphaComponent(0.7),
                .font: UIFont.systemFont(ofSize: 18)
            ]
        )
        textField.isSecureTextEntry = isSecure
        
        // Add and configure text field
        addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
