//
//  InstructionViewController.swift
//  MyGame2.1.1
//
//  Created by Karol on 30/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import UIKit

class InstructionViewController: UIViewController {
    @IBOutlet weak var contentTitle: UILabel!
    @IBOutlet weak var content: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        contentTitle.text = NSLocalizedString("Instruction", comment: "title content in Instruction View Controller")
        content.text = NSLocalizedString("The game has two parts. First, you play 3 times using right hand. Second, you play 3 times using left hand. Your goal is to answer as many times as you can in each game for 30 seconds.", comment: "content in Instruction View Controller")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
