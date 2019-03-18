//
//  SelectRestaurentViewController.swift
//  BookingRestaurentApp
//
//  Created by Đào Kiều Anh on 3/18/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import MapKit

class SelectRestaurentViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var menu: [String] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UITableViewCell
        cell?.textLabel?.text = menu[indexPath.row]
        return cell!
    }
    
    

    @IBOutlet weak var menuTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        menu = ["1","2","3","4","5"]
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
