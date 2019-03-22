//
//  ContactsTableViewController.swift
//  BookingRestaurentApp
//
//  Created by Đào Kiều Anh on 3/18/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Firebase

class ContactsTableViewController: UITableViewController {
    var rowofcontacts: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        rowofcontacts = ["Account","Security","Wallet","History","LogOut!"]
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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return rowofcontacts.count
    }
*/
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rowofcontacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UITableViewCell
        cell?.textLabel?.text = rowofcontacts[indexPath.row]

        // Configure the cell...

        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 4) {
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
        if (indexPath.row == 0){
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let LogOutView = storyBoard.instantiateViewController(withIdentifier: "profile") as! ProfileViewController
            self.present(LogOutView, animated: true, completion: nil)
        }
        if (indexPath.row == 1) {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let backsite = storyBoard.instantiateViewController(withIdentifier: "changepass") as! changePassViewController
            self.present(backsite, animated: true, completion: nil)
        }
        if(indexPath.row == 2){
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let walletsite = storyBoard.instantiateViewController(withIdentifier: "wallet") as! WalletViewController
            self.present(walletsite, animated: true , completion: nil)
            
        }
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
