////
////  Games+CoreDataProperties.swift
////  MyGame2.1.1
////
////  Created by Karol on 23/11/2016.
////  Copyright © 2016 Karol Bukowski. All rights reserved.
////
//
//import Foundation
//import CoreData
//
//
//extension Games {
//
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Games> {
//        return NSFetchRequest<Games>(entityName: "Games");
//    }
//
//    @NSManaged public var hand: Int32
//    @NSManaged public var ratio: Double
//    @NSManaged public var reactionTime: Double
//    @NSManaged public var score: Int32
//    @NSManaged public var player: NSSet?
//
//    var handValue: Hand {
//        get {
//            return Hand(rawValue: self.hand)!
//        }
//        set {
//            self.hand = newValue.rawValue
//        }
//    }
//}
//
//// MARK: Generated accessors for player
//extension Games {
//
//    @objc(addPlayerObject:)
//    @NSManaged public func addToPlayer(_ value: Player)
//
//    @objc(removePlayerObject:)
//    @NSManaged public func removeFromPlayer(_ value: Player)
//
//    @objc(addPlayer:)
//    @NSManaged public func addToPlayer(_ values: NSSet)
//
//    @objc(removePlayer:)
//    @NSManaged public func removeFromPlayer(_ values: NSSet)
//
//}
