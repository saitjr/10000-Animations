//
//  Model.swift
//  10000-Animations
//
//  Created by saitjr on 9/16/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import Foundation

enum ActionType: String {
    case push = "push"
    case present = "present"
}

struct Model {
    var title: String
    var type: AnyClass
    var status: Bool
    var description: String = ""
    
    var action: ActionType = .push
}
