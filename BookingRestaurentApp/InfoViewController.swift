//
//  InfoViewController.swift
//  BookingRestaurentApp
//
//  Created by Đào Kiều Anh on 3/21/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Firebase

class InfoViewController: UIViewController {
    var refinfo: DatabaseReference!
    @IBOutlet weak var txtfullname: UITextField!
    @IBOutlet weak var txtphone: UITextField!
    @IBOutlet weak var txtaddress: UITextField!
    @IBAction func btnsave(_ sender: Any) {
        addUserinfo()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        refinfo = Database.database().reference().child("-La_FqLWnpaiiZApnKVZ");
        
        // Do any additional setup after loading the view.
    }
    func addUserinfo() {
        let key = refinfo.childByAutoId().key
        let user = ["id" : key, "Mon1" : txtfullname.text! as String, "Mon2" : txtphone.text! as String, "Mon3" : txtaddress.text! as String ]
        refinfo.child(key!).setValue(user)
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
