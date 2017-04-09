//
//  InfoViewController.swift
//  MyGame2.1.1
//
//  Created by Karol on 08/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    //MARK: Segue reciever
    var previousGame: Bool? {
        willSet {
            if newValue == true {
                InfoViewController.gamesPlayed = InfoViewController.gamesPlayed + 1
            }
        }
    }
    var player: Player?
    var lateralisation: Hand?
    
    private static var gamesPlayed = 0
    private lazy var controller = InfoController(gamesPlayed: InfoViewController.gamesPlayed)
    
    @IBOutlet private weak var gameProgress: UILabel!
    @IBOutlet private weak var hand: UILabel!
    @IBOutlet private weak var actionButton: UIButton!
    @IBOutlet private weak var imageHand: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let lateralisation = lateralisation {
            controller.set(lateralization: lateralisation)
        }
        
        gameProgress.text = controller.getGameProgress()
        hand.text = controller.getHand().desc
        imageHand.image = controller.getHand().image
        actionButton.setTitle(controller.actionButton(), for: .normal)
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: controller.getSegueIdentifier()!, sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playGame" {
            if let destination = segue.destination as? GuessColorGameViewController {
                destination.hand = controller.getHand().hand
                destination.player = player
            }
        }
        
        if segue.identifier == "finishedGame" {
            InfoViewController.gamesPlayed = 0
            previousGame = nil
            player = nil
            
            if let destination = segue.destination as? MenuViewController {
                //do something
            }
        }
    }

}
