//
//  GuessColorLevel.swift
//  MyGame2.1.1
//
//  Created by Karol on 20/10/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import Foundation

struct GuessColorLevel: Level, GuessColorGame, CustomStringConvertible {
    private var question: Brick<MyColor>?
    private var answers: [Brick<MyColor>]?
    private var correctAnswer: Brick<MyColor>?
    
    init() { }
    
    mutating func insert(question: Brick<MyColor>) -> Bool {
        guard self.question == nil else {
            return false
        }
        
        self.question = question
        return true
    }
    
    mutating func insert(answers: [Brick<MyColor>]) -> Bool {
        guard self.answers == nil else {
            return false
        }
        
        assert(answers.isEmpty != true, "Tablica odpowiedzi nie może być pusta")
        self.answers = answers
        return true
    }
    
    mutating func set(correctAnswer: Brick<MyColor>) {
        self.correctAnswer = correctAnswer
    }
    
    enum Level {
        case question, answers, all
    }
    
    mutating func clear(_ clear: Level) {
        switch clear {
        case .answers:
            self.answers = nil
        case .question:
            self.question = nil
        case .all:
            self.answers = nil
            self.question = nil
        }
    }
    
    func getQuestion() throws -> Brick<MyColor> {
        guard question != nil else {
            throw GuessColorLevelError.questionNotFound
        }
        
        return question!
    }
    
    func getAnswers() throws -> [Brick<MyColor>] {
        guard answers != nil else {
            throw GuessColorLevelError.answersNotFound
        }
        
        return answers!
    }
    
    func validate(answer: Brick<MyColor>) -> Bool {
        //MARK: force unwrapped
        return answer == correctAnswer!
    }
    
    //MARK:- CustomStringConvertible Protocol
    var description: String {
        var desc = String()
        
        let question = try! getQuestion()
        let answers = try! getAnswers()
        
        desc = desc + "Question: \(question.getComponentB())\n"
        desc = desc + "Answers: "
        for answer in answers {
            desc = desc + "\(answer.getComponentA()), "
        }

        return desc
    }
    
    //MARK:- Error Protocol
    enum GuessColorLevelError: Error {
        case questionNotFound
        case answersNotFound
    }
}
