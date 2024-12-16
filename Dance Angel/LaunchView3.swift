//
//  LaunchView3.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 12/14/24.
//

import UIKit

class LaunchView3: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        view.backgroundColor = .black
        
        // Add angel wings icon
        let launchView3pic = UIImageView()
        launchView3pic.image = UIImage(named: "launchView3-pic") // Load image from assets
        launchView3pic.contentMode = .scaleAspectFit
        launchView3pic.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(launchView3pic)
        
        // Add headline label
        let headlineLabel = UILabel()
        headlineLabel.text = "Find your perfect class".uppercased()
        headlineLabel.font = .introHeadline
        headlineLabel.textColor = .white
        headlineLabel.textAlignment = .center
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headlineLabel)
    
        
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
            launchView3pic.centerXAnchor.constraint(equalTo: view.centerXAnchor),  // Center on x-axis
            launchView3pic.topAnchor.constraint(equalTo: view.topAnchor, constant: 239), // Y = 239
            launchView3pic.widthAnchor.constraint(equalToConstant: 349),                 // W = 349
            launchView3pic.heightAnchor.constraint(equalToConstant: 367),                // H = 367
            
            // Center and position the headline label
            headlineLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),        // Center on x-axis
            headlineLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 126), // Y = 126
          
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
        let launchView4 = LaunchView4() // Replace with your actual next screen
        launchView4.modalPresentationStyle = .fullScreen
        present(launchView4, animated: true, completion: nil)
    }
}

