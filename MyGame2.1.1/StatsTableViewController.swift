//
//  StatsTableViewController.swift
//  MyGame2.1.1
//
//  Created by Karol on 24/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import UIKit
import CoreData

class StatsTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    var players = [Player]()
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBAction func shareButton(_ sender: UIBarButtonItem) {
        let csv = ExportToCSV.export()
        
        let objectsToShare = [csv]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
        self.present(activityVC, animated: true, completion: nil)
    }
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "exitFromStats", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        do {
            let results = try DatabaseController.getContext().fetch(Player.fetchRequest())
            players = results as! [Player]
        } catch {
            print("Error")
        }
        
        infoLabel.text = "Total players: \(players.count)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailedStats", let destination = segue.destination as? DetailedStatsTableViewController {
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
                let player = players[indexPath.row]
                destination.player = player
            }
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let row = indexPath.row
        
        cell.detailTextLabel?.text = "\(players[row].sexValue) of age: \(players[row].age) with lateralisation: \(players[row].lateralisationValue)"

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    func deleteFromDatabase(player: Player) {
        let context = DatabaseController.getContext()
        context.delete(player)
        DatabaseController.saveContext()
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            deleteFromDatabase(player: players[indexPath.row])
            players.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
