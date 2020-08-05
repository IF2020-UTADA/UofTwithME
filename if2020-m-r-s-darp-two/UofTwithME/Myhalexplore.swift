//
//  Myhalexplore.swift
//  UofTwithME
//
//  Created by Maggie on 2020/8/4.
//

import UIKit

class Myhalexplore: UIViewController {

    @IBOutlet weak var message: UILabel!
    @IBAction func clicktochange(_ sender: Any) {
        let quotes = [
          "NPlay Kahoot and make Pichaku in MY150.",
          "Practice Pomodoro time and play Landlord in MY350.",
          "A cistern below Level 0 collects rainwater for landscape irrigation.",
          "The unique collaborative configuration of the Myhal Centre's 468-seat Lee & Margaret Lau Auditorium is first of its kind in North America",
          "Dedicated student-club space enhances co-curricular experiences from performing music to designing a race car.",
          "Prototyping and fabrication facilities enable student and faculty entrepreneurs to rapidly advance their ideas from concept to product."
          ]

        let index = Int.random(in: 0...5)
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
