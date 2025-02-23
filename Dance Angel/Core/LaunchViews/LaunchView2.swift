//
//  LaunchView2.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 12/14/24.
//

import UIKit

class LaunchView2: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Add angel wings icon
        let launchView2pic = UIImageView()
        launchView2pic.image = UIImage(named: "launchView2-pic") // Load image from assets
        launchView2pic.contentMode = .scaleAspectFit
        launchView2pic.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(launchView2pic)
        
        // Add headline label
        let headlineLabel = CustomLabel(style: .headerText)
        headlineLabel.text = "Connect with other dancers".uppercased()
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headlineLabel)
        
        
        let continueButton = ActionPlaceholder(title: "Continue".uppercased())
        continueButton.addTarget(self, action: #selector(navigateToNextScreen), for: .touchUpInside)
        view.addSubview(continueButton)
        
        // Add constraints
        NSLayoutConstraint.activate([
            // Center and position the launchView2-pic image
            launchView2pic.centerXAnchor.constraint(equalTo: view.centerXAnchor),  // Center on x-axis
            launchView2pic.topAnchor.constraint(equalTo: view.topAnchor, constant: 240), // Y = 239
            launchView2pic.widthAnchor.constraint(equalToConstant: 349),                 // W = 349
            launchView2pic.heightAnchor.constraint(equalToConstant: 367),                // H = 367
            
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
        let launchView3 = LaunchView3()
        navigateTo(launchView3) // Uses the smooth fade animation
    }
}

