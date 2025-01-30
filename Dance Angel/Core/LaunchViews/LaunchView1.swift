//
//  LaunchView1.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 12/14/24.
//

import UIKit

class LaunchView1: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add angel wings icon
        let wingsImageView = UIImageView()
        wingsImageView.image = UIImage(named: "angel-wings")
        wingsImageView.contentMode = .scaleAspectFit
        wingsImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wingsImageView)

        
        // Add welcome label
        let welcomeLabel = CustomLabel(style: .headerText)
        welcomeLabel.text = "Welcome to dance angels".uppercased()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
        
        // Add constraints
        NSLayoutConstraint.activate([
            wingsImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wingsImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 318),
            wingsImageView.widthAnchor.constraint(equalToConstant: 373),
            wingsImageView.heightAnchor.constraint(equalToConstant: 259),
         
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 262)
        ])
        
        // Add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(navigateToNextScreen))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func navigateToNextScreen() {
        let launchView2 = LaunchView2()
        navigateTo(launchView2) // Uses the smooth fade animation
    }

}
