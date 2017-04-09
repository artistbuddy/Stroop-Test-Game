//
//  Hand.swift
//  MyGame2.1.1
//
//  Created by Karol on 19/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import Foundation

enum Hand: Int32, CustomStringConvertible {
    case left, right, other
    
    var description: String {
        switch self {
        case .left:
            return "Left"
        case .right:
            return "Right"
        case .other:
            return "Other"
        }
    }
}

