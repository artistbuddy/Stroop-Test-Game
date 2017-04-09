//
//  SimpleBrick.swift
//  MyGame2.1.1
//
//  Created by Karol on 06/10/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

//import Foundation
import UIKit.UIColor

protocol SimpleBrick {
    associatedtype Component: Hashable
    func getComponentA() -> Component
    func getComponentB() -> Component
}

extension SimpleBrick {
//    var hashValue: Int {
//        return getComponentA().hashValue ^ getComponentB().hashValue
//    }

    static func ==(lhs: Self, rhs: Self) -> Bool {
//        return lhs == rhs
        return lhs.getComponentA() == rhs.getComponentA() && lhs.getComponentB() == rhs.getComponentB()
    }
}
