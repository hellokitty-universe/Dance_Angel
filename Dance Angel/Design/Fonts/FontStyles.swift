//
//  UIFont+Custom.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 12/14/24.
//

import UIKit

extension UIFont {

    // MARK: - Font Styles with Predefined Colors and Shadows
    static let headerTextFont = UIFont(name: "ArchivoBlack-Regular", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .bold)
    static let headerTextColor = UIColor(hex: "#FFFFFF") // Pure white, no opacity
    static let headerTextShadow: NSShadow = {
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.black.withAlphaComponent(0.3)
        shadow.shadowOffset = CGSize(width: 1, height: 1)
        shadow.shadowBlurRadius = 1
        return shadow
    }()

    static let actionTextFont = UIFont(name: "ArchivoBlack-Regular", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .bold)
    static let actionTextColor = UIColor(hex: "#FFFFFF") // Pure white
    static let actionTextShadow: NSShadow = {
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.black.withAlphaComponent(0.3)
        shadow.shadowOffset = CGSize(width: 1, height: 1)
        shadow.shadowBlurRadius = 2
        return shadow
    }()

    static let generalTextFont = UIFont(name: "Roboto-Regular", size: 18) ?? UIFont.systemFont(ofSize: 18)
    static let generalTextColor = UIColor(hex: "#FFFFFF").withAlphaComponent(0.7) // White with 80% opacity

    static let secondaryTextFont = UIFont(name: "Roboto-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16)
    static let secondaryTextColor = UIColor(hex: "#FFFFFF") // Pure white
}

// MARK: - Custom UILabel with Predefined Styles
class CustomLabel: UILabel {

    enum Style {
        case headerText
        case actionText
        case generalText
        case secondaryText
    }

    init(style: Style) {
        super.init(frame: .zero)
        applyStyle(style)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func applyStyle(_ style: Style) {
        switch style {
        case .headerText:
            font = UIFont.headerTextFont
            textColor = UIFont.headerTextColor
            applyShadow(UIFont.headerTextShadow)

        case .actionText:
            font = UIFont.actionTextFont
            textColor = UIFont.actionTextColor
            applyShadow(UIFont.actionTextShadow)

        case .generalText:
            font = UIFont.generalTextFont
            textColor = UIFont.generalTextColor

        case .secondaryText:
            font = UIFont.secondaryTextFont
            textColor = UIFont.secondaryTextColor
        }
    }

    private func applyShadow(_ shadow: NSShadow) {
        layer.shadowColor = (shadow.shadowColor as? UIColor)?.cgColor
        layer.shadowOffset = shadow.shadowOffset
        layer.shadowOpacity = 1
        layer.shadowRadius = shadow.shadowBlurRadius
        layer.masksToBounds = false
    }
}

 // MARK: - UIColor Hex Helper
extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

// MARK: - Custom UIButton with Predefined Styles
extension UIButton {
    enum Style {
        case generalText
    }

    func applyStyle(_ style: Style) {
        switch style {
        case .generalText:
            self.titleLabel?.font = UIFont.generalTextFont
            self.setTitleColor(UIFont.generalTextColor, for: .normal)
        }
    }
}


