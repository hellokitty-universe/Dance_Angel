//
//  RegisterLoading.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 12/14/24.
//

import UIKit

class RegisterLoading: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        view.backgroundColor = .black
        
        // Add angel wings icon
        let wingsImageView = UIImageView()
        wingsImageView.image = UIImage(named: "angel-wings") // Load image from assets
        wingsImageView.contentMode = .scaleAspectFit
        wingsImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wingsImageView)

        
        // Add welcome label
        let welcomeLabel = UILabel()
        welcomeLabel.text = "finding dance angels in your city".uppercased()
        welcomeLabel.font = .introHeadline
        welcomeLabel.textColor = .white
        welcomeLabel.textAlignment = .center
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
        
        // Add constraints
        NSLayoutConstraint.activate([
            // Set the position and size for the wings image
            wingsImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),  // X = 10
            wingsImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 318),       // Y = 318
            wingsImageView.widthAnchor.constraint(equalToConstant: 373),                     // W = 373
            wingsImageView.heightAnchor.constraint(equalToConstant: 259),                    // H = 259
            
            // Set the position for the label
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37), // X = 37
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 262)        // Y = 262
        ])
        
        // Add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(navigateToNextScreen))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func navigateToNextScreen() {
        // Navigate to the next screen
        let launchView2 = LaunchView2() // Replace with your actual next screen
        launchView2.modalPresentationStyle = .fullScreen
        present(launchView2, animated: true, completion: nil)
    }
}
