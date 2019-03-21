//
//  changePassViewController.swift
//  BookingRestaurentApp
//
//  Created by Đào Kiều Anh on 3/21/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Firebase

class changePassViewController: UIViewController {

    @IBOutlet weak var txtoldpass: UITextField!
    @IBOutlet weak var txtnewpass: UITextField!
    @IBOutlet weak var txtcfnewpass: UITextField!
    @IBAction func btnsave(_ sender: Any) {
        if ( txtnewpass == txtcfnewpass){
        Auth.auth().currentUser?.updatePassword(to: txtnewpass.text!) { (error) in
            // ...
        }
        
        }}
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = Auth.auth().currentUser
        if let user = user {
            let uid = user.uid
            let email = user.email
            let photoURL = user.photoURL
            // ...
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
