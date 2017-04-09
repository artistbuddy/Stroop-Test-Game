//
//  AddPlayerViewController.swift
//  MyGame2.1.1
//
//  Created by Karol on 19/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import UIKit

class AddPlayerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    //MARK:- IBOutlets
    @IBOutlet private weak var agePicker: UIPickerView!
    @IBOutlet private weak var sex: UISegmentedControl!
    @IBOutlet private weak var hand: UISegmentedControl!
    
    //MARK:- Properties
    private var selectedAge = 6 //pickerview start from 6
    private var selectedSex: Sex {
        return sex(from: sex.titleForSegment(at: sex.selectedSegmentIndex)!)!
    }
    private var selectedHand: Hand {
        return handedness(from: hand.titleForSegment(at: hand.selectedSegmentIndex)!)!
    }
    
    //MARK:- IBActions
    @IBAction func actionButtonClicked(_ sender: UIButton) {
        let player = createPlayer(age: selectedAge, lateralisation: selectedHand, sex: selectedSex)
        
        performSegue(withIdentifier: "startGame", sender: player)
    }
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "cancelAddPlayer", sender: sender)
    }

    //MARK: -
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        agePicker.dataSource = self
        agePicker.delegate = self
        
        clearStoryboardPlaceholders()
        sex = create(segment: sex, from: prepareSexData())
        hand = create(segment: hand, from: prepareHandednessData())
    }
    
    func clearStoryboardPlaceholders() {
        sex.removeAllSegments()
        hand.removeAllSegments()
    }
    
    func prepare<T: Hashable>(data: Dictionary<T, String>) -> [String] {
        var newData = [String]()
        
        for item in data {
            newData.append(item.value)
        }
        
        return newData
    }
    
    func create(segment: UISegmentedControl, from titles: [String]) -> UISegmentedControl {
        var position = 0
        
        for title in titles {
            segment.insertSegment(withTitle: title, at: position, animated: true)
            position = position + 1
        }
        
        segment.selectedSegmentIndex = 0

        return segment
    }
    
    func createPlayer(age: Int, lateralisation: Hand, sex: Sex) -> Player {
        let player = Player(context: DatabaseController.getContext())
        player.age = Int32(age)
        player.lateralisationValue = lateralisation
        player.sexValue = sex

        
        DatabaseController.saveContext()
        
        return player
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGame" {
            let infoView = segue.destination as! InfoViewController
            infoView.previousGame = false
            infoView.player = sender as? Player
            infoView.lateralisation = selectedHand
        } 
    }
    
    //MARK:- Sex Data
    func sexData() -> [Sex:String] {
        var sex = [Sex:String]()
        sex[.male] = NSLocalizedString("Man", comment: "Sex picker in AddPlayerView")
        sex[.female] = NSLocalizedString("Woman", comment: "Sex picker in AddPlayerView")
//        sex[.gender] = NSLocalizedString("Gender", comment: "Sex picker in AddPlayerView")
        
        return sex
    }
    
    func sex(from value: String) -> Sex? {
        return sexData().allKeys(forValue: value).first
    }
    
    func prepareSexData() -> [String] {
        return prepare(data: sexData())
    }
    
    //MARK:- Handedness Data
    func handednessData() -> [Hand:String] {
        var hands = [Hand:String]()
        hands[.left] = NSLocalizedString("Left-Handed", comment: "Handedness picker")
        hands[.right] = NSLocalizedString("Right-Handed", comment: "Handedness picker")
        
        return hands
    }
    
    func handedness(from value: String) -> Hand? {
        return handednessData().allKeys(forValue: value).first
    }
    
    func prepareHandednessData() -> [String] {
        return prepare(data: handednessData())
    }
    
    //MARK:- UIPickerViewDataSource Protocol
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 94
    }
    
    //MARK:- UIPickerViewDelegate Protocol
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row + 6)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedAge = row + 6
    }
}
