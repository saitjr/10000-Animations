//
//  _00003_UIHelper.swift
//  10000-Animations
//
//  Created by saitjr on 12/1/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit

struct _00003_UIHelper {
    static func generateSwitchButton(frame: CGRect, title: String, target: Any?, action: Selector) -> UIButton {
        let button = UIButton()
        button.frame = frame
        button.setTitle(title, for: .normal)
        button.setTitle(title, for: .selected)
        button.addTarget(target, action: action, for: .touchUpInside)
        return button
    }
}
