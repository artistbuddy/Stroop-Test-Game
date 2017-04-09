//
//  InfoGameController.swift
//  MyGame2.1.1
//
//  Created by Karol on 14/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

//import Foundation
import UIKit
import GameplayKit

class InfoController {
    private let game: Int
    private lazy var gameSequence: [Hand] = {
        if InfoController.reversed {
            return [.right, .right, .right, .left, .left, .left]
        } else {
            return [.left, .left, .left, .right, .right, .right]
        }
    }()
    private static var reversed = false
    
    init(gamesPlayed: Int) {
        game = gamesPlayed
        
    }
    
    func set(lateralization: Hand) {
        switch lateralization {
        case .left:
            InfoController.reversed = true
        case .right:
            InfoController.reversed = false
        default:
            break
        }

    }
    
    func getGameProgress() -> String {
        switch game {
        case 0...5:
            return String(format: NSLocalizedString("Game %d of %d", comment: "game of games"), game + 1, gameSequence.count)
        default:
            return NSLocalizedString("Thank you!", comment: "Thanks for playing game (end)")
        }
        
    }
    
    func getHand() -> (desc: String, image: UIImage?, hand: Hand?) {
        func hand() -> (text: String, image: UIImage?) {
            switch gameSequence[game] {
            case .left:
                return (NSLocalizedString("left", comment: "now play with hand"), UIImage(named: "lefthandpl"))
            case .right:
                return (NSLocalizedString("right", comment: "now play with hand"), UIImage(named: "righthandpl"))

            case .other:
                return (NSLocalizedString("any", comment: "now play with hand"), nil)
            }
        }
        
        switch game {
        case 0: return ((String(format: NSLocalizedString("Play with %@ thumb", comment: "first play"), hand().text), hand().image, gameSequence[game]))
        case 1...2: return ((String(format: NSLocalizedString("Continue with %@ thumb", comment: "continue game"), hand().text), nil, gameSequence[game]))
        case 3: return ((String(format: NSLocalizedString("Now change thumb to %@", comment: "change hand"), hand().text), hand().image, gameSequence[game]))
        case 4...5: return ((String(format: NSLocalizedString("Continue with %@ thumb", comment: "continue game"), hand().text), nil, gameSequence[game]))
        default: return ("", nil, nil)
        }
    }
    
    func getFirstPlayedHand() -> Hand {
        if InfoController.reversed {
            return Hand.right
        } else {
            return Hand.left
        }
    }
    
    func actionButton() -> String? {
        switch game {
        case 0:
            return NSLocalizedString("Let's play", comment: "start first game")
        case 1...5:
            return NSLocalizedString("Next game", comment: "next another in row game")
        case 6:
            return NSLocalizedString("Finish", comment: "no more games")
        default:
            return nil
        }
    }
    
    func getSegueIdentifier() -> String? {
        switch game {
        case 0...5:
            return "playGame"
        case 6:
            return "finishedGame"
        default:
            return nil
        }
    }
}
