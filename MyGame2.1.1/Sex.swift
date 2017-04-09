//
//  Sex.swift
//  MyGame2.1.1
//
//  Created by Karol on 19/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import Foundation

enum Sex: Int32, CustomStringConvertible {
    case male, female, gender
    
    var description: String {
        switch self {
        case .female:
            return "Female"
        case .male:
            return "Male"
        case .gender:
            return "Gender"
        }
    }
}
