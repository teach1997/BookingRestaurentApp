import Foundation
import Firebase

class resmodel
{
    var ResName: String = ""
    var ResMap: String = ""
    var Rate: String = ""
    let ref: DatabaseReference!
    
//    init(text: String) {
//        self.text = text
//        ref = Database.database().reference().child("ResInformation").childByAutoId()
//    }
    
    init(snapshot: DataSnapshot)
    {
        ref = snapshot.ref
        if let value = snapshot.value as? [String : Any] {
            ResName = value["ResName"] as! String
            ResMap = value["ResMapx-y"] as! String
            Rate = value["Menu"] as! String
        }
    }

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
