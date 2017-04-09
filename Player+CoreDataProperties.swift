//
//  Player+CoreDataProperties.swift
//  MyGame2.1.1
//
//  Created by Karol on 23/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player");
    }

    @NSManaged public var age: Int32
    @NSManaged public var lateralisation: Int32
    @NSManaged public var hand: Int32
    @NSManaged public var sex: Int32
    @NSManaged public var games: NSSet?
    
    var lateralisationValue: Hand {
        get {
            return Hand(rawValue: self.lateralisation)!
        }
        set {
            self.lateralisation = newValue.rawValue
        }
    }
    
    var sexValue: Sex {
        get {
            return Sex(rawValue: self.sex)!
        }
        set {
            self.sex = newValue.rawValue
        }
    }
    
//    var firstGamePlayedWithHandValue: Hand {
//        get {
//            return Hand(rawValue: self.firstGamePlayedWithHand)!
//        }
//        set {
//            self.firstGamePlayedWithHand = newValue.rawValue
//        }
//    }

}

// MARK: Generated accessors for games
extension Player {

    @objc(addGamesObject:)
    @NSManaged public func addToGames(_ value: Games)

    @objc(removeGamesObject:)
    @NSManaged public func removeFromGames(_ value: Games)

    @objc(addGames:)
    @NSManaged public func addToGames(_ values: NSSet)

    @objc(removeGames:)
    @NSManaged public func removeFromGames(_ values: NSSet)

}
