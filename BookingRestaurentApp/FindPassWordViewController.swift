//
//  FindPassWordViewController.swift
//  BookingRestaurentApp
//
//  Created by Đào Kiều Anh on 3/12/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Firebase

class FindPassWordViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBAction func btnBack(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let LogOutView = storyBoard.instantiateViewController(withIdentifier: "login") as! ViewController
        self.present(LogOutView, animated: true, completion: nil)
    }
    @IBAction func btnSend(_ sender: Any) {
    
        Auth.auth().sendPasswordReset(withEmail: txtEmail.text!) { error in
            
            // ...
            Auth.auth().languageCode = "fr"
            if(error == nil)
            {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let LoginView = storyBoard.instantiateViewController(withIdentifier: "login") as! ViewController
                self.present(LoginView, animated: true, completion: nil)
            }
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
