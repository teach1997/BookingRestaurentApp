//
//  ProfileViewController.swift
//  BookingRestaurentApp
//
//  Created by Đào Kiều Anh on 3/21/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var txtphone: UITextField!
    @IBOutlet weak var imgavatar: UIImageView!
    @IBAction func tapgesteravatar(_ sender: Any) {
        let img = UIImagePickerController()
        img.sourceType = UIImagePickerController.SourceType.photoLibrary
        img.delegate = self
        img.allowsEditing = true
        present(img, animated: true, completion: nil )
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var selectedImage: UIImage?
        if let editedImage = info[.editedImage] as? UIImage {
            selectedImage = editedImage
            self.imgavatar.image = selectedImage!
            picker.dismiss(animated: true, completion: nil)
        } else if let originalImage = info[.originalImage] as? UIImage {
            selectedImage = originalImage
            self.imgavatar.image = selectedImage!
            picker.dismiss(animated: true, completion: nil)
        }
        
    }
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
