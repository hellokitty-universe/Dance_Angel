//
//  LaunchView2.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 12/14/24.
//

import UIKit

class LaunchView2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        view.backgroundColor = .black
        
        // Add angel wings icon
        let launchView2pic = UIImageView()
        launchView2pic.image = UIImage(named: "launchView2-pic") // Load image from assets
        launchView2pic.contentMode = .scaleAspectFit
        launchView2pic.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(launchView2pic)
        
        // Add headline label
        let headlineLabel = UILabel()
        headlineLabel.text = "Connect with other dancers".uppercased()
        headlineLabel.font = .introHeadline
        headlineLabel.textColor = .white
        headlineLabel.textAlignment = .center
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headlineLabel)
        
        // Add underheadline label
        let underheadlineLabel = UILabel()
        underheadlineLabel.text = "(P.S. with other Angels)"
        underheadlineLabel.font = .generalText
        underheadlineLabel.textColor = .white
        underheadlineLabel.textAlignment = .center
        underheadlineLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(underheadlineLabel)
        
        // Add rectangle button
        let rectangleButton = UIButton()
        rectangleButton.setImage(UIImage(named: "ic-main_rectangle"), for: .normal) // Use image from assets
        rectangleButton.translatesAutoresizingMaskIntoConstraints = false
        rectangleButton.addTarget(self, action: #selector(navigateToNextScreen), for: .touchUpInside)
        view.addSubview(rectangleButton)
        
        // Add label on top of the button
        let buttonTextLabel = UILabel()
        buttonTextLabel.text = "CONTINUE"
        buttonTextLabel.font = .buttonText // Use the custom font defined for buttons
        buttonTextLabel.textColor = .white
        buttonTextLabel.textAlignment = .center
        buttonTextLabel.translatesAutoresizingMaskIntoConstraints = false
        rectangleButton.addSubview(buttonTextLabel) // Add label as a subview of the button
        
        // Add constraints
        NSLayoutConstraint.activate([
            // Center and position the launchView2-pic image
            launchView2pic.centerXAnchor.constraint(equalTo: view.centerXAnchor),  // Center on x-axis
            launchView2pic.topAnchor.constraint(equalTo: view.topAnchor, constant: 239), // Y = 239
            launchView2pic.widthAnchor.constraint(equalToConstant: 349),                 // W = 349
            launchView2pic.heightAnchor.constraint(equalToConstant: 367),                // H = 367
            
            // Center and position the headline label
            headlineLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),        // Center on x-axis
            headlineLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 126), // Y = 126
            
            // Center and position the underheadline label
            underheadlineLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),           // Center on x-axis
            underheadlineLabel.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 20), // Below the headline
            
            // Position and size for the rectangle button
            rectangleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),  // Center on x-axis
            rectangleButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 710),        // Y = 710
            rectangleButton.widthAnchor.constraint(equalToConstant: 264),                      // W = 264
            rectangleButton.heightAnchor.constraint(equalToConstant: 50),                      // H = 50
            
            // Position for the button text label
            buttonTextLabel.centerXAnchor.constraint(equalTo: rectangleButton.centerXAnchor),  // Center horizontally in the button
            buttonTextLabel.centerYAnchor.constraint(equalTo: rectangleButton.centerYAnchor),  // Center vertically in the button
        ])
    }
    
    @objc func navigateToNextScreen() {
        // Navigate to the next screen
        let launchView3 = LaunchView3() // Replace with your actual next screen
        launchView3.modalPresentationStyle = .fullScreen
        present(launchView3, animated: true, completion: nil)
    }
}

