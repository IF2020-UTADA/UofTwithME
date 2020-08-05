//
//  LocationSearchTable.swift
//  UofTwithME
//
//  Created by vicky xu on 2020-08-02.
//
import Foundation
import UIKit

class LocationSearchTable : UITableViewController{
    @IBOutlet weak var menuTableView: UITableView!

    let myTitle = ["Помощь", "Информация", "Поддержка"]
    override func viewDidLoad() {
        super.viewDidLoad()


        menuTableView.delegate = self
        menuTableView.dataSource = self
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTitle.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "Cell")
        cell.labelText.text = myTitle[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "sg", sender: self)
    }
}

extension LocationSearchTable : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }

}
