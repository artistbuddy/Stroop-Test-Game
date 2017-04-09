//
//  Generator.swift
//  MyGame2.1.1
//
//  Created by Karol on 14/10/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import Foundation

protocol Generator {
    associatedtype T
    var components: [T] {get}
    var bound: Int {get}
}

extension Generator {
    var bound: Int {
        return components.count
    }
}
