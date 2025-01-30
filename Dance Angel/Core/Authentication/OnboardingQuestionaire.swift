//
//  OnboardingQuestionaire.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 1/19/25.
//

import UIKit

class OnboardingQuestionaire: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add headline label
        let headlineLabel = CustomLabel(style: .headerText)
        headlineLabel.text = "What best describes you?".uppercased()
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headlineLabel)
        
        // Add underheadline label
        let underheadlineLabel = CustomLabel(style: .generalText)
        underheadlineLabel.text = "(You can update this choice later)"
        underheadlineLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(underheadlineLabel)
        
        // Create the multiple-choice options using ChoicePlaceholder
        let dancerChoice = ChoicePlaceholder(title: "Dancer")
        let choreographerChoice = ChoicePlaceholder(title: "Choreographer")
        let studioOwnerChoice = ChoicePlaceholder(title: "Owner/Manager of Dance Studio")
        let rentalOwnerChoice = ChoicePlaceholder(title: "Owner of Rental Dance Space")
        let otherChoice = ChoicePlaceholder(title: "Other")
        
        // Add placeholders to the view
        view.addSubview(dancerChoice)
        view.addSubview(choreographerChoice)
        view.addSubview(studioOwnerChoice)
        view.addSubview(rentalOwnerChoice)
        view.addSubview(otherChoice)
        
        let continueButton = ActionPlaceholder(title: "Continue".uppercased())
        continueButton.addTarget(self, action: #selector(navigateToNextScreen), for: .touchUpInside)
        view.addSubview(continueButton)
        
        // Add constraints
        NSLayoutConstraint.activate([
            // Headline label constraints
            headlineLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headlineLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 126),
            
            // Underheadline label constraints
            underheadlineLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            underheadlineLabel.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 20),
            
            // Dancer choice constraints
            dancerChoice.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dancerChoice.topAnchor.constraint(equalTo: underheadlineLabel.bottomAnchor, constant: 40),
            
            // Choreographer choice constraints
            choreographerChoice.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            choreographerChoice.topAnchor.constraint(equalTo: dancerChoice.bottomAnchor, constant: 20),
            
            // Studio owner choice constraints
            studioOwnerChoice.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            studioOwnerChoice.topAnchor.constraint(equalTo: choreographerChoice.bottomAnchor, constant: 20),
            
            // Rental owner choice constraints
            rentalOwnerChoice.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rentalOwnerChoice.topAnchor.constraint(equalTo: studioOwnerChoice.bottomAnchor, constant: 20),
            
            // Other choice constraints
            otherChoice.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            otherChoice.topAnchor.constraint(equalTo: rentalOwnerChoice.bottomAnchor, constant: 20),
            
            // Position and size for the rectangle button
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),  // Center on x-axis
            continueButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 765),        // Y = 765
            continueButton.widthAnchor.constraint(equalToConstant: 264),                      // W = 264
            continueButton.heightAnchor.constraint(equalToConstant: 50),                      // H = 50
        ])
    }
    
    @objc func navigateToNextScreen() {
        let registerMain = RegisterMain()
        navigateTo(registerMain) // Uses the smooth fade animation
    }
}
