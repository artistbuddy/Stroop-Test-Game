//
//  GuessColorLevelGenerator.swift
//  MyGame2.1.1
//
//  Created by Karol on 20/10/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import Foundation

class GuessColorLevelGenerator: LevelGenerator {
    var components: [MyColor]
    private var brickGenerator: BrickGenerator<MyColor> {
        return BrickGenerator(components: components)
    }
    private var config: Config? = Config(questionType: .Normal, answerType: .Normal, numberAnswers: 4) //default
    private var level = GuessColorLevel()
    
    struct Config {
        let questionType: QuestionType
        let answerType: AnswerType
        let numberAnswers: Int
        //let numberQuestions: Int
        
        enum QuestionType {
            //FIXIT: change to lowelCamelCase
            case Easy, Normal, Special(defaultComponent: MyColor)
        }
        
        enum AnswerType {
            //FIXIT: change to lowelCamelCase
            case Easy, Normal, Special(defaultComponent: MyColor)
        }
    }
    
    init(components: [MyColor]) {
        self.components = components
    }
    
    func setup(config: Config) {
        self.config = config
    }
    
    private func generateQuestion() throws -> (question: Brick<MyColor>, correctAnswer: Brick<MyColor>) {
        guard let config = config  else {
            throw LevelGeneratorError.configNotFound
        }
        
//        guard let answer = try level.getAnswers().randomItem()! else {
//            throw LevelGeneratorError.answersNotGenerated
//        }
        
        let answer = try level.getAnswers().randomItem()!
        
        let requiredComponent = answer.getComponentA()
        let question: Brick<MyColor>
        
        switch config.questionType {
        case .Easy:
            question = BrickGenerator.create(componentA: requiredComponent, componentB: requiredComponent)
        case .Normal:
            question = BrickGenerator.create(componentA: brickGenerator.random().getComponentA(), componentB: requiredComponent)
        case .Special(let defaultComponent):
            question = BrickGenerator.create(componentA: requiredComponent, componentB: defaultComponent)
        }
        
        return (question, answer)
    }
    
    private func generateAnswers() throws -> [Brick<MyColor>] {
        guard let config = config else {
            throw LevelGeneratorError.configNotFound
        }
        
        switch config.answerType {
        case .Easy:
            return brickGenerator.unique(bricks: config.numberAnswers, config: .equal)
        case .Normal:
            return brickGenerator.unique(bricks: config.numberAnswers, config: .both)
        case .Special(let defaultComponent):
            return brickGenerator.unique(bricks: config.numberAnswers, config: .lhs(defaultComponent: defaultComponent))
        }
    }
    
    func generate() -> Level {
        assert(config != nil, "Nie wywowałano metody setup(_: Config)!")
        
        //MARK: Error not handled
        _ = level.insert(answers: try! generateAnswers())
        
        let q = try! generateQuestion()
        _ = level.insert(question: q.question)
        _ = level.set(correctAnswer: q.correctAnswer)
        
        return level
    }
    
        
    //MARK: - Error Protocol
    enum LevelGeneratorError: Error {
        case configNotFound
    }
}
