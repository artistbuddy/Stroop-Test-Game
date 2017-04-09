//
//  GuessColorLevelHistory.swift
//  MyGame2.1.1
//
//  Created by Karol on 13/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import Foundation

struct GuessColorLevelHistory: LevelHistory, CustomStringConvertible {
    let level: GuessColorLevel
    private var reaction: ReactionTime
    var selectedAnswer: Brick<MyColor>? {
        willSet {
            reaction.stop()
        }
    }
    
    private struct ReactionTime {
        private let start: dispatch_time_t
        private var _stop: dispatch_time_t?
        private var didStop = false //helper
        
        var time: UInt64? {
            if let stop = _stop {
                return stop - start
            }
            
            return nil
        }
        
        init() {
            self.start = DispatchTime.now().uptimeNanoseconds
        }
        
        mutating func stop() {
            if didStop { return } //prevent for overriding _stop value
            
            self._stop = DispatchTime.now().uptimeNanoseconds
            self.didStop = true
        }
    }
    
    init(level: GuessColorLevel) {
        self.level = level
        self.reaction = ReactionTime()
    }
    
    mutating func insert(answer: Brick<MyColor>) {
        selectedAnswer = answer
    }
    
//    func time() -> UInt64? {
//        return reaction.time
//    }
    
    func time() -> Double? {
        if let time = reaction.time {
            return Double(time) / 1_000_000_000
        }
        
        return nil
    }
    
    //MARK:- CustomStringConvertible Protocol
    var description: String {
        var desc = String()
        
        desc = desc + "\(level) \n"
        desc = desc + "Selected answer: \(selectedAnswer?.getComponentA()) \n"
        desc = desc + "Response time: \(time()) \n"
        
        return desc
    }
}
