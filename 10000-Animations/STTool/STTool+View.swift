//
//  STTool+View.swift
//  10000-Animations
//
//  Created by saitjr on 9/19/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit

extension STTool where Base: UIView {
    var x: CGFloat {
        get {
            return base.frame.origin.x
        }
        set {
            base.frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return base.frame.origin.y
        }
        set {
            base.frame.origin.y = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return base.frame.size.width
        }
        set {
            base.frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return base.frame.size.height
        }
        set {
            base.frame.size.height = newValue
        }
    }
    
    var halfWidth: CGFloat {
        get {
            return base.frame.size.width * 0.5
        }
        set {
            base.frame.size.width = newValue * 2
        }
    }
    
    var halfHeight: CGFloat {
        get {
            return base.frame.size.height * 0.5
        }
        set {
            base.frame.size.height = newValue * 2
        }
    }
    
    var maxWidth: CGFloat {
        get {
            return base.frame.size.width + base.frame.origin.x
        }
    }
    
    var maxHeight: CGFloat {
        get {
            return base.frame.size.height + base.frame.origin.y
        }
    }
    
    var centerX: CGFloat {
        get {
            return base.center.x
        }
        set {
            base.center.x = newValue
        }
    }
    
    var centerY: CGFloat {
        get {
            return base.center.y
        }
        set {
            base.center.y = newValue
        }
    }
}
