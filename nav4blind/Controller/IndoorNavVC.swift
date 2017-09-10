//
//  IndoorNavVC.swift
//  nav4blind
//
//  Created by Pathompong Chaisri on 9/5/2560 BE.
//  Copyright © 2560 Pathompong Chaisri. All rights reserved.
//

import UIKit
import Alamofire








class IndoorNavVC: UIViewController {
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var request = URLRequest(url: URL(string: "https://api.github.com/users/badapple47")!)
//        request.httpMethod = "GET"
//        let session = URLSession.shared
//
//        session.dataTask(with: request) {data, response, err in
//            print("Entered the completionHandler")
//            print(data)
//            print(response)
//            }.resume()
        
        
//        let username = "Lalita"
//        let password = "indoor123"
//        let loginString = String(format: "%@:%@", username, password)
//        let loginData = loginString.data(using: String.Encoding.utf8)!
//        let base64LoginString = loginData.base64EncodedString()
//
//        // create the request
//        let url = URL(string: "10.34.250.12/api/location/v2/clients/count/")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
//
//        // fire off the request
//        // make sure your class conforms to NSURLConnectionDelegate
//        let urlConnection = NSURLConnection(request: request, delegate: self)
//
        
        
        
//
//        let strMethod = String(format : "https://10.34.250.12/api/location/v2/clients/count" )
//        let params: [String : Any] = [
//            "Lalita": "indoor123"]
//        print(params)
//        let url = URL(string: strMethod)!
//        let data = try! JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.prettyPrinted)
//        let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
//        if let json = json {
//            print(json)
//        }
//        let jsonData = json!.data(using: String.Encoding.utf8.rawValue);
//        var request = URLRequest(url: url)
//        request.httpMethod = HTTPMethod.post.rawValue
//        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
//        request.httpBody = jsonData
//        Alamofire.request(request).responseJSON {
//            (response) in
//            switch response.result {
//            case .success(let JSON2):
//                print("Success with JSON: \(JSON2)")
//                break
//            case .failure(let error):
//                print("Request failed with error: \(error)")
//                //callback(response.result.value as? NSMutableDictionary,error as NSError?)
//                break
//            }
//            }
//            .responseString { response in
//
//                print("Response String: \(response.result.value)")
//
//        }
//
        
//        let user = "Lalita"
//        let password = "indoor123"
//
//        Alamofire.request("http://10.34.250.12/api/location/v2/clients/count")
//            .authenticate(user: user, password: password)
//            .responseJSON { response in
//                print("Waiting for response")
//                debugPrint(response)
//        }
        
        let user = "Lalita"
        let password = "indoor123"
        
        let credential = URLCredential(user: user, password: password, persistence: .forSession)
        
        Alamofire.request("https://10.34.250.12/api/location/v2/clients/count")
            .authenticate(usingCredential: credential)
            .responseJSON { response in
                debugPrint(response)
        }
  
        
    
        
   
    }

    
    

    


}
