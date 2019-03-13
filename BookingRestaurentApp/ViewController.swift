//
//  ViewController.swift
//  BookingRestaurentApp
//
//  Created by Đào Kiều Anh on 3/10/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var lblreportlogin: UILabel!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBAction func btnLogin(_ sender: Any) {
        Auth.auth().signIn(withEmail: txtemail.text!, password: txtpassword.text!) { [weak self] user, error in
            guard let strongSelf = self else { return }
            if(error == nil)
            {
                self?.lblreportlogin.isHidden = true
                print("Login Suscess!")
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let LogInView = storyBoard.instantiateViewController(withIdentifier: "tabbar") as! TabBarViewController
                self?.present(LogInView, animated: true, completion: nil)
                
                
                //self?.navigationController?.pushViewController(LogInView, animated: true)
                
            }
            else
            {
                self?.lblreportlogin.isHidden = false
            }
        }
    }
    override func viewDidLoad() {
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
        lblreportlogin.isHidden = true
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    class setBackground
    {

    }
}


