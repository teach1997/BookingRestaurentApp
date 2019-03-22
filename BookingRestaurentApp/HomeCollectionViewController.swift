//
//  HomeCollectionViewController.swift
//  BookingRestaurentApp
//
//  Created by Đào Kiều Anh on 3/16/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "Cell"

class HomeCollectionViewController: UICollectionViewController {
//    var resref: DatabaseReference!
    var arrResName: Array<String> = Array<String>()
    var arrResMap: Array<String> = Array<String>()
    var ArrRate: Array<String> = Array<String>()
    //var resref: DatabaseReference!
    var restaurent = [resmodel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let resref = Database.database().reference().child("ResInformation")
        resref.observe(.value, with: {(snapshot) in
            self.restaurent.removeAll()
            if let firebaseDic = snapshot.value as? [String: AnyObject]
            {
                for p in firebaseDic{
                    let res: String = p.1 as! String
                    self.arrResName.append(res["ResName"])
                    self.ArrRate.append(res["Menu"])
                }
                //                let childsnapshot = child as! DataSnapshot
//                let resin = resmodel(snapshot: childsnapshot)
//                print(resin)
//                self.restaurent.insert(resin, at: 0)
            }
        })
    
                

        print("dasdsagsdgasdgdasg")
        print(arrResName.count)
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
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
            return arrResName.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        cell.lbltestcell.text = "1"
    
        // Configure the cell
    
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let LogInView = storyBoard.instantiateViewController(withIdentifier: "selectedRes") as! selectedViewController
        self.present(LogInView, animated: true, completion: nil)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
