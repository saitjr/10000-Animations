//
//  STTool+Label.swift
//  10000-Animations
//
//  Created by saitjr on 9/17/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit

extension STTool where Base: UILabel {
    func size(maxSize: CGSize = UIScreen.main.bounds.size) -> CGSize {
        let attribute: [String: Any] = [NSFontAttributeName : base.font]
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin) //.union(.truncatesLastVisibleLine)
        let size = base.text?.boundingRect(with: maxSize, options: options, attributes: attribute, context: nil).size ?? .zero
        return size
    }
}
