//
//  BahenExploreMode.swift
//  UofTwithME
//
//  Created by vicky xu on 2020-08-06.
//

import UIKit

class BahenExploreMore: UIViewController {

    @IBOutlet weak var message: UILabel!
    
    @IBAction func clicktochange(_ sender: Any) {
        let quotes = [
                    "ECE, \nCS, \nand IT",
                    "Faculty of Applied Science and Engineering, \nFaculty of Engineering, \nand Faculty of Mathematics",
                    "8 floors, \n50 laboratoris, \n10 lecture theatres, \n13 tutorial rooms, \n9 seminar rooms, \nand ~300 offices"
                    ]

        let index = Int.random(in: 0...2)
        let aQuote = quotes[index]
        self.message.text = aQuote
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
