//
//  File.swift
//  MyHabits
//
//  Created by Konstantin Bolgar-Danchenko on 16.08.2022.
//

import UIKit

extension UIView {
    
    static var reuseID: String {
        return String(describing: Self.self)
    }
    
    func roundCornerWithRadius(
        _ radius: CGFloat,
        top: Bool? = true,
        bottom: Bool? = true,
        shadowEnabled: Bool = true
    ) {
        var maskedCorners = CACornerMask()
        
        if shadowEnabled {
            clipsToBounds = true
            layer.masksToBounds = false
            layer.shadowOpacity = 0.5
            layer.shadowColor = UIColor(white: 0.0, alpha: 1.0).cgColor
            layer.shadowRadius = 4
            layer.shadowOffset = CGSize(width: 4, height: 4)
        }
        
        switch (top, bottom) {
        case(true, false):
            maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        case (false, true):
            maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        case (true, true):
            maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        default:
            break
        }
        
        layer.cornerRadius = radius
        layer.maskedCorners = maskedCorners
    }
}
