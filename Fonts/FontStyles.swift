//
//  UIFont+Custom.swift
//  Dance Angel
//
//  Created by Viktoriia Danutsa on 12/14/24.
//

import UIKit

extension UIFont {
    static var introHeadline: UIFont {
        return UIFont(name: "ArchivoBlack-Regular", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    static var buttonText: UIFont {
        return UIFont(name: "ArchivoBlack-Regular", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .bold)
    }
    
    static var generalText: UIFont {
        return UIFont(name: "Roboto-Regular", size: 19) ?? UIFont.systemFont(ofSize: 19)
    }
    
    static var secondaryText: UIFont {
        return UIFont(name: "Roboto-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16)
    }
}
