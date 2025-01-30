//
//  RegisterLoading.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 12/14/24.
//

import UIKit

class RegisterLoading: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Add angel wings icon
        let wingsImageView = UIImageView()
        wingsImageView.image = UIImage(named: "angel-wings") // Load image from assets
        wingsImageView.contentMode = .scaleAspectFit
        wingsImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wingsImageView)
        
        // Add welcome label
        let welcomeLabel = CustomLabel(style: .headerText)
        welcomeLabel.text = "Finding dance angels\nin your city".uppercased()
        welcomeLabel.textAlignment = .center
        welcomeLabel.numberOfLines = 0 // Allow multiple lines
        welcomeLabel.lineBreakMode = .byWordWrapping
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
        
        // Loading bar container
        let loadingContainer = UIView()
        loadingContainer.backgroundColor = .black // Black background
        loadingContainer.layer.borderWidth = 1
        loadingContainer.layer.borderColor = UIColor.white.cgColor // White border
        loadingContainer.layer.cornerRadius = 8
        loadingContainer.clipsToBounds = true
        loadingContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingContainer)
        
        // Loading bar (progress view)
        let loadingBar = UIView()
        loadingBar.backgroundColor = .white // White color to fill the bar
        loadingBar.translatesAutoresizingMaskIntoConstraints = false
        loadingContainer.addSubview(loadingBar)
        
        // Add constraints
        NSLayoutConstraint.activate([
            // Position and size for the wings image
            wingsImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),  // X = 10
            wingsImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 318),       // Y = 318
            wingsImageView.widthAnchor.constraint(equalToConstant: 373),                     // W = 373
            wingsImageView.heightAnchor.constraint(equalToConstant: 259),                    // H = 259
            
            // Set the position for the label
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), // X = 37
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 262),       // Y = 262
            
            // Position and size for the loading container
            loadingContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingContainer.topAnchor.constraint(equalTo: wingsImageView.bottomAnchor, constant: 120),
            loadingContainer.widthAnchor.constraint(equalToConstant: 264),
            loadingContainer.heightAnchor.constraint(equalToConstant: 20),
            
            // Position and size for the loading bar (initially zero width)
            loadingBar.leadingAnchor.constraint(equalTo: loadingContainer.leadingAnchor),
            loadingBar.topAnchor.constraint(equalTo: loadingContainer.topAnchor),
            loadingBar.bottomAnchor.constraint(equalTo: loadingContainer.bottomAnchor),
            loadingBar.widthAnchor.constraint(equalToConstant: 0) // Start with no width
        ])
        
        // Animate the loading bar to fill
        view.layoutIfNeeded() // Ensure the layout is updated before starting the animation
        animateLoadingBar(loadingBar: loadingBar, containerWidth: 264)
    }
    
    func animateLoadingBar(loadingBar: UIView, containerWidth: CGFloat) {
        UIView.animate(withDuration: 4.5, delay: 0.0, options: [.curveEaseInOut], animations: {
            loadingBar.frame.size.width = containerWidth // Fill the container
        }, completion: { _ in
            self.redirectToSearchPage() // Redirect after animation completes
        })
    }
    
    func redirectToSearchPage() {
        let mainTabBarController = MainTabBarController()
        mainTabBarController.selectedIndex = 1 // Select the Search tab by default
        mainTabBarController.modalPresentationStyle = .fullScreen // Ensure full screen
        self.present(mainTabBarController, animated: true, completion: nil)
    }
}
