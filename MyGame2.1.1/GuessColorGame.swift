//
//  GuessColorGame.swift
//  MyGame2.1.1
//
//  Created by Karol on 12/10/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import Foundation

protocol GuessColorGame {
    func getAnswers() throws -> [Brick<MyColor>]
    func getQuestion() throws -> Brick<MyColor>
}

