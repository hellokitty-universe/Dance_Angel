//
//  RegisterLocation.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 1/19/25.
//

import UIKit

class RegisterLocation: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add a scroll view to contain all placeholders
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        // Add a container view inside the scroll view
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(containerView)
        
        // Add headline label
        let headlineLabel = CustomLabel(style: .headerText)
        headlineLabel.text = "Choose your city".uppercased()
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headlineLabel)
        
        // Add underheadline label
        let underheadlineLabel = CustomLabel(style: .generalText)
        underheadlineLabel.text = "(You can update this choice later)"
        underheadlineLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(underheadlineLabel)
        
        // City options
        let cities = [
            "San Francisco", "Los Gatos", "Oakland", "Fremont",
            "San Jose", "Stockton", "Sacramento", "Los Angeles",
            "San Diego", "New York", "Chicago", "Miami"
        ]
        
        var cityPlaceholders: [ChoicePlaceholder] = []
        
        // Create city placeholders
        for city in cities {
            let placeholder = ChoicePlaceholder(title: city)
            cityPlaceholders.append(placeholder)
            containerView.addSubview(placeholder)
        }
        
        let continueButton = ActionPlaceholder(title: "Continue".uppercased())
        continueButton.addTarget(self, action: #selector(navigateToNextScreen), for: .touchUpInside)
        view.addSubview(continueButton)
        
        // Add constraints
        NSLayoutConstraint.activate([
            // ScrollView constraints
            scrollView.topAnchor.constraint(equalTo: underheadlineLabel.bottomAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -20),
            
            // ContainerView constraints
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // Headline label constraints
            headlineLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headlineLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 126),
            
            // Underheadline label constraints
            underheadlineLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            underheadlineLabel.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 20),
            
            // Continue button constraints
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            continueButton.widthAnchor.constraint(equalToConstant: 264),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        // Add constraints for city placeholders
        for (index, placeholder) in cityPlaceholders.enumerated() {
            NSLayoutConstraint.activate([
                placeholder.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                placeholder.topAnchor.constraint(equalTo: index == 0
                    ? containerView.topAnchor
                    : cityPlaceholders[index - 1].bottomAnchor, constant: 20)
            ])
        }
        
        // Add bottom constraint to last placeholder to allow scrolling
        if let lastPlaceholder = cityPlaceholders.last {
            lastPlaceholder.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        }
    }
    
    @objc func navigateToNextScreen() {
        // Proceed to the next screen without validation
        let registerLoading = RegisterLoading() // Replace with the actual next screen class
        navigateTo(registerLoading) // Smooth fade animation
    }
}
