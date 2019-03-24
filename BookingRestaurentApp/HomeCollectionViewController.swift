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
    var reslist = [resmodel]()
    //var restaurent = [resmodel]()
    var menures = [resmenu]()
    var hinhref: Array<UIImage> = Array<UIImage>()
    
    //var refres:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var storage = Storage.storage().reference(forURL: "gs://bookingrestaurentapp.appspot.com/")
        let refres = Database.database().reference().child("ResInformation");
        
        refres.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0{
                self.reslist.removeAll()
                
                for res in snapshot.children.allObjects as![DataSnapshot]{
                    let resobj = res.value as? [String: AnyObject]
                    let resname = resobj?["ResName"]
                    let resmap = resobj?["ResMapx-y"]
                    let rate = resobj?["Menu"]
                    let id = resobj?["id"]
                    let mon1 = resobj?["Mon1"]
                    let mon2 = resobj?["Mon2"]
                    let mon3 = resobj?["Mon3"]
                    let tenhinh: String = id as! String + ".jpg"
                    let hinh: String = "https://firebasestorage.googleapis.com/v0/b/bookingrestaurentapp.appspot.com/o/\(tenhinh)?alt=media&token=27e832ea-365f-45e2-b574-6404780b9503"
                    
                    
                    /*
                    let islandRef = storage.child("images/\(tenhinh)")
                    islandRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                        if(error != nil) {
                            print("error download image")
                            print(tenhinh)
                            print("images/\(tenhinh)")
                        } else {
                            let image = UIImage(data: data!)
                            self.hinhref.append(image!)
                        }
                    }
                    */
                    //let id = resobj?["id"]
                    let resmenuref = resmenu(mon1: mon1 as! String, mon2: mon2 as! String, mon3: mon3 as! String)
                    let resi = resmodel(ResName: resname as! String?, ResMap: resmap as! String?, Rate: rate as! String?, id: id as! String?, hinh: hinh as! String?)
                    self.menures.append(resmenuref)
                    self.reslist.append(resi)
                    //self.arrid.append(id as! String)
                }
                self.collectionView!.reloadData()
            }
            
        })
        
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
            return self.reslist.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell

        let res: resmodel
        res = reslist[indexPath.row]
        let url = URL(string: res.hinh!)
        let data = try? Data(contentsOf: url!)
        cell.lblrate.text = res.Rate
        cell.title.topItem?.title = res.ResName
        cell.imgrestaurent.image = UIImage(data: data!)
        
        
    
        // Configure the cell
    
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let LogInView = storyBoard.instantiateViewController(withIdentifier: "selectres") as! SelectRestaurentViewController
        let res: resmodel
        let menu: resmenu
        menu = menures[indexPath.row]
        res = reslist[indexPath.row]
        LogInView.getname = res.ResName!
        LogInView.getrate = res.Rate!
        LogInView.menu = [menu.mon1, menu.mon2, menu.mon3] as! [String]
        
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
