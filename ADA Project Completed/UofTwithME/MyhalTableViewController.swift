//
//  MyhalTableViewController.swift
//  UofTwithME
//
//  Created by Grace on 2020-07-31.
//

import UIKit

class MyhalTableViewController: UITableViewController {
    let floors = ["Basement", "1st Floor", "2nd Floor"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return floors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FloorCell", for: indexPath)
        //display cell text
        cell.textLabel?.text = floors[indexPath.row]

        return cell
    }
}

extension MyhalTableViewController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            performSegue(withIdentifier: "ToMyhalBasement", sender: self)
        }
        if indexPath.row == 1{
            performSegue(withIdentifier: "ToMyhalFirstFloor", sender: self)
        }
        if indexPath.row == 2{
            performSegue(withIdentifier: "ToMyhalSecondFloor", sender: self)
        }
    }
}

