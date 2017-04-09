//
//  Array.swift
//  MyGame2.1.1
//
//  Created by Karol on 17/10/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import Foundation

extension Array {
    func randomItem() -> Element? {
        let bound = self.count
        
        switch bound {
        case 0: return nil
        case 1: return self[0]
        default:
            let index = Int(arc4random_uniform(UInt32(bound)))
            return self[index]
        }
    }
}
