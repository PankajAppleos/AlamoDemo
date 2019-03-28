//
//  ViewController.swift
//  AlamoDemo
//
//  Created by FM-MAC5 on 09/10/18.
//  Copyright © 2018 FM-MAC5. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tlbJSON: UITableView!
   
    var arry = [[String:AnyObject]]() // Array of dictionary
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return arry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell =  (tlbJSON?.dequeueReusableCell(withIdentifier: "cell")!)!
        var dic = arry[indexPath.row]
        cell.textLabel?.text = dic["Date"] as? String
        cell.detailTextLabel?.text = dic["RoomTypeCode"] as? String
        
        return cell
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tlbJSON?.delegate = self
        tlbJSON?.dataSource = self
        Data()
    }

    func Data(){
//        Alamofire.request(" http://api.androidhive.info/contacts/").responseData{(resData)->Void in
//            print(resData.result.value as Any)
//            let str = String(data: resData.result.value!, encoding: String.Encoding.utf8)
//            print(str!)
//        }
//
//        Alamofire.request(" http://api.androidhive.info/contacts/").responseJSON{(resData)->Void in
//            if resData.result.value != nil{
//                let swiftyjson = JSON(resData.result.value!)
//                print(swiftyjson)
//        }
//        }
        Alamofire.request("http://192.168.0.204/Test/api/CmsGetRoomWiseAvailabilityCount/FunGetRoomWiseCount?Hotelid=000&Groupcode=000&Propcode=001&RoomTypeCode=002&Date=2017-09- 25&ClubId=47&SourceApp=WLA&PackageName=KC6gigEIQQxTtmHlUuWJg2sBKfOIxpkTr5dGpUh6GXC/mqH").responseJSON{(responseData)->Void in
            if (responseData.result.value != nil)
            {
                var swiftyjsonvar = JSON(responseData.result.value!)
                print(swiftyjsonvar)
                if let resdata = swiftyjsonvar["Result"].arrayObject{
                    self.arry = resdata as! [[String:AnyObject]]
        }
                if self.arry.count > 0{
                    self.tlbJSON?.reloadData()
        }
    }
    }
}
    
    
}

