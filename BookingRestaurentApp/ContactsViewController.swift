//
//  ContactsViewController.swift
//  BookingRestaurentApp
//
//  Created by Đào Kiều Anh on 3/11/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Firebase

class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var didselect: UITableView!
    var rowselect:[String] = []
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowselect.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let Cell : UITableViewCell = self.didselect.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        Cell.textLabel?.text = rowselect[indexPath.row]
        return Cell
    }
    @IBOutlet weak var imgavatar: UIImageView!
    // @IBOutlet weak var imgAvatar: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        rowselect = ["Information","Security","Wallet","Booking","History","Log Out!"]
        let calendar = Calendar.current
        var components = DateComponents()
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        let dateString = dateFormatter.string(from: currentDate)
        print(dateString)
        var hour:Int? = Int(dateString)
        if(hour! >= 18 || hour! < 6)
        {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Moon.png")!)
        }
        else
        {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Sun.png")!)
        }

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
