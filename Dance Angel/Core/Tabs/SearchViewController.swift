//
//  SearchViewController.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 1/20/25.
//

import UIKit

class SearchViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        view.backgroundColor = .black
        
        // Add a scroll view to contain all placeholders
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        // Add a container view inside the scroll view
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(containerView)
        
        // Dancer data with bullet point details
        let dancers = [
            (title: "John Doe", image: UIImage(named: "sample-dancer-1"), style: "Hip-Hop", level: "Advanced", price: "$50/hour"),
            (title: "Jane Smith", image: UIImage(named: "sample-dancer-2"), style: "Contemporary", level: "Intermediate", price: "$40/hour"),
            (title: "Michael Johnson", image: UIImage(named: "sample-dancer-3"), style: "Ballet", level: "Beginner", price: "$30/hour"),
            (title: "Emily Davis", image: UIImage(named: "sample-dancer-4"), style: "Jazz", level: "Advanced", price: "$60/hour"),
            (title: "Chris Brown", image: UIImage(named: "sample-dancer-5"), style: "Popping", level: "Intermediate", price: "$45/hour"),
            (title: "Anna White", image: UIImage(named: "sample-dancer-6"), style: "Modern", level: "Beginner", price: "$35/hour"),
            (title: "Sophia Green", image: UIImage(named: "sample-dancer-7"), style: "Hip-Hop", level: "Intermediate", price: "$40/hour"),
            (title: "James Black", image: UIImage(named: "sample-dancer-8"), style: "Salsa", level: "Advanced", price: "$55/hour")
        ]
        
        var dancerPlaceholders: [DancerPlaceholder] = []
        
        // Create dancer placeholders
        for dancer in dancers {
            let placeholder = DancerPlaceholder(title: dancer.title, image: dancer.image)
            
            // Set bullet point details
            placeholder.setBulletPoints(danceStyle: dancer.style, level: dancer.level, price: dancer.price)
            
            dancerPlaceholders.append(placeholder)
            containerView.addSubview(placeholder)
        }
        
        // Add constraints
        NSLayoutConstraint.activate([
            // ScrollView constraints
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // ContainerView constraints
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        // Add constraints for dancer placeholders
        for (index, placeholder) in dancerPlaceholders.enumerated() {
            NSLayoutConstraint.activate([
                placeholder.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                placeholder.topAnchor.constraint(equalTo: index == 0
                    ? containerView.topAnchor
                    : dancerPlaceholders[index - 1].bottomAnchor, constant: 20)
            ])
        }
        
        // Add bottom constraint to last placeholder to allow scrolling
        if let lastPlaceholder = dancerPlaceholders.last {
            lastPlaceholder.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        }
    }
}
