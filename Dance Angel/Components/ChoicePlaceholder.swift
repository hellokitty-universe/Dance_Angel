//
//  ChoicePlaceholder.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 1/19/25.
//

import UIKit

class ChoicePlaceholder: UIButton {
    
    // MARK: - UI Elements
    private let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.generalTextFont
        label.textColor = UIFont.generalTextColor
        label.backgroundColor = .clear
        label.textAlignment = .left // Align text to the left for 16-point margin
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black // Solid black background
        view.layer.cornerRadius = 14 // Rounded corners
        view.layer.borderWidth = 1 // Border width
        view.layer.borderColor = UIColor(red: 245/255, green: 234/255, blue: 234/255, alpha: 0.3).cgColor // Initial grey border
        view.translatesAutoresizingMaskIntoConstraints = false

        // Prevent background view from intercepting touch events
        view.isUserInteractionEnabled = false

        return view
    }()
    
    private var isSelectedState: Bool = false // Track the selection state

    // MARK: - Initializer
    init(title: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI(title: title)
        setupActions() // Setup touch actions
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupUI(title: String) {
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
        
        // Set text label properties
        textLabel.text = title
        
        // Add text label
        addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16), // 16 points from the left
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16), // 16 points from the right
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor) // Center vertically
        ])
    }
    
    private func setupActions() {
        // Add target for touch up inside event
        addTarget(self, action: #selector(toggleBorderColor), for: .touchUpInside)
    }
    
    // MARK: - Toggle Border Color
    @objc private func toggleBorderColor() {
        isSelectedState.toggle() // Toggle the state
        backgroundView.layer.borderColor = isSelectedState
            ? UIColor.white.cgColor // Change to white when selected
            : UIColor(red: 245/255, green: 234/255, blue: 234/255, alpha: 0.3).cgColor // Revert to grey
    }
}
