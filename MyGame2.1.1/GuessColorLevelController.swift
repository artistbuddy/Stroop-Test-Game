//
//  GuessColorLevelController.swift
//  MyGame2.1.1
//
//  Created by Karol on 06/10/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

//import Foundation
import UIKit.UIColor

class GuessColorLevelController: LevelController {
    private var combo: Int = 0
    private var points: Int = 0
    private let colors: [MyColor]
    private var level: GuessColorLevel? {
        willSet(value) {
            self.history.append(GuessColorLevelHistory(level: value!))
        }
    }
    private var answeredCorrectly: Bool? //helper
    private var tictoc = false //timer helper
    private var timer = MyTimer()
    private var history = [GuessColorLevelHistory]()
    
    
    init(colors: [MyColor]) {
        self.colors = colors
    }
    
    private func startTimer() {
        if !tictoc {
            timer.start(mode: .timer, duration: .seconds(30))
            tictoc = true
        }
    }
    
    func addTimer(delegate: MyTimerDelegate) {
        timer.add(delegate: delegate)
    }
    
    private func checkLevelDifficulty() -> LevelDifficulty {
        switch points {
        default:
            return LevelDifficulty.normal
        }
    }
    
    enum LevelDifficulty {
        case easy
        case normal
    }
    
    func check(answer: Brick<MyColor>) -> Bool {
        history[history.count - 1].insert(answer: answer) //history.last!.insert(answer: answer)
        //MARK: force unwrapped
        answeredCorrectly = level!.validate(answer: answer)
        _ = setPoints()
        
        return answeredCorrectly!
    }
    
    private func setPoints() -> Int {
        var value = 0
        
        func bonus() -> Int {
            switch combo {
            case 0: return 0
            default: return 100
            }
        }
        
        //MARK: force unwrapped
        switch (answeredCorrectly!, checkLevelDifficulty()) {
        case (true, .normal):
            value = 100 + bonus()
        case (true, .easy):
            value = 50 + bonus()
        case (false, .normal):
            value = -50
        case (false, .easy):
            value = 0
        }
        
        points = points + value
        return value
    }
    
    func next() -> GuessColorGame {
        startTimer()
        
        let generator = GuessColorLevelGenerator(components: colors)
        generator.setup(config: GuessColorLevelGenerator.Config(
            questionType: GuessColorLevelGenerator.Config.QuestionType.Normal,
            answerType: GuessColorLevelGenerator.Config.AnswerType.Normal,
            numberAnswers: 4)
        )
        
        self.level = generator.generate() as? GuessColorLevel
        
        return self.level as! GuessColorGame
    }
    
    func getHistory() -> [GuessColorLevelHistory] {
        return history
    }
    
    func getPoints() -> Int {
        return self.points
    }

    
    //MARK: - Error Protocol
    enum LevelControllerError: Error {
        case levelNotGenerated
    }
} 
