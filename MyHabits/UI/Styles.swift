//
//  Styles.swift
//  MyHabits
//
//  Created by Konstantin Bolgar-Danchenko on 16.08.2022.
//

import UIKit

class Styles {
    
    static let darkGrayColor: UIColor = .systemGray
    static let mediumGrayColor: UIColor = .systemGray2
    static let lightGrayColor: UIColor = UIColor(red: 242.0/255.0, green: 242.0/255.0, blue: 247.0/255.0, alpha: 1.0)
    static let blueColor: UIColor = UIColor(red: 41.0/255.0, green: 109.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    static let greenColor: UIColor = UIColor(red: 29.0/255.0, green: 179.0/255.0, blue: 34.0/255.0, alpha: 1.0)
    static let purpleColor: UIColor = UIColor(red: 161.0/255.0, green: 22.0/255.0, blue: 204.0/255.0, alpha: 1.0)
    static let orangeColor: UIColor = UIColor(red: 255.0/255.0, green: 159.0/255.0, blue: 79.0/255.0, alpha: 1.0)
    
    static let title3Font: UIFont = UIFont.systemFont(ofSize: 20, weight: .semibold)
    static let headlineFont: UIFont = UIFont.systemFont(ofSize: 17, weight: .semibold)
    static let bodyFont: UIFont = UIFont.systemFont(ofSize: 17, weight: .regular)
    static let footnoteFont: UIFont = UIFont.systemFont(ofSize: 13, weight: .semibold)
    static let statusFootnoteFont: UIFont = UIFont.systemFont(ofSize: 13, weight: .regular)
    static let captionFont: UIFont = UIFont.systemFont(ofSize: 12, weight: .regular)
}

extension UILabel {
    
    func applyStyle(color: UIColor, font: UIFont) {
        self.textColor = color
        self.font = font
    }
}
