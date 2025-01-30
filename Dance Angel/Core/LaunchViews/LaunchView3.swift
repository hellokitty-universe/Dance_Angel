//
//  LaunchView3.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 12/14/24.
//

import UIKit

class LaunchView3: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add angel wings icon
        let launchView3pic = UIImageView()
        launchView3pic.image = UIImage(named: "launchView3-pic") // Load image from assets
        launchView3pic.contentMode = .scaleAspectFit
        launchView3pic.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(launchView3pic)
        
        // Add headline label
        let headlineLabel = CustomLabel(style: .headerText)
        headlineLabel.text = "Find your perfect class".uppercased()
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headlineLabel)
    
        let continueButton = ActionPlaceholder(title: "Continue".uppercased())
        continueButton.addTarget(self, action: #selector(navigateToNextScreen), for: .touchUpInside)
        view.addSubview(continueButton)
        
        // Add constraints
        NSLayoutConstraint.activate([
            // Center and position the launchView2-pic image
            launchView3pic.centerXAnchor.constraint(equalTo: view.centerXAnchor),  // Center on x-axis
            launchView3pic.topAnchor.constraint(equalTo: view.topAnchor, constant: 240), // Y = 239
            launchView3pic.widthAnchor.constraint(equalToConstant: 349),                 // W = 349
            launchView3pic.heightAnchor.constraint(equalToConstant: 367),                // H = 367
            
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
        let launchView4 = LaunchView4()
        navigateTo(launchView4) // Uses the smooth fade animation
    }
}

