//
//  ViewController.swift
//  temp-joey
//
//  Created by Narat Suchartsunthorn on 9/13/17.
//  Copyright © 2017 Narat Suchartsunthorn. All rights reserved.
//
import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON


class IndoorNavVC: UIViewController {
    

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var coordinateLabel: UILabel!
    

    
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
        //        // Do any additional setup after loading the view, typically from a nib.
        //
        let user = "dev"
        let password = "dev12345"
        
        
        
        var headers: HTTPHeaders = [:]
        
        if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
        
        
        self.defaultManager.request("https://10.34.250.12/api/config/v1/maps/imagesource/domain_0_1500368087062.jpg", headers: headers).authenticate(user: user, password: password)
            
            .responseImage { response in
                
//                debugPrint(response)
                //                debugPrint(response.result)
                
                if let image = response.result.value {
                    self.imageView.image = image
                    
                }
        }
        
        
        self.defaultManager.request("https://10.34.250.12/api/location/v1/history/clients/78%3A4f%3A43%3A8a%3Adb%3Aab?date=2017%2F09%2F19", headers: headers).authenticate(user: user, password: password)
            
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
//                    print("JSON: \(json)")
//                    print("JSONDict: \(json["mapCoordinate"].stringValue)")
                    
                   print("map: \(json[0]["mapCoordinate"]["x"].stringValue + "," + json[0]["mapCoordinate"]["y"].stringValue)")
                    
                    
                    self.coordinateLabel.text = "x , y : " + json[0]["mapCoordinate"]["x"].stringValue + " , " + json[0]["mapCoordinate"]["y"].stringValue
                    
                case .failure(let error):
                    print(error)
                }
        }
        
        
        let overlay: UIView = UIView(frame: CGRect(x: 205.15 , y: 107.87  , width: 5, height: 5))
        
        overlay.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        
        imageView.addSubview(overlay)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    
}

