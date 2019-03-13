//
//  RegisterViewController.swift
//  BookingRestaurentApp
//
//  Created by Đào Kiều Anh on 3/10/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtrEmail: UITextField!
    @IBOutlet weak var txtrPassword: UITextField!
    @IBOutlet weak var txtrCfpassword: UITextField!
    //@IBOutlet weak var txtrCfpassword: UITextField!
    @IBOutlet weak var lblreport: UILabel!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var lblReport: UILabel!
    @IBAction func btnRegisterAccount(_ sender: Any) {
    if(txtrPassword.text == txtrCfpassword.text)
    {
              Auth.auth().createUser(withEmail: txtrEmail.text!, password: txtrPassword.text!) { Auth, error in

                    if(error == nil){
                    print("Susscess!")
                        self.lblreport.isHidden = true
           }
             else
             {
                //self.lblReport.text = "error!"
            
           }
        }
        }
        else
    {
        self.lblreport.isHidden = false
        }
    }
    override func viewDidLoad() {
        // Use Firebase library to configure APIs
        super.viewDidLoad()
        lblreport.isHidden = true
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
