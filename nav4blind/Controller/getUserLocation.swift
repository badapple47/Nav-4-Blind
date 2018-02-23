//
//  getUserLocation.swift
//  nav4blind
//
//  Created by Pathompong Chaisri on 23/2/2561 BE.
//  Copyright © 2561 Pathompong Chaisri. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


var locationStack : [String] = []
var startLocation : String = ""


class getUserLocation: UIViewController {
    
    @IBOutlet weak var Next: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
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

        let executeTime: Double =  5
                    for i in 0...5 {
            let deadline: DispatchTime = .now() + (Double(i) * executeTime)
            DispatchQueue.main.asyncAfter(deadline: deadline) {
                
                print("ตัวนับรอบ \(i+1)")
                self.getUserLocation()
                self.counterLabel.text = "1-6 : \(i+1)"
                
                
            }
        }
        
        
     

    }

    func getUserLocation(){
        
        
        
        
        let user = "dev"
        let password = "dev12345"
        
        
        
        var headers: HTTPHeaders = [:]
        
        if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
        //    4C:57:CA:44:9E:4C
        
        self.defaultManager.request("https://10.34.250.12/api/location/v2/clients?macAddress=c8:b5:ad:01:1b:a1", headers: headers).authenticate(user: user, password: password)
            
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    var number1 : Int = 0
                    var number2 : Int = 0
                    

                    number1  = json[0]["mapCoordinate"]["x"].int!
                    number2  = json[0]["mapCoordinate"]["y"].int!

                    self.checkUserCurrentLocation(number1 : number1 , number2 : number2)

                case .failure(let error):
                    print(error)
                    
                    
                }
        }
        
    }
    
    func checkUserCurrentLocation(number1 : Int , number2: Int) {
        
        //start current location
        
        
        var CCurrent = [number1,number2];
        var CEntrance1 = [234,53];
        var CLadder1 = [239,70];
        var CToilet1Man = [278,77];
        var CToilet1Woman = [272,71];
        var CLibrary = [230,83];
        var CDSSRoom = [240,103];
        var CATRoom = [262,158];
        var CEntrance2 = [281,171];
        var CPublicRelation = [273,183];
        var CRoom102 = [251,184];
        var CLadder2 = [227,184];
        var CLift = [220,175];
        var CRoom104 = [203,175];
        var CRoom105 = [188,168];
        var CKKRoom = [180,194];
        var CRoom107 = [153,168];
        var CRoom108 = [127,168];
        var CRoom110 = [122,168];
        var CToilet2Man = [95,202];
        var CToilet2Woman = [89,200];
        var CLadder3 = [88,168];
        var CCopyStore = [78,163];
        var CRoom115 = [114,134];
        var CRoom116 = [114,129];
        var CRoom118 = [120,106];
        var CNode2 = [234,70];
        var CNode3 = [234,75];
        var CNode4 = [262,75];
        var CNode5 = [234,82];
        var CNode6 = [234,103];
        var CNode8 = [234,163];
        var CNode9 = [234,170];
        var CNode10 = [234,176];
        var CNode11 = [252,170];
        var CNode12 = [262,170];
        var CNode13 = [273,170];
        var CNode14 = [219,176];
        var CNode15 = [188,163];
        var CNode155 = [205,163];
        var CNode16 = [180,163];
        var CNode17 = [180,181];
        var CNode18 = [153,163];
        var CNode19 = [127,163];
        var CNode20 = [121,163];
        var CNode205 = [118,163];
        var CNode21 = [118,134];
        var CNode22 = [118,128];
        var CNode23 = [93,163];
        var CNode24 = [88,163];
        var CNode25 = [93,190];
        
        var arraylist = [[Int]]()
        
        arraylist.append( CEntrance1 )
        arraylist.append( CLadder1 )
        arraylist.append( CToilet1Man )
        arraylist.append( CToilet1Woman )
        arraylist.append( CLibrary )
        arraylist.append( CDSSRoom )
        arraylist.append( CATRoom )
        arraylist.append( CEntrance2 )
        arraylist.append( CPublicRelation )
        arraylist.append( CRoom102 )
        arraylist.append( CLadder2 )
        arraylist.append( CLift )
        arraylist.append( CRoom104 )
        arraylist.append( CRoom105 )
        arraylist.append( CKKRoom )
        arraylist.append( CRoom107 )
        arraylist.append( CRoom108 )
        arraylist.append( CRoom110 )
        arraylist.append( CToilet2Man )
        arraylist.append( CToilet2Woman )
        arraylist.append( CLadder3 )
        arraylist.append( CCopyStore )
        arraylist.append( CRoom115 )
        arraylist.append( CRoom116 )
        arraylist.append( CRoom118 )
        arraylist.append( CNode2 )
        arraylist.append( CNode3 )
        arraylist.append( CNode4 )
        arraylist.append( CNode5 )
        arraylist.append( CNode6 )
        arraylist.append( CNode8 )
        arraylist.append( CNode9 )
        arraylist.append( CNode10 )
        arraylist.append( CNode11 )
        arraylist.append( CNode12 )
        arraylist.append( CNode13 )
        arraylist.append( CNode14 )
        arraylist.append( CNode15 )
        arraylist.append( CNode155 )
        arraylist.append( CNode16 )
        arraylist.append( CNode17 )
        arraylist.append( CNode18 )
        arraylist.append( CNode19 )
        arraylist.append( CNode20 )
        arraylist.append( CNode205 )
        arraylist.append( CNode21 )
        arraylist.append( CNode22 )
        arraylist.append( CNode23 )
        arraylist.append( CNode24 )
        arraylist.append( CNode25 )
        
        var checkInEachXandY:Int = 0;
        var checkLastPithagorus:Double = 10000;
        var x:Double = 0
        var y:Double = 0
        var Pithagorus:Double = 0
        
        for var i in (0..<arraylist.count)
        {
            
            x = Double(CCurrent[0] -  arraylist[i][0])
            y = Double(CCurrent[1] - arraylist[i][1])
            Pithagorus = sqrt(x*y+y*y)
            if(Pithagorus<checkLastPithagorus){
                checkLastPithagorus = Pithagorus
                checkInEachXandY = i+1;
            }
            
            
        }
        

        
        var NumWithPlace = [Int: String]()

        NumWithPlace[1] = "Entrance1"
        NumWithPlace[2] = "Ladder1"
        NumWithPlace[3] = "Toilet1Man"
        NumWithPlace[4] = "Toilet1Woman"
        NumWithPlace[5] = "Library"
        NumWithPlace[6] = "DSSRoom"
        NumWithPlace[7] = "ATRoom"
        NumWithPlace[8] = "Entrance2"
        NumWithPlace[9] = "PublicRelation"
        NumWithPlace[10] = "Room102"
        NumWithPlace[11] = "Ladder2"
        NumWithPlace[12] = "Lift"
        NumWithPlace[13] = "Room104"
        NumWithPlace[14] = "Room105"
        NumWithPlace[15] = "KKRoom"
        NumWithPlace[16] = "Room107"
        NumWithPlace[17] = "Room108"
        NumWithPlace[18] = "Room110"
        NumWithPlace[19] = "Toilet2Man"
        NumWithPlace[20] = "Toilet2Woman"
        NumWithPlace[21] = "Ladder3"
        NumWithPlace[22] = "CopyStore"
        NumWithPlace[23] = "Room115"
        NumWithPlace[24] = "Room116"
        NumWithPlace[25] = "Room118"
        NumWithPlace[26] = "Node2"
        NumWithPlace[27] = "Node3"
        NumWithPlace[28] = "Node4"
        NumWithPlace[29] = "Node5"
        NumWithPlace[30] = "Node6"
        NumWithPlace[31] = "Node8"
        NumWithPlace[32] = "Node9"
        NumWithPlace[33] = "Node10"
        NumWithPlace[34] = "Node11"
        NumWithPlace[35] = "Node12"
        NumWithPlace[36] = "Node13"
        NumWithPlace[37] = "Node14"
        NumWithPlace[38] = "Node15"
        NumWithPlace[39] = "Node155"
        NumWithPlace[40] = "Node16"
        NumWithPlace[41] = "Node17"
        NumWithPlace[42] = "Node18"
        NumWithPlace[43] = "Node19"
        NumWithPlace[44] = "Node20"
        NumWithPlace[45] = "Node205"
        NumWithPlace[46] = "Node21"
        NumWithPlace[47] = "Node22"
        NumWithPlace[48] = "Node23"
        NumWithPlace[49] = "Node24"
        NumWithPlace[50] = "Node25"
        
        print("Your Current Location is : \(NumWithPlace[checkInEachXandY]!)")
        

        locationStack.append(NumWithPlace[checkInEachXandY]!)
        print(locationStack)
        
        if locationStack.count == 6 {
        summaryAndPassValue()
        }

        
    }
    
    
    func summaryAndPassValue() {
        
       var counts: [String: Int] = [:]
        
        for item in locationStack {
            counts[item] = (counts[item] ?? 0) + 1
        }
        
        print(counts)
        
        var tempNumber = 0
        var tempStr = ""
        
        for (key, value) in counts {
            
            if value > tempNumber{
                tempNumber = value
                tempStr = key
                
            }
            
            
        }
        

        Next.isHidden = false
        locationLabel.text = "คุณอยู่ที่ : \(tempStr)"
            
        
        
    }

//end class
}

