//
//  WalletViewController.swift
//  BookingRestaurentApp
//
//  Created by Đào Kiều Anh on 3/22/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Firebase

class WalletViewController: UIViewController {

    //@IBOutlet weak var title: UINavigationBar!
    @IBOutlet weak var lblusername: UILabel!
    @IBOutlet weak var lblcoin: UILabel!
    @IBOutlet weak var btnenter: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = Auth.auth().currentUser
        if let user = user {
            let name = user.displayName
            // ...
        if(name != nil)
        {
            lblusername.text = name
            }
        else{
            lblusername.text = "No Name"
            }
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
}
