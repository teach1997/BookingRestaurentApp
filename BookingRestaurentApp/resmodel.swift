import Foundation
import Firebase

class resmodel
{
//    var id: String?
    var ResName: String?
    var ResMap: String?
    var Rate: String?
    var id: String?
    var hinh: String?
  //  let ref: DatabaseReference!
    
//    init(text: String) {
//        self.text = text
//        ref = Database.database().reference().child("ResInformation").childByAutoId()
//    }
    init(ResName:String?, ResMap: String?, Rate: String?, id: String?, hinh: String? ){
        self.ResName = ResName;
        self.ResMap = ResMap;
        self.Rate = Rate;
        self.id = id;
        self.hinh = hinh;
     //   self.hinh = hinh;
    }
//    init(snapshot: DataSnapshot)
//    {
//        ref = snapshot.ref
//        if let value = snapshot.value as? [String : Any] {
//            ResName = value["ResName"] as! String
//            ResMap = value["ResMapx-y"] as! String
//            Rate = value["Menu"] as! String
//        }
//    }

    /*
    func toDictionary() - [String : Any]
{
    return [
    "text" : text,
    "numberOfLikes" : numberOfLikes,
    "numberOfAngry" : numberOfAngry
    ]
    }
}
)
 */
}
