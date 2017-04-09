//
//  MyColor.swift
//  MyGame2.1.1
//
//  Created by Karol on 06/10/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import UIKit

struct MyColor {
    let name: String
    let color: UIColor
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
}

extension MyColor: Hashable {
    var hashValue: Int {
        return name.hashValue
    }
}

extension MyColor {
    static func ==(lhs: MyColor, rhs: MyColor) -> Bool {
        return lhs.color == rhs.color
    }
}

extension MyColor: CustomStringConvertible {
    var description: String {
        return name
    }
}


let colors = Array(arrayLiteral:
                   MyColor(name: NSLocalizedString("Black", comment: "Color name"), color: UIColor.black),
                   MyColor(name: NSLocalizedString("Blue", comment: "Color name"), color: UIColor(red:0.05, green:0.60, blue:1.00, alpha:1.0)),
                   MyColor(name: NSLocalizedString("Brown", comment: "Color name"), color: UIColor(red:0.59, green:0.39, blue:0.18, alpha:1.0)),
                   MyColor(name: NSLocalizedString("Pink", comment: "Color name"), color: UIColor(red:0.99, green:0.51, blue:0.75, alpha:1.0)),
//                   MyColor(name: NSLocalizedString("Dark Gray", comment: "Color name"), color: UIColor.darkGray),
                   MyColor(name: NSLocalizedString("Gray", comment: "Color name"), color: UIColor(red:0.51, green:0.51, blue:0.51, alpha:1.0)),
                   MyColor(name: NSLocalizedString("Green", comment: "Color name"), color: UIColor(red:0.00, green:0.62, blue:0.08, alpha:1.0)),
//                   MyColor(name: NSLocalizedString("Magenta", comment: "Color name"), color: UIColor.magenta),
                   MyColor(name: NSLocalizedString("Orange", comment: "Color name"), color: UIColor(red:1.00, green:0.56, blue:0.05, alpha:1.0)),
                   MyColor(name: NSLocalizedString("Purple", comment: "Color name"), color: UIColor(red:0.80, green:0.11, blue:1.00, alpha:1.0)),
                   MyColor(name: NSLocalizedString("Red", comment: "Color name"), color: UIColor(red:0.90, green:0.25, blue:0.05, alpha:1.0)),
                   MyColor(name: NSLocalizedString("Yellow", comment: "Color name"), color: UIColor(red:1.00, green:0.87, blue:0.00, alpha:1.0))
)

let colors2 = Array(arrayLiteral:
    MyColor(name: "Black", color: UIColor.black),
                   MyColor(name: "#0000ff", color: UIColor.blue),
                   MyColor(name: "#f4a460", color: UIColor.brown),
                   MyColor(name: "#00ffff", color: UIColor.cyan),
                   MyColor(name: "#a9a9a9", color: UIColor.darkGray),
                   MyColor(name: "#d3d3d3", color: UIColor.gray),
                   MyColor(name: "#00ff00", color: UIColor.green),
                   MyColor(name: "#FF00FF", color: UIColor.magenta),
                   MyColor(name: "#ffa500", color: UIColor.orange),
                   MyColor(name: "#800080", color: UIColor.purple),
                   MyColor(name: "#ff0000", color: UIColor.red),
                   MyColor(name: "#ffff00", color: UIColor.yellow)
)
