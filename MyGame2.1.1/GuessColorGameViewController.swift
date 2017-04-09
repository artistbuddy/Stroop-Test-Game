//
//  GuessColorGameViewController.swift
//  MyGame2.1.1
//
//  Created by Karol Bukowski on 14/09/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import UIKit

class GuessColorGameViewController: UIViewController, MyTimerUpdate, MyTimerFinished {
    //MARK:- IBOutlets
    @IBOutlet private weak var stack: UIStackView!
    @IBOutlet private weak var timer: UILabel!
    @IBOutlet private weak var question: UILabel!
    @IBOutlet private weak var questionHelper: UILabel!
    @IBOutlet private weak var answerHelper: UILabel!
    
    //MARK:- Segue recievers
    var hand: Hand?
    var player: Player?
    
    //MARK:- Properties
    private var buttonsMap: [UIButton : Brick<MyColor>]?
    private var game: GuessColorGameController?
    
    //MARK:-
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game = GuessColorGameController()
        game!.addTimer(delegate: self)
        
        //FIXIT: encapsulation bug!
        //game!.didFinish()
        
        render()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func render() {
        clear()
        
        let renderer = GuessColorGameRenderer(game: game!.next())
        
        self.question = renderer!.renderQuestion(label: question)
        
        //MARK: Force unwrapped
        let answers = renderer!.renderAnswers()
        buttonsMap = answers.map
        for answer in answers.buttons {
            stack.addArrangedSubview(answer)
        }
    }
    
    private func clear() {
        stack.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    func buttonClicked(sender: UIButton) {
        if let answer = buttonsMap![sender] {
            game!.did(answer: answer)
        } else {
            print("Something went wrong!")
        }
        
        render() //reload view
    }
    
    func indicateButtonClicked(sender: UIButton) {
        sender.backgroundColor = UIColor.lightGray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let infoView = segue.destination as! InfoViewController
        infoView.previousGame = true
        infoView.player = player
    }
    
    //MARK:- MyTimerUpdate Protocol
    func updateTimer(sec: Int) {
        timer.text = "\(sec)s"
    }
    
    //MARK:- MyTimerFinish Protocol
    func did(finish: Bool) {
        game!.didFinish(player: player!, with: hand!)
        performSegue(withIdentifier: "showInfo", sender: nil)
    }
    
    deinit {
        print("deinit GameViewController")
    }
}




