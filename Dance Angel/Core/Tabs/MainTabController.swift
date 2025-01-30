//
//  MainTabBarController.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 1/20/25.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the tab bar appearance
        tabBar.tintColor = .white // Active icon color
        tabBar.unselectedItemTintColor = UIColor(white: 1.0, alpha: 0.7) // Semi-transparent white color for inactive icons
        tabBar.barStyle = .black // Black background for the tab bar
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .black // Explicitly set the background color to black

        
        // Create view controllers for each tab
        let matchVC = UINavigationController(rootViewController: MatchViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        
        // Set icons for each tab without titles
        matchVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        searchVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
        profileVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        // Assign view controllers to the tab bar
        viewControllers = [matchVC, searchVC, profileVC]
    }
}
