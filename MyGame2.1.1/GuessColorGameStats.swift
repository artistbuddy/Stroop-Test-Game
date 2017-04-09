//
//  GuessColorGameStats.swift
//  MyGame2.1.1
//
//  Created by Karol on 24/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import Foundation

class GuessColorGameStats {
    class func generateStats(from levelHistory: [GuessColorLevelHistory]) -> (reactionTime: Double, ratio: Double) {
        var totalTime = 0.0
        var correctedAnswers = 0
        
        for level in levelHistory {
            //if answer or time is nil == last level == user didnt click answer
            if let answer = level.selectedAnswer {
                if level.level.validate(answer: answer) {
                    correctedAnswers = correctedAnswers + 1
                }
                
                totalTime = totalTime + level.time()!
            }
        }
        
        let totalLevels = levelHistory.count
        
        let averageReactionTime = totalTime / Double(totalLevels)
        let ratio = Double(correctedAnswers) / Double(totalLevels)

        return (averageReactionTime, ratio)
    }
}
