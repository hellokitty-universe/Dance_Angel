//
//  ErrorLabel.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 1/15/25.
//

import UIKit

class ErrorLabel: UILabel {
    
    // MARK: - Initializer
    init() {
        super.init(frame: .zero)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLabel()
    }
    
    // MARK: - Setup Label
    private func setupLabel() {
        // Set default properties for the error label
        self.font = UIFont.secondaryTextFont // Use predefined font style
        self.textColor = .gray // Default color for the error text
        self.textAlignment = .left // Align text to the left
        self.numberOfLines = 0 // Allow multi-line error messages
        self.translatesAutoresizingMaskIntoConstraints = false // Enable Auto Layout
    }
    
    // MARK: - Set Error Message with Icon
    func setErrorMessage(_ message: String) {
        let iconAttachment = NSTextAttachment()
        if let exclamationMarkIcon = UIImage(systemName: "exclamationmark.circle.fill") {
            iconAttachment.image = exclamationMarkIcon.withTintColor(.gray, renderingMode: .alwaysOriginal)
            iconAttachment.bounds = CGRect(x: 0, y: -2, width: 16, height: 16) // Adjust size and position of the icon
        }
        
        let attributedString = NSMutableAttributedString(attachment: iconAttachment)
        attributedString.append(NSAttributedString(string: " \(message)"))
        self.attributedText = attributedString
    }
}
