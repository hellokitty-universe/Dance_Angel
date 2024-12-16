//
//  RegisterLocation.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 12/14/24.
//

import UIKit

class RegisterLocation: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Data for the dropdown menu
    let cities = ["San Francisco", "Los Gatos", "Los Angeles"]
    var selectedCity: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        view.backgroundColor = .black
        
        // Add headline label
        let headlineLabel = UILabel()
        headlineLabel.text = "Choose your city".uppercased()
        headlineLabel.font = .introHeadline
        headlineLabel.textColor = .white
        headlineLabel.textAlignment = .center
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headlineLabel)
        
        // Add picker view for dropdown menu
        let cityPicker = UIPickerView()
        cityPicker.delegate = self
        cityPicker.dataSource = self
        cityPicker.backgroundColor = .clear
        cityPicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cityPicker)
        
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
            // Center and position the headline label
            headlineLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),        // Center on x-axis
            headlineLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 126), // Y = 126
            
            // Position and size for the city picker
            cityPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center on x-axis
            cityPicker.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 20), // Below headline label
            cityPicker.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8), // 80% of the screen width
            cityPicker.heightAnchor.constraint(equalToConstant: 150), // Fixed height
            
            // Position and size for the rectangle button
            rectangleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),  // Center on x-axis
            rectangleButton.topAnchor.constraint(equalTo: cityPicker.bottomAnchor, constant: 40),        // Below city picker
            rectangleButton.widthAnchor.constraint(equalToConstant: 264),                      // W = 264
            rectangleButton.heightAnchor.constraint(equalToConstant: 50),                      // H = 50
            
            // Position for the button text label
            buttonTextLabel.centerXAnchor.constraint(equalTo: rectangleButton.centerXAnchor),  // Center horizontally in the button
            buttonTextLabel.centerYAnchor.constraint(equalTo: rectangleButton.centerYAnchor),  // Center vertically in the button
        ])
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // Single column for cities
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count // Number of cities
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row] // City name for each row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = cities[row] // Update the selected city
        print("Selected city: \(selectedCity ?? "None")") // Debugging print
    }
    
    @objc func navigateToNextScreen() {
        // Check if a city is selected
        guard let selectedCity = selectedCity else {
            print("No city selected") // Debugging print
            return
        }
        
        print("Navigating with selected city: \(selectedCity)") // Debugging print
        
        // Navigate to the next screen
        let launchView3 = LaunchView3() // Replace with your actual next screen
        launchView3.modalPresentationStyle = .fullScreen
        present(launchView3, animated: true, completion: nil)
    }
}
