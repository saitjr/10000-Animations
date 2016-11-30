//
//  STTool+Layer.swift
//  10000-Animations
//
//  Created by saitjr on 9/17/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit

extension STTool where Base: CALayer {
    func toImage() -> UIImage {
        let view = UIView(frame: base.bounds)
        view.layer.addSublayer(base)
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, base.isOpaque, 0.0)
        base.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}


extension STTool where Base: UIView {
    func toImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(base.bounds.size, base.layer.isOpaque, 0.0)
        base.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
