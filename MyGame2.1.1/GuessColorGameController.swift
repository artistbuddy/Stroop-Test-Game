//
//  GuessColorGameController.swift
//  MyGame2.1.1
//
//  Created by Karol on 23/10/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import Foundation

class GuessColorGameController {
    private let level: GuessColorLevelController
    private var answers = [Bool]()
    
    init() {
        level = GuessColorLevelController(colors: colors)
    }
    
    func next() -> GuessColorGame {
        return level.next()
    }
    
    func did(answer: Brick<MyColor>) {
        _ = level.check(answer: answer)
    }
    
    func addTimer(delegate: MyTimerDelegate) {
        level.addTimer(delegate: delegate)
    }
    
    //FIXIT: func should be private 
    func didFinish(player: Player, with hand: Hand) {
        let stats = GuessColorGameStats.generateStats(from: level.getHistory())
        saveToDatabase(hand: hand, ratio: stats.ratio, reactionTime: stats.reactionTime, score: level.getPoints(), player: player)
        
    }
    
    func saveToDatabase(hand: Hand, ratio: Double, reactionTime: Double, score: Int, player: Player) {
        let game = Games(context: DatabaseController.getContext())
        game.handValue = hand
        game.ratio = ratio
        game.reactionTime = reactionTime
        game.score = Int32(score)
        game.player = player
        
        DatabaseController.saveContext()
        
        do {
            let results = try DatabaseController.getContext().fetch(Games.fetchRequest())
            print(results.count)
            
        } catch  {
            
        }
        
    }
    
//    private func boolToString(_ bool: Bool) -> String {
//        if bool == true {
//            return "1"
//        } else {
//            return "0"
//        }
//    }
    
//    private func boolToString(array: [Bool]) -> String {
//        var string = String()
//        for bool in array {
//            string = string + boolToString(bool)
//        }
//        
//        return string
//    }
    
//    //MARK:- Types
//    struct PropertyKey {
//        static let IDKey = "id"
//        static let levelKey = "level"
//        static let historyKey = "history"
//    }
//    
//    //MARK:- Archiving Paths
//    private static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
//    private static let archiveURL = documentsDirectory.appendingPathComponent("GuessColorGameController")
//    
//    //MARK:- NSCoding
//    func encode(with aCoder: NSCoder) {
////        aCoder.encodeCInt(<# variable to save #>, forKey: <# PropertyKey.key #>)
//    }
//    
//    required convenience init?(coder aDecoder: NSCoder) {
//        let <# variable to save #> = aDecoder.decodeCInt(forKey: <# PropertyKey.key #>)
//        
//        self.init()
//    }
//    
//    //MARK:- Archiver/Unarchiver
//    private func save() -> Bool {
//        if NSKeyedArchiver.archiveRootObject(self, toFile: GuessColorGameController.archiveURL.path) {
//            return true
//        }
//        
//        return false
//    }
//    
//    private func load() -> Bool {
//        if NSKeyedUnarchiver.unarchiveObject(withFile: GuessColorGameController.archiveURL.path) != nil {
//            return true
//        }
//        
//        return false
//    }

}
