//
//  ProfileViewController.swift
//  BookingRestaurentApp
//
//  Created by Đào Kiều Anh on 3/21/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var txtphone: UITextField!
    @IBOutlet weak var imgavatar: UIImageView!
    @IBAction func btnsave(_ sender: Any) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = txtname.text
        changeRequest?.photoURL = NSURL(string: "http://2.bp.blogspot.com/-0yUMg-UzcQA/VHvNOcQXgbI/AAAAAAAAQlo/fALw0-y1z-U/s1600/Avatar-Facebook-an-danh-trang-1.jpg") as! URL
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let LogOutView = storyBoard.instantiateViewController(withIdentifier: "contacts") as! ContactsTableViewController
        self.present(LogOutView, animated: true, completion: nil)
        changeRequest?.commitChanges { (error) in
            // ...
            print("Error!")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = Auth.auth().currentUser
        if let user = user {
            let uid = user.uid
            let email = user.email
            let name = user.displayName
            let photoURL = user.photoURL
            let phone = user.phoneNumber
            // ...
            if(name != nil){
                txtname.text = name
            }
            if(phone != nil)
            {
                txtphone.text = phone
            }
            if(photoURL != nil){
                try? imgavatar.image = UIImage(data: NSData(contentsOf: photoURL!) as Data)
                
            }
            lblemail.text = email
            
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
