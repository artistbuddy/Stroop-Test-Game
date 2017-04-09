//
//  Dictionary.swift
//  MyGame2.1.1
//
//  Created by Karol on 23/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import Foundation

extension Dictionary where Value: Equatable {
    func allKeys(forValue val: Value) -> [Key] {
        return self.filter { $1 == val }.map { $0.0 }
    }
}
