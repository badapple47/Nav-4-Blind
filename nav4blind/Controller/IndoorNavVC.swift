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
import Foundation


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
        
        

//        let overlay: UIView = UIView(frame: CGRect(x: 234 * 0.980 , y:  83 * 1.46 , width: 5, height: 5))
        
        // for imageview  288 * 281
        
        
        var xcorOut : Double! = 281.81
        
        var ycorOut : Double! = 54.68
   
       
        
        
        var helloWorldTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(IndoorNavVC.marksMan), userInfo: [
            "X": xcorOut, "Y": ycorOut], repeats: true)
        
     
        
        
        
    }

    

    
    @objc func marksMan (val :Timer){
        
        //รับค่าจาก userinfo
         let userInfo = val.userInfo as! Dictionary<String, AnyObject>
        
        var loopcounter : Int! = 0

      
      //แปลงให้เป็น double
        let xcorIn : Double! =  (userInfo["X"] as? NSNumber)?.doubleValue
        let ycorIn : Double! =  (userInfo["Y"] as? NSNumber)?.doubleValue
        

            
            let overlay: UIView = UIView(frame: CGRect(x: xcorIn * 0.822, y:  ycorIn * 1.03, width: 5, height: 5))
            
            
            overlay.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        
        
            
            imageView.addSubview(overlay)

//        imageView.delete(overlay)

        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            overlay.removeFromSuperview()
       

//            let viewToRemove = self.imageView.viewWithTag(0)
//            viewToRemove?.removeFromSuperview()

//            print("delay")
//            self.coordinateLabel.text = "delay"

        })

            
            
            loopcounter = loopcounter + 1
        
        
    }
    
   
    
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    
}

