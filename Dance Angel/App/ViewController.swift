//
//  ViewController.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 11/2/24.
//
//
import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create the LaunchViewController
        let launchView1 = LaunchView1()

        // Add other view controllers for the tab bar here
        let launchView2 = LaunchView2() // Replace with your next view controller
        launchView2.tabBarItem = UITabBarItem(
            title: "Main",
            image: UIImage(systemName: "star"), // Example icon
            tag: 1
        )

        // Set the view controllers for the Tab Bar
        self.viewControllers = [launchView1, launchView2]
    }
}
