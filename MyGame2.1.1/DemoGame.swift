//
//  DemoGame.swift
//  MyGame2.1.1
//
//  Created by Karol on 27/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import UIKit

class DemoGame: UIViewController {
    var games = 0
    
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var questionStack: UIStackView!
    @IBOutlet weak var answer3Stack: UIStackView!
    @IBOutlet weak var answer2Stack: UIStackView!
    @IBOutlet weak var answer1Stack: UIStackView!
    
    var question10: UILabel!
    var question20: UILabel!
    var question30: UILabel!
    var question40: UILabel!
    
    var button11: UIButton!
    var button12: UIButton!
    var button13: UIButton!
    var button21: UIButton!
    var button22: UIButton!
    var button23: UIButton!
    var button31: UIButton!
    var button32: UIButton!
    var button33: UIButton!
    var button41: UIButton!
    var button42: UIButton!
    var button43: UIButton!
    
    var correctAnswers = [13, 22, 33, 41]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        question10 = generateLabel(title: "Yellow", color: UIColor.black)
        button11 = generateButton(title: "Blue", color: UIColor.black, tag: 11)
        button12 = generateButton(title: "Red", color: UIColor.green, tag: 12)
        button13 = generateButton(title: "Black", color: UIColor.red, tag: 13) //correct
        
        question20 = generateLabel(title: "Black", color: UIColor.yellow)
        button21 = generateButton(title: "Black", color: UIColor.orange, tag: 21)
        button22 = generateButton(title: "Yellow", color: UIColor.red, tag: 22) //correct
        button23 = generateButton(title: "Blue", color: UIColor.green, tag: 23)
        
        question30 = generateLabel(title: "Orange", color: UIColor.green)
        button31 = generateButton(title: "Black", color: UIColor.orange, tag: 31)
        button32 = generateButton(title: "Yellow", color: UIColor.yellow, tag: 32)
        button33 = generateButton(title: "Green", color: UIColor.red, tag: 33) //correct
        
        question40 = generateLabel(title: "Green", color: UIColor.green)
        button41 = generateButton(title: "Green", color: UIColor.red, tag: 41) //correct
        button42 = generateButton(title: "Yellow", color: UIColor.yellow, tag: 42)
        button43 = generateButton(title: "Black", color: UIColor.orange, tag: 43)
        
        renderGame()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    func buttonClicked(_ sender: UIButton) {
        sender.backgroundColor = nil //touchUp
        check(answer: sender)
    }
    
    
    @IBAction func skipButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "showAddPlayer", sender: sender)
    }
    
    func indicateButtonClicked(_ sender: UIButton) {
        sender.backgroundColor = UIColor.lightGray //touchDown
    }
    
    func check(answer: UIButton) {
        if correctAnswers.contains(answer.tag) {
            games = games + 1
            renderGame()
        } else {
//            answer.setTitleColor(UIColor.lightGray, for: .normal)
            answer.removeTarget(nil, action: nil, for: .allEvents) //disable clicking
            
            let label = UILabel()
            label.text = NSLocalizedString("Wrong answer", comment: "wrong answer in demo game")
            label.textColor = UIColor.darkGray
            label.font = UIFont(name: "Helvetica", size: 15)
            label.textAlignment = NSTextAlignment.center
            
            
            switch answer.tag % 10 {
            case 1:
                answer1Stack.insertArrangedSubview(label, at: 0)
            case 2:
                answer2Stack.insertArrangedSubview(label, at: 0)
            case 3:
                answer3Stack.insertArrangedSubview(label, at: 0)
            default:
                break
            }
        }
    }
    
    private func clear() {
        questionStack.subviews.forEach({ $0.removeFromSuperview() })
        answer1Stack.subviews.forEach({ $0.removeFromSuperview() })
        answer2Stack.subviews.forEach({ $0.removeFromSuperview() })
        answer3Stack.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    func renderGame() {
        clear()
        
        switch games {
        case 0:
            questionStack.addArrangedSubview(question10)
            answer1Stack.addArrangedSubview(button11)
            answer2Stack.addArrangedSubview(button12)
            answer3Stack.addArrangedSubview(button13)
        case 1:
            questionStack.addArrangedSubview(question20)
            answer1Stack.addArrangedSubview(button21)
            answer2Stack.addArrangedSubview(button22)
            answer3Stack.addArrangedSubview(button23)
        case 2:
            questionStack.addArrangedSubview(question30)
            answer1Stack.addArrangedSubview(button31)
            answer2Stack.addArrangedSubview(button32)
            answer3Stack.addArrangedSubview(button33)
        case 3:
            questionStack.addArrangedSubview(question40)
            answer1Stack.addArrangedSubview(button41)
            answer2Stack.addArrangedSubview(button42)
            answer3Stack.addArrangedSubview(button43)
        default:
            mainStack.subviews.forEach({ $0.removeFromSuperview() })
            
            let label = UILabel()
            label.text = NSLocalizedString("You are ready to play", comment: "finish demo game")
            mainStack.addArrangedSubview(label)
            
            skipButton.setTitle(NSLocalizedString("Next", comment: "finished demo game, next button"), for: .normal)
        }
    }
    
    func generateButton(title: String, color: UIColor, tag: Int) -> UIButton {
        let button = UIButton()
        button.setTitle(NSLocalizedString(title, comment: "Color name"), for: .normal)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 25.0)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
        button.addTarget(self, action: #selector(DemoGame.buttonClicked(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(DemoGame.indicateButtonClicked(_:)), for: .touchDown)
        button.tag = tag
        
        return button
    }
    
    func generateLabel(title: String, color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = NSLocalizedString(title, comment: "Color name")
        label.textColor = color
        label.font = UIFont(name: "Helvetica", size: 30.0)
        label.textAlignment = NSTextAlignment.center
        

        return label
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
