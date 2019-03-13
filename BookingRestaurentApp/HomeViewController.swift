//
//  HomeViewController.swift
//  BookingRestaurentApp
//
//  Created by Đào Kiều Anh on 3/11/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var btnbacktabbar: UIButton!
    @IBOutlet weak var btnlogout: UIButton!
    @IBAction func btnLogOut(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let LogOutView = storyBoard.instantiateViewController(withIdentifier: "login") as! ViewController
            self.present(LogOutView, animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
