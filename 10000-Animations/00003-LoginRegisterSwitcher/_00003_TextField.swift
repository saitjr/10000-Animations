//
//  _00003_TextField.swift
//  10000-Animations
//
//  Created by saitjr on 11/30/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit

class _00003_TextField: UIView {
    
    private var actionButton: UIButton!
    private var titleLabel: UILabel!
    private var textField: UITextField!
    
    private var line: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
