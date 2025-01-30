//
//  ActionPlaceholder.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 1/15/25.

import UIKit

class ActionPlaceholder: UIButton {
    
    // MARK: - UI Elements
    private let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.actionTextFont
        label.textColor = UIFont.actionTextColor
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 14
        view.translatesAutoresizingMaskIntoConstraints = false

        // Create gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor,          // #FFFFFF
            UIColor(red: 0.26, green: 0.26, blue: 0.26, alpha: 1).cgColor  // #434343
        ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        view.layer.insertSublayer(gradientLayer, at: 0)

        // Prevent background view from intercepting touch events
        view.isUserInteractionEnabled = false

        return view
    }()
    
    // MARK: - Initializer
    init(title: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI(title: title)
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
            self.widthAnchor.constraint(equalToConstant: 264)
        ])
        
        // Set text label properties
        textLabel.text = title
        
        // Add text label
        addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        // Update gradient layer frame when view is laid out
        if let gradientLayer = backgroundView.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = backgroundView.bounds
            gradientLayer.cornerRadius = backgroundView.layer.cornerRadius
        }
    }
}
