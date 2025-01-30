//
//  ProfileViewController.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 1/20/25.
//

import UIKit

class ProfileViewController: BaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - UI Elements
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle") // Default system icon
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40 // Circular appearance
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = CustomLabel(style: .generalText)
        label.text = "Viktoriia Danutsa"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let postClassesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.setTitle(" Post my dance classes", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.generalTextFont
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let addStudioRentalButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.setTitle(" Add studio rental", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.generalTextFont
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        view.backgroundColor = .black
        
        // Add subviews
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(postClassesButton)
        view.addSubview(addStudioRentalButton)
        
        // Add tap gesture to profile image
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(tapGesture)
        
        // Add target for buttons
        addStudioRentalButton.addTarget(self, action: #selector(navigateToAddSpaceRental), for: .touchUpInside)
        
        // Set constraints
        NSLayoutConstraint.activate([
            // Profile Image View Constraints
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
            
            // Name Label Constraints
            nameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            // Post Classes Button Constraints
            postClassesButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 40),
            postClassesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            postClassesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            postClassesButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Add Studio Rental Button Constraints
            addStudioRentalButton.topAnchor.constraint(equalTo: postClassesButton.bottomAnchor, constant: 20),
            addStudioRentalButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addStudioRentalButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addStudioRentalButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    // MARK: - Actions
    @objc private func profileImageTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc private func navigateToAddSpaceRental() {
        let addSpaceRental = AddSpaceRental() // Replace with your actual AddSpaceRental screen class
        navigationController?.pushViewController(addSpaceRental, animated: true)
    }
    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            profileImageView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
