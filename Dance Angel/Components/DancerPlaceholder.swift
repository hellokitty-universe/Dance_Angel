//  SearchPlaceholder1.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 1/19/25.
//

import UIKit

class DancerPlaceholder: UIButton {
    
    // MARK: - UI Elements
    
    // Image view for the choreographer's picture
    private let choreographerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8 // Optional rounded corners
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Text label for the choreographer's name or company's name
    private let nameLabel: UILabel = {
        let label = CustomLabel(style: .headerText)
        label.textAlignment = .left // Align text to the left
        label.numberOfLines = 1 // Single-line text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Bullet points labels
    private let bulletPointLabels: [UILabel] = {
        let labels = ["Dance Style", "Level", "Price per Hour"].map { text -> UILabel in
            let label = CustomLabel(style: .generalText)
            label.text = "• \(text)"
            label.textAlignment = .left // Align text to the left
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }
        return labels
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black // Solid black background
        view.layer.cornerRadius = 14 // Rounded corners
        view.layer.borderWidth = 1 // Border width
        view.layer.borderColor = UIColor(red: 245/255, green: 234/255, blue: 234/255, alpha: 0.3).cgColor // Initial grey border
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var isSelectedState: Bool = false // Track the selection state
    
    // MARK: - Initializer
    init(title: String, image: UIImage?) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI(title: title, image: image)
        setupActions() // Setup touch actions
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupUI(title: String, image: UIImage?) {
        // Add background view
        addSubview(backgroundView)
        
        // Configure background view constraints
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // Updated size constraints
            self.heightAnchor.constraint(equalToConstant: 344),
            self.widthAnchor.constraint(equalToConstant: 340)
        ])
        
        // Set up the image view
        choreographerImageView.image = image // Set image if provided
        backgroundView.addSubview(choreographerImageView)
        NSLayoutConstraint.activate([
            choreographerImageView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 4), // Slight padding at the top
            choreographerImageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 2),
            choreographerImageView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -2),
            choreographerImageView.heightAnchor.constraint(equalToConstant: 206)
        ])
        
        // Set up the name label
        nameLabel.text = title // Set the name of the choreographer
        backgroundView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: choreographerImageView.bottomAnchor, constant: 10), // Spaced below the image
            nameLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 16), // Aligned to the left
            nameLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -16)
        ])
        
        // Add bullet point labels
        for (index, bulletPointLabel) in bulletPointLabels.enumerated() {
            backgroundView.addSubview(bulletPointLabel)
            NSLayoutConstraint.activate([
                bulletPointLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 16), // Aligned to the left
                bulletPointLabel.topAnchor.constraint(equalTo: index == 0
                    ? nameLabel.bottomAnchor
                    : bulletPointLabels[index - 1].bottomAnchor, constant: 8), // Spaced below the previous label
                bulletPointLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -16)
            ])
        }
    }
    
    private func setupActions() {
        // Add target for touch up inside event
        addTarget(self, action: #selector(toggleBorderColor), for: .touchUpInside)
    }
    
    // MARK: - Toggle Border Color
    @objc private func toggleBorderColor() {
        isSelectedState.toggle() // Toggle the state
        backgroundView.layer.borderColor = isSelectedState
            ? UIColor.white.cgColor // Change to white when selected
            : UIColor(red: 245/255, green: 234/255, blue: 234/255, alpha: 0.3).cgColor // Revert to grey
    }
    
    // MARK: - Public Methods
    func setChoreographerName(_ name: String) {
        nameLabel.text = name
    }
    
    func setChoreographerImage(_ image: UIImage) {
        choreographerImageView.image = image
    }
    
    func setBulletPoints(danceStyle: String, level: String, price: String) {
        bulletPointLabels[0].text = "• \(danceStyle)"
        bulletPointLabels[1].text = "• \(level)"
        bulletPointLabels[2].text = "• \(price)"
    }
}
