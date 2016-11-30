//
//  UIImage+STCreation.swift
//  10000-Animations
//
//  Created by saitjr on 9/17/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit

extension STTool {
    func screenShot() -> UIImage {
        let window = UIApplication.shared.keyWindow!
        return window.layer.st.toImage()
    }
}
