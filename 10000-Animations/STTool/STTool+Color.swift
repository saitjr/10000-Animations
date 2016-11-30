//
//  STTool+Color.swift
//  10000-Animations
//
//  Created by saitjr on 9/19/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit

extension STTool where Base: UIColor {
    static func hexColor(hex: Int) -> UIColor {
        let red = (hex >> 16) & 0xff
        let green = (hex >> 8) & 0xff
        let blue = hex & 0xff
        
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        return UIColor.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
}
