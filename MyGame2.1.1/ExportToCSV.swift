//
//  ExportToCSV.swift
//  MyGame2.1.1
//
//  Created by Karol on 26/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import Foundation

class ExportToCSV {
    class func export() -> String {
        let context = DatabaseController.getContext()
        var csv = "date,sex,age,lateralisation,score,ratio,hand,reaction_time\n"
        
        func appendComma() -> String {
            return ","
        }
        
        do {
            let results = try DatabaseController.getContext().fetch(Games.fetchRequest())
            
            for game in results as! [Games] {
                csv.append(String(describing: game.player!.sexValue) + appendComma())
                csv.append(String(game.player!.age) + appendComma())
                csv.append(String(describing: game.player!.lateralisationValue) + appendComma())
                csv.append(String(game.score) + appendComma())
                csv.append(String(game.ratio) + appendComma())
                csv.append(String(describing: game.handValue) + appendComma())
                csv.append(String(game.reactionTime))

                csv.append("\n")
            }
            
        } catch {
            print("Error")
        }
        
        return csv
    }
    
}
