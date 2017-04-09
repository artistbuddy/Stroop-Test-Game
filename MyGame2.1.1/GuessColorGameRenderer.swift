//
//  GuessColorGameRenderer.swift
//  MyGame2.1.1
//
//  Created by Karol on 22/10/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import Foundation
import UIKit

class GuessColorGameRenderer {
    private let game: GuessColorGame
    private var id = 0
    
    func buttonAction() {}
    
    init?(game: GuessColorGame) {
        do {
            _ = try? game.getAnswers()
            _ = try? game.getQuestion()
        }
        
        self.game = game
    }
    
    func renderQuestion(label: UILabel) -> UILabel {
//        let label = UILabel()
        label.text = try! game.getQuestion().getComponentA().name
        label.textColor = try! game.getQuestion().getComponentB().color
        label.font = UIFont(name: "Helvetica", size: 30.0)
        
        return label
    }
    
    private func renderAnswer(text: String, color: UIColor) -> (button: UIButton, id: Int) {
        id = id + 1
        
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 25.0)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
        button.addTarget(self, action: #selector(GuessColorGameViewController.buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        button.addTarget(self, action: #selector(GuessColorGameViewController.indicateButtonClicked(sender:)), for: UIControlEvents.touchDown)
        button.tag = id
        
        return (button, id)
    }
    
    func renderAnswers() -> (buttons: [UIButton], map: [UIButton : Brick<MyColor>]) {
        var map = [UIButton : Brick<MyColor>]()
        var answers = [UIButton]()
        
        for answer in try! game.getAnswers() {
            let render = renderAnswer(text: answer.getComponentA().name, color: answer.getComponentB().color)
            answers.append(render.button)
            map[render.button] = answer
        }
        
        return (answers, map)
    }
}
