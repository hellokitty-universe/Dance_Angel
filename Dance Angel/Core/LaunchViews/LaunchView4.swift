//
//  LaunchView4.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 12/14/24.
//

import UIKit

class LaunchView4: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add angel wings icon
        let launchView4pic = UIImageView()
        launchView4pic.image = UIImage(named: "launchView4-pic") // Load image from assets
        launchView4pic.contentMode = .scaleAspectFit
        launchView4pic.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(launchView4pic)
        
        //// Add headline label
        let headlineLabel = CustomLabel(style: .headerText)
        headlineLabel.text = "Book studio in seconds".uppercased()
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headlineLabel)
    
        let continueButton = ActionPlaceholder(title: "Continue".uppercased())
        continueButton.addTarget(self, action: #selector(navigateToNextScreen), for: .touchUpInside)
        view.addSubview(continueButton)
        
        // Add constraints
        NSLayoutConstraint.activate([
            // Center and position the launchView2-pic image
            launchView4pic.centerXAnchor.constraint(equalTo: view.centerXAnchor),  // Center on x-axis
            launchView4pic.topAnchor.constraint(equalTo: view.topAnchor, constant: 240), // Y = 239
            launchView4pic.widthAnchor.constraint(equalToConstant: 349),                 // W = 349
            launchView4pic.heightAnchor.constraint(equalToConstant: 367),                // H = 367
            
            // Center and position the headline label
            headlineLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),        // Center on x-axis
            headlineLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 126), // Y = 126
          
            // Position and size for the rectangle button
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),  // Center on x-axis
            continueButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 765),        // Y = 710
            continueButton.widthAnchor.constraint(equalToConstant: 264),                      // W = 264
            continueButton.heightAnchor.constraint(equalToConstant: 50),                      // H = 50
            
        ])
    }
    
    @objc func navigateToNextScreen() {
        let onboardingQuestionaire = OnboardingQuestionaire()
        navigateTo(onboardingQuestionaire) // Uses the smooth fade animation
    }
}

