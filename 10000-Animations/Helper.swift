//
//  Helper.swift
//  10000-Animations
//
//  Created by saitjr on 9/16/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit

struct ProjectConfig {
    static let lightFontName: String = "HelveticaNeue-Light"
}

func jsonToArray(path: String) -> Array<[String: String]>? {
    let url = URL(fileURLWithPath: path)
    guard let jsonData = try? Data(contentsOf: url, options: .alwaysMapped) else {
        return nil
    }
    guard let jsonResult = try? JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? Array<[String: String]> else {
        return nil
    }
    guard let result = jsonResult else {
        return nil
    }
    return result
}
