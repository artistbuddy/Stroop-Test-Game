//
//  Brick.swift
//  MyGame2.1.1
//
//  Created by Karol on 06/10/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

//import Foundation
import UIKit.UIColor

struct Brick<T: Hashable>: SimpleBrick {
    private let componentA: T
    private let componentB: T
    
    init(componentA: T, componentB: T) {
        self.componentA = componentA
        self.componentB = componentB
    }
    
    func getComponentA() -> T {
        return componentA
    }
    
    func getComponentB() -> T {
        return componentB
    }
}

//extension Brick: Hashable {
//    //FIXIT: can produce hash collision
//    var hashValue: Int {
//        return getComponentA().hashValue ^ getComponentB().hashValue
//    }
//}
