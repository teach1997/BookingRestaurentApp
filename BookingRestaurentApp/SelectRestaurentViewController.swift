//
//  SelectRestaurentViewController.swift
//  BookingRestaurentApp
//
//  Created by Đào Kiều Anh on 3/18/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import MapKit
import Firebase

class SelectRestaurentViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var res: MKMapView!
    @IBOutlet weak var lblrate: UILabel!
    @IBOutlet weak var lblresname: UILabel!
    final class resAnnotation: NSObject, MKAnnotation{
        var coordinate: CLLocationCoordinate2D
        var title: String?
        var subtitle: String?
        init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String? ){
            self.coordinate = coordinate
            self.title = title
            self.subtitle = subtitle
            super.init()
        }
        
        
    }
    var getname = String()
    var getrate = String()
    var getid = String()
    var getmap = String()
    var menu = [String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UITableViewCell
        cell?.textLabel?.text = menu[indexPath.row]
        return cell!
    }
    
    

    @IBOutlet weak var menuTableview: UITableView!
    
    var resm: [String] = [""]
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let maparr = getmap.components(separatedBy: "-")
        let mapx = maparr[0]
        let mapy = maparr[1]
        res.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        let rescoordinate =  CLLocationCoordinate2D(latitude: Double(mapx)!, longitude: Double(mapy)!)
        let resannotaion = resAnnotation(coordinate: rescoordinate, title: getname, subtitle: getname + getrate)
        res.addAnnotation(resannotaion)
 */
       /*
        let ref = Database.database().reference().child(getid)
        ref.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0{
                self.resm.removeAll()
            }
            for res in snapshot.children.allObjects as! [DataSnapshot]{
                let resobj = res.value as? [String: AnyObject]
                let mon1 = resobj?["Mon1"]
                let mon2 = resobj?["Mon2"]
                let mon3 = resobj?["Mon3"]
                self.resm = [mon1,mon2,mon3] as! [String]
            }
            
        })
        */
        lblrate.text = getrate
        lblresname.text = getname
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
