
//
//  Class+STCreation.swift
//  10000-Animations
//
//  Created by saitjr on 9/16/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import Foundation

extension STTool {
    func classFromString(name: String) -> AnyClass? {
        let bundleIdentifier = (Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String).components(separatedBy: ".").last!
        let className = bundleIdentifier + "." + name
        let convertedName = String(className.characters.map { $0 == "-" ? "_" : $0 })
        return NSClassFromString(convertedName)
    }
}
