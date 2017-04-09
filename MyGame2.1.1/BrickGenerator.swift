//
//  BrickGenerator.swift
//  MyGame2.1.1
//
//  Created by Karol on 06/10/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

//import Foundation
import GameplayKit

class BrickGenerator<T: Hashable>: Generator {
    //TODO: Make all methods static
    let components: [T]
    private let randomInt: (Int) -> Int = GKRandomSource.sharedRandom().nextInt //Static stored properties are not (yet) supported for generic types in swift
    
    init(components: [T]) {
        self.components = components
    }
    
    static func create(componentA: T, componentB: T) -> Brick<T> {
        return Brick(componentA: componentA, componentB: componentB)
    }
    
    func unique(components: Int) throws -> [T] {
        guard components <= bound else {
            throw BrickGeneratorError.notEnoughComponents
        }
        
        if components == bound {
            return self.components
        }
        
        var componentsCopy = self.components
        var uniqueComponents = Array<T>()
        
        func randomAndRemoveComponent() -> T {
            let index = randomInt(componentsCopy.count)
            return componentsCopy.remove(at: index)
        }
        
        while uniqueComponents.count < components {
            uniqueComponents.append(randomAndRemoveComponent())
        }
        
        return uniqueComponents
    }
    
    //Change config to parameter?
    func unique(bricks: Int, config: BrickGeneratorUniquenessParameters<T>) -> [Brick<T>] {
        let components: [T]
        var uniqueBricks = Array<Brick<T>>()
        
        switch config {
        case .lhs, .rhs, .equal:
            //FIXME: Error not handled
            components = try! unique(components: bricks)
        case .both:
            //FIXME: Error not handled
            components = try! unique(components: bricks * 2)
        }
        
        switch config {
        case .lhs(let componentB):
            for component in components {
                let brick = BrickGenerator.create(componentA: component, componentB: componentB)
                uniqueBricks.append(brick)
            }
        case .rhs(let componentA):
            for component in components {
                let brick = BrickGenerator.create(componentA: componentA, componentB: component)
                uniqueBricks.append(brick)
            }
        case .equal:
            for component in components {
                let brick = BrickGenerator.create(componentA: component, componentB: component)
                uniqueBricks.append(brick)
            }
        case .both:
            for index in stride(from: 0, to: components.count, by: 2) {
                let brick = BrickGenerator.create(componentA: components[index], componentB: components[index + 1])
                uniqueBricks.append(brick)
            }
        }
        
        return Array(uniqueBricks)
    }
    
    func random() -> Brick<T> {
        return random(bricks: 1)[0]
    }
    
    //func randomBrick(with component: T) -> Brick 
    
    func random(bricks: Int) -> [Brick<T>] {
        var randomBricks = [Brick<T>]()
        
        for _ in 1...bricks {
            let brick = BrickGenerator.create(componentA: components[randomInt(bound)], componentB: components[randomInt(bound)])
            randomBricks.append(brick)
        }
        
        return randomBricks
    }
}

/*
 Enums in generic types are not allowed
 https://forums.developer.apple.com/thread/12298
 It's an implementation limitation. We'll remove the restriction once our compiler and runtime are able to correctly handle types nested in generic contexts.
 
 class Class<T> {
     enum MyEnum {
         case some
     }
 }
 */

enum BrickGeneratorUniquenessParameters<T> {
    case lhs(defaultComponent: T), rhs(defaultComponent: T), equal, both
}

enum BrickGeneratorError: Error {
    case notEnoughComponents
    //case somethingWentWrong
    //case lostBrick
}
