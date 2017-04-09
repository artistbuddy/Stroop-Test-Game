//
//  ColorBrick.swift
//  MyGame2.1.1
//
//  Created by Karol on 06/10/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

//import Foundation

//protocol ColorBrick: SimpleBrick {
//    func getPrimaryColor() -> MyColor
//    func getSecondaryColor() -> MyColor
//}

//protocol Render {
////    associatedtype T
////    func render() -> T
//}
//
//protocol ColorBrickRenderer: ColorBrick, Render {
//    func render() -> MyColor
//}
//
//extension ColorBrickRenderer {
//    func render() -> MyColor {
//        return MyColor(name: getPrimaryColor().name, color: getSecondaryColor().color)
//    }
//}

//extension ColorBrick where Component == MyColor {
//    func getPrimaryColor() -> MyColor {
//        return getComponentA()
//    }
//    
//    func getSecondaryColor() -> MyColor {
//        return getComponentB()
//    }
//}

protocol ColorBrick {
    func getPrimaryColor() -> MyColor
    func getSecondaryColor() -> MyColor
}
