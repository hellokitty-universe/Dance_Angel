//
//  AddSpaceRental.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 1/20/25.
//

import UIKit

class AddSpaceRental: BaseViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private let studioNameErrorLabel = ErrorLabel()
    private let addressErrorLabel = ErrorLabel()
    private let businessHoursErrorLabel = ErrorLabel()
    private let contactNumberErrorLabel = ErrorLabel()
    
    private var studioNameErrorLabelHeightConstraint: NSLayoutConstraint!
    private var addressErrorLabelHeightConstraint: NSLayoutConstraint!
    private var businessHoursErrorLabelHeightConstraint: NSLayoutConstraint!
    private var contactNumberErrorLabelHeightConstraint: NSLayoutConstraint!
    
    private let imagePlaceholder: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Upload Image", for: .normal)
        button.titleLabel?.font = UIFont.secondaryTextFont
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background color to black
        view.backgroundColor = .black
        
        // Hide the tab bar
        self.tabBarController?.tabBar.isHidden = true
        
        // Set up error labels
        studioNameErrorLabel.isHidden = true
        addressErrorLabel.isHidden = true
        businessHoursErrorLabel.isHidden = true
        contactNumberErrorLabel.isHidden = true
        view.addSubview(studioNameErrorLabel)
        view.addSubview(addressErrorLabel)
        view.addSubview(businessHoursErrorLabel)
        view.addSubview(contactNumberErrorLabel)
        
        let postButton = ActionPlaceholder(title: "POST".uppercased())
        postButton.addTarget(self, action: #selector(postRentalDetails), for: .touchUpInside)
        view.addSubview(postButton)
        
        // Add credentials placeholders
        let studioNamePlaceholder = CredentialsPlaceholder(placeholder: "Studio Name (if applicable)")
        let addressPlaceholder = CredentialsPlaceholder(placeholder: "Address")
        let businessHoursPlaceholder = CredentialsPlaceholder(placeholder: "Business Hours")
        let contactNumberPlaceholder = CredentialsPlaceholder(placeholder: "Contact Number")
        
        studioNamePlaceholder.textField.delegate = self
        addressPlaceholder.textField.delegate = self
        businessHoursPlaceholder.textField.delegate = self
        contactNumberPlaceholder.textField.delegate = self
        
        view.addSubview(studioNamePlaceholder)
        view.addSubview(addressPlaceholder)
        view.addSubview(businessHoursPlaceholder)
        view.addSubview(contactNumberPlaceholder)
        view.addSubview(imagePlaceholder)
        
        imagePlaceholder.addTarget(self, action: #selector(uploadImageTapped), for: .touchUpInside)
        
        // Add constraints
        studioNameErrorLabelHeightConstraint = studioNameErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        addressErrorLabelHeightConstraint = addressErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        businessHoursErrorLabelHeightConstraint = businessHoursErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        contactNumberErrorLabelHeightConstraint = contactNumberErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        
        NSLayoutConstraint.activate([
            // Studio Name Placeholder
            studioNamePlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            studioNamePlaceholder.topAnchor.constraint(equalTo: view.topAnchor, constant: 240),
            
            // Studio Name Error Label
            studioNameErrorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            studioNameErrorLabel.topAnchor.constraint(equalTo: studioNamePlaceholder.bottomAnchor, constant: 10),
            studioNameErrorLabelHeightConstraint,
            
            // Address Placeholder
            addressPlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addressPlaceholder.topAnchor.constraint(equalTo: studioNamePlaceholder.bottomAnchor, constant: 30),
            
            // Address Error Label
            addressErrorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            addressErrorLabel.topAnchor.constraint(equalTo: addressPlaceholder.bottomAnchor, constant: 10),
            addressErrorLabelHeightConstraint,
            
            // Business Hours Placeholder
            businessHoursPlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            businessHoursPlaceholder.topAnchor.constraint(equalTo: addressPlaceholder.bottomAnchor, constant: 30),
            
            // Business Hours Error Label
            businessHoursErrorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            businessHoursErrorLabel.topAnchor.constraint(equalTo: businessHoursPlaceholder.bottomAnchor, constant: 10),
            businessHoursErrorLabelHeightConstraint,
            
            // Contact Number Placeholder
            contactNumberPlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contactNumberPlaceholder.topAnchor.constraint(equalTo: businessHoursPlaceholder.bottomAnchor, constant: 30),
            
            // Contact Number Error Label
            contactNumberErrorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            contactNumberErrorLabel.topAnchor.constraint(equalTo: contactNumberPlaceholder.bottomAnchor, constant: 10),
            contactNumberErrorLabelHeightConstraint,
            
            // Image Placeholder
            imagePlaceholder.topAnchor.constraint(equalTo: contactNumberPlaceholder.bottomAnchor, constant: 30),
            imagePlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagePlaceholder.widthAnchor.constraint(equalToConstant: 150),
            imagePlaceholder.heightAnchor.constraint(equalToConstant: 100),
            
            // Post Button
            postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButton.topAnchor.constraint(equalTo: imagePlaceholder.bottomAnchor, constant: 30),
            postButton.widthAnchor.constraint(equalToConstant: 264),
            postButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    // MARK: - Actions
    @objc private func uploadImageTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc private func postRentalDetails() {
        // Fetch text values
        let allFieldsFilled = view.subviews
            .compactMap { $0 as? CredentialsPlaceholder }
            .allSatisfy { !($0.textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true) }
        
        guard allFieldsFilled else {
            let alert = UIAlertController(title: "Error", message: "All fields are required.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        // Navigate to ProfileViewController
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imagePlaceholder.setImage(selectedImage, for: .normal)
            imagePlaceholder.setTitle(nil, for: .normal) // Remove placeholder text
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
