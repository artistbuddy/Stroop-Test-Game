//
//  MenuViewController.swift
//  MyGame2.1.1
//
//  Created by Karol on 08/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBAction func buttonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "showIntroduction", sender: sender)
    }
    @IBAction func statsButton(_ sender: UIButton) {
        performSegue(withIdentifier: "showStats", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showIntroduction" {
            if let destination = segue.destination as? AddPlayerViewController {

            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
