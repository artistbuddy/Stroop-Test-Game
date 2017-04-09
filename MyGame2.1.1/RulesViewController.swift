//
//  RulesViewController.swift
//  MyGame2.1.1
//
//  Created by Karol on 30/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController {
    @IBOutlet weak var contentTtitle: UILabel!

    @IBOutlet weak var content: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        contentTtitle.text = NSLocalizedString("Rules", comment: "title content in Rules View Controller")
        content.text = NSLocalizedString("You gonna play the Color Game. You'll see a colored text. Answer what color is that text. Remember to select meaning of text not color. Give it a try!", comment: "content in Rules View Controller")
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
