//
//  LevelGenerator.swift
//  MyGame2.1.1
//
//  Created by Karol on 06/10/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

//import Foundation
import UIKit.UIColor

protocol LevelGenerator: Generator {
    func generate() -> Level
}
