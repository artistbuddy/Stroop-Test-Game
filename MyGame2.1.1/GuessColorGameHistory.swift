//
//  GuessColorGameHistory.swift
//  MyGame2.1.1
//
//  Created by Karol on 13/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import Foundation

class GuessColorGameHistory: GameHistory {
    private typealias NumberOfGame = Int
//    private var player: Player!
    private var date: Date!
    private var stats = [NumberOfGame : GameStats]()
    private var games = [NumberOfGame : [GuessColorLevelHistory]]()
    private var playedGames: Int { return self.games.count }
    
    private struct GameStats {
        let score: Int
        let averageReaction: Double 
        let ratio: Double
        let hand: Hand
        
        init(score: Int, reactionTime: Double, ratio: Double, hand: Hand) {
            self.score = score
            self.averageReaction = reactionTime
            self.ratio = ratio
            self.hand = hand
        }
    }
    
    init() {
//        self.player = player
        self.date = Date()
    }
    
    func insert(levels: [GuessColorLevelHistory], score: Int, playedHand: Hand) {
        let stats = GuessColorGameStats.generateStats(from: levels)
        
        let gameStats = GameStats(score: score, reactionTime: stats.reactionTime, ratio: stats.ratio, hand: playedHand)
        
        self.stats[playedGames + 1] = gameStats
        self.games[playedGames + 1] = levels
        
        saveToDatabase(gameStats)
    }
    
    private func saveToDatabase(_ stats: GameStats) {
        let game = Games(context: DatabaseController.getContext())
        game.handValue = stats.hand
        game.ratio = stats.ratio
        game.reactionTime = stats.averageReaction
        game.score = Int32(stats.score)
// player
        
        do {
            let results = try DatabaseController.getContext().fetch(Games.fetchRequest())
            print(results.count)
            
            for user in results as! [Games] {
                print(user.handValue)
                print(user.ratio)
                print(user.reactionTime)
                print(user.score)
            }
            
        } catch  {
            
        }

    }
}
