//
//  MyTimer.swift
//  MyGame2.1.1
//
//  Created by Karol on 08/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import Foundation

protocol MyTimerUpdate: MyTimerDelegate {
    func updateTimer(sec: Int)
}

protocol MyTimerFinished: MyTimerDelegate {
    func did(finish: Bool)
}


protocol MyTimerDelegate {
    
}

class MyTimer {
    private var timer = Timer()
    private var miliseconds = 0
    private var counter = 0
    
    private var delegates: [MyTimerDelegate?]
    
    init(myTimerDelegates: MyTimerDelegate...) {
        delegates = myTimerDelegates
    }
    
    init() {
        delegates = []
    }
    
    func add(delegate: MyTimerDelegate) {
        //FIXIT: should check for duplicates
        delegates.append(delegate)
    }
    
    func start(mode: Mode, duration: Unit) {
        reset()
        
        switch duration {
        case .miliseconds(let amount):
            miliseconds = amount
        case .seconds(let amount):
            miliseconds = amount * 1000
        case .minutes(let amount):
            miliseconds = amount * 60000
        }
        
        timer.tolerance = 0.9
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
    }
    
    //    struct Config {
    //        var mode: Mode
    //        var unit: Unit
    //
    //        enum Mode {
    //            case countdown, timer
    //        }
    //
    //        enum Unit {
    //            case seconds(Int)
    //            case miliseconds(Int)
    //            case minutes(Int)
    //        }
    //    }
    
    
    private func reset() {
        timer.invalidate()
        counter = 0
        miliseconds = 0
        
    }
    
    enum Mode {
        case countdown, timer
    }
    
    enum Unit {
        case seconds(Int)
        case miliseconds(Int)
        case minutes(Int)
    }
    
    @objc private func updateTimer() {
        counter = counter + 1000 //refresh rate 1 sec `Timer.timeInterval`
        
        for delegate in delegates {
            if let delegate = delegate as? MyTimerUpdate {
                delegate.updateTimer(sec: (counter) / 1000)
            }
        }
        
        if miliseconds - counter <= 0 {
            timer.invalidate()
            counter = 0;
            
            for delegate in delegates {
                if let delegate = delegate as? MyTimerFinished {
                    delegate.did(finish: true)
                }
            }
            
            print("Timer has stopped")
        }
    }
}
