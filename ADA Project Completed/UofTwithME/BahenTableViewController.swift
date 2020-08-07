//
//  BahenTableViewController.swift
//  UofTwithME
//
//  Created by vicky xu on 2020-08-02.
//

import UIKit

class BahenTableViewController: UITableViewController {
    let floors = ["1st Floor", "2nd Floor", "3rd Floor"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return floors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FloorCell", for: indexPath)
        //display cell text
        cell.textLabel?.text = floors[indexPath.row]

        return cell
    }

}

extension BahenTableViewController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            performSegue(withIdentifier: "ToBahenFirstFloor", sender: self)
        }
        if indexPath.row == 1{
            performSegue(withIdentifier: "ToBahenSecondFloor", sender: self)
        }
        if indexPath.row == 2{
            performSegue(withIdentifier: "ToBahenThirdFloor", sender: self)
        }
    }
}
