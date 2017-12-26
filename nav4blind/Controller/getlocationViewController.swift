//
//  getlocationViewController.swift
//  nav4blind
//
//  Created by Pathompong Chaisri on 11/23/2560 BE.
//  Copyright © 2560 Pathompong Chaisri. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
import Foundation

var informationData = [String]()
//var informationData:JSON?

class getlocationViewController: UIViewController {
    
    let defaultManager: Alamofire.SessionManager = {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "10.34.250.12": .disableEvaluation
        ]
        
        
        return SessionManager(
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        
        
       
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getlocation(_ sender: Any) {
        
        var time1 = NSDate().timeIntervalSince1970
//        let ticks1 = Date().ticks
        
        let user = "dev"
        let password = "dev12345"
        
        var headers: HTTPHeaders = [:]
        
        if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
        
        self.defaultManager.request("https://10.34.250.12/api/location/v2/clients?macAddress=4C:57:CA:44:9E:4C", headers: headers).authenticate(user: user, password: password)
            
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    var time2 = NSDate().timeIntervalSince1970
                    
                    
                    
                    //                    print("map: \(json[0]["mapCoordinate"]["x"].stringValue + "," + json[0]["mapCoordinate"]["y"].stringValue)")
                    
                    print(json[0]["mapCoordinate"])
                    print(json[0]["statistics"])
                    
                    informationData.append(json[0]["mapCoordinate"].stringValue)
                    print(informationData)
                    
                    let alert = UIAlertController(title: "Date and Location", message: "\(json[0]["mapCoordinate"]) , \(json[0]["statistics"]) time1 = \(time1) time2 = \(time2)", preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add the actions (buttons)
                    alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: nil))
                    alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
                    
                    self.present(alert, animated: true, completion: nil)
                    
                    
                    
                    
                    
                    
                case .failure(let error):
                    print(error)
                    
                    
                }
                
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
