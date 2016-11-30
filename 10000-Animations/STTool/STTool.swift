//
//  STTool.swift
//  10000-Animations
//
//  Created by saitjr on 9/16/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import Foundation

public struct STTool<Base> {
    public let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol STToolCompatible {
    associatedtype CompatibleType
    var st: STTool<CompatibleType> { get }
}

extension STToolCompatible {
    public var st: STTool<Self> {
        return STTool(self)
    }
    
    static var st: STTool<Self.Type>.Type {
        return STTool.self
    }
}

extension NSObject: STToolCompatible {}
//extension Notification: STToolCompatible {}
