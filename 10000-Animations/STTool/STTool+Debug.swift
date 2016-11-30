//
//  STTool+Debug.swift
//  10000-Animations
//
//  Created by saitjr on 9/17/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit


extension STTool where Base: CALayer {
    func debugBorder() {
        #if DEBUG
        base.borderColor = UIColor.red.cgColor
        base.borderWidth = 1
        #endif
    }
}
