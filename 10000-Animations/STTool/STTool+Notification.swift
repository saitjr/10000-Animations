//
//  STTool+Notification.swift
//  10000-Animations
//
//  Created by saitjr on 9/19/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit

extension STTool where Base: NSNotification {
    var keyboardHeight: CGFloat {
        get {
            let keyboardRect = (self.base.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? .zero
            let keyboardHeight = keyboardRect.size.height
            return keyboardHeight
        }
    }
    
    var keyboardAnimationDuration: TimeInterval {
        get {
            let animationDuration = self.base.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0.25
            return animationDuration
        }
    }
}
