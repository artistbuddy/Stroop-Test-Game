//
//  DetailedStatsTableViewController.swift
//  MyGame2.1.1
//
//  Created by Karol on 24/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import UIKit

class DetailedStatsTableViewController: UITableViewController {
    var player: Player?
    var games: [Games]? {
        return player?.games?.allObjects as? [Games]
    }
    var gamesPlayedLeftHand: [Games]? {
        var games = [Games]()
        for game in self.games! {
            if game.handValue == Hand.left {
                games.append(game)
            }
        }
        
        return games
    }
    var gamesPlayedRightHand: [Games]? {
        var games = [Games]()
        for game in self.games! {
            if game.handValue == Hand.right {
                games.append(game)
            }
        }
        
        return games
    }
    var averageReactionForRightHand: Double? {
        var totalTime = 0.0
        
        for game in gamesPlayedRightHand! {
            totalTime = totalTime + game.reactionTime
        }
        
        if let totalGames = gamesPlayedRightHand?.count {
            return totalTime / Double(totalGames)
        }
        
        return nil
    }
    var averageReactionForLefttHand: Double? {
        var totalTime = 0.0
        
        for game in gamesPlayedLeftHand! {
            totalTime = totalTime + game.reactionTime
        }
        
        if let totalGames = gamesPlayedLeftHand?.count {
            return totalTime / Double(totalGames)
        }
        
        return nil
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return gamesPlayedLeftHand!.count
        case 1:
            return gamesPlayedRightHand!.count
        default:
            return games!.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            if let average = averageReactionForLefttHand {
                return "Left hand: \(average)"
            }
            
            return "Left hand"
            
        case 1:
            if let average = averageReactionForRightHand {
                return "Right hand: \(average)"
            }
            
            return "Right hand"
        default:
            return "Any hand"
        }

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var games: [Games]?
        
        switch indexPath.section {
        case 0:
            games = self.gamesPlayedLeftHand
        case 1:
            games = self.gamesPlayedRightHand
        default:
            games = self.games
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let row = indexPath.row

        cell.textLabel?.text = "\(games![row].score) points, ratio: \(games![row].ratio)%"
        cell.detailTextLabel?.text = "Reaction for \(games![row].handValue) hand: \(games![row].reactionTime)"

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
