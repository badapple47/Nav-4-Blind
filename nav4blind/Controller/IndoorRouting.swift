//
//  IndoorRouting.swift
//  nav4blind
//
//  Created by Pathompong Chaisri on 11/18/2560 BE.
//  Copyright © 2560 Pathompong Chaisri. All rights reserved.
//


import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
import Foundation
import Toast_Swift

//for realtimeRouting
struct pathStruct {
    var nodeName : String
    var x : Double
    var y : Double
}

////library to entrance1
//var VirtualCurrentLocationOnX : [Double]  = [230,232,234,234,234,234,234,234,234,234,234,234]
//var VirtualCurrentLocationOnY : [Double] = [83,82,82,78,75,72,70,67,63,59,57,53]

//library to toilet1man
var VirtualCurrentLocationOnX : [Double]  = [230,232,234,234,234,250,262,270,278]
var VirtualCurrentLocationOnY : [Double] = [83,82,82,78,75,75,75,75,77]




var checkArriveThisNodeYet = 0
var distanceToThisNode :Double = 0.0
var distance : Double?

var allPathRealTime = [pathStruct]()

//end declare for realtime routing

//เก็บ path ทั้งหมดที่ออกมาจาก shortest path

var allPath = [String]()
var routingmessage = [String]()


 var finaldestination:MyNode!


//For current location
var CCurrent = [51,51];
var CEntrance1 = [1,2];
var CLadder1 = [1,2];
var CToilet1Man = [1,2];
var CToilet1Woman = [1,2];
var CLibrary = [1,2];
var CDSSRoom = [1,2];
var CATRoom = [1,2];
var CEntrance2 = [1,2];
var CPublicRelation = [1,2];
var CRoom102 = [1,2];
var CLadder2 = [1,2];
var CLift = [1,2];
var CRoom104 = [1,2];
var CRoom105 = [1,2];
var CKKRoom = [50,49];
var CRoom107 = [1,2];
var CRoom108 = [1,2];
var CRoom110 = [1,2];
var CToilet2Man = [1,2];
var CToilet2Woman = [1,2];
var CLadder3 = [1,2];
var CCopyStore = [1,2];
var CRoom115 = [1,2];
var CRoom116 = [1,2];
var CRoom118 = [1,2];
var CNode2 = [1,2];
var CNode3 = [1,2];
var CNode4 = [1,2];
var CNode5 = [1,2];
var CNode6 = [1,2];
var CNode8 = [1,2];
var CNode9 = [1,2];
var CNode10 = [1,2];
var CNode11 = [1,2];
var CNode12 = [1,2];
var CNode13 = [1,2];
var CNode14 = [1,2];
var CNode15 = [1,2];
var CNode155 = [1,2];
var CNode16 = [1,2];
var CNode17 = [1,2];
var CNode18 = [1,2];
var CNode19 = [100,100];
var CNode20 = [1,2];
var CNode205 = [1,2];
var CNode21 = [1,2];
var CNode22 = [1,2];
var CNode23 = [1,2];
var CNode24 = [1,2];
var CNode25 = [1,2];





class IndoorRouting: UIViewController {
    
    var destination: String! = ""
    var startLocation: String! = ""


    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
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
        
        
        
        label1.text = "from \(startLocation!) to \(destination!)"
        
        print(selectedRow)

        


        

        
       
        
        let user = "dev"
        let password = "dev12345"
        
        
        
        var headers: HTTPHeaders = [:]
        
        if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
        
        
        self.defaultManager.request("https://10.34.250.12/api/config/v1/maps/imagesource/domain_0_1500368087062.jpg", headers: headers).authenticate(user: user, password: password)
            
            .responseImage { response in
                
                
                if let image = response.result.value {
                    self.imageView.image = image
                    
                    
                    
                }
        }
        
        let xcorOut : Double! = 231
        
        let ycorOut : Double! = 90
        
        
        //red dot blink
        
        let helloWorldTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(IndoorRouting.marksMan), userInfo: [
            "X": xcorOut, "Y": ycorOut], repeats: true)
        
        
        //start current location
        
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
        
        print(checkInEachXandY)
        
        
        
        
        var NumWithPlace = [Int: String]()
        
        
        NumWithPlace[1] = "Entrance1 "
        NumWithPlace[2] = "Ladder1 "
        NumWithPlace[3] = "Toilet1Man "
        NumWithPlace[4] = "Toilet1Woman "
        NumWithPlace[5] = "Library "
        NumWithPlace[6] = "DSSRoom "
        NumWithPlace[7] = "ATRoom "
        NumWithPlace[8] = "Entrance2 "
        NumWithPlace[9] = "PublicRelation "
        NumWithPlace[10] = "Room102 "
        NumWithPlace[11] = "Ladder2 "
        NumWithPlace[12] = "Lift "
        NumWithPlace[13] = "Room104 "
        NumWithPlace[14] = "Room105 "
        NumWithPlace[15] = "KKRoom "
        NumWithPlace[16] = "Room107 "
        NumWithPlace[17] = "Room108 "
        NumWithPlace[18] = "Room110 "
        NumWithPlace[19] = "Toilet2Man "
        NumWithPlace[20] = "Toilet2Woman "
        NumWithPlace[21] = "Ladder3 "
        NumWithPlace[22] = "CopyStore "
        NumWithPlace[23] = "Room115 "
        NumWithPlace[24] = "Room116 "
        NumWithPlace[25] = "Room118 "
        NumWithPlace[26] = "Node2 "
        NumWithPlace[27] = "Node3 "
        NumWithPlace[28] = "Node4 "
        NumWithPlace[29] = "Node5 "
        NumWithPlace[30] = "Node6 "
        NumWithPlace[31] = "Node8 "
        NumWithPlace[32] = "Node9 "
        NumWithPlace[33] = "Node10 "
        NumWithPlace[34] = "Node11 "
        NumWithPlace[35] = "Node12 "
        NumWithPlace[36] = "Node13 "
        NumWithPlace[37] = "Node14 "
        NumWithPlace[38] = "Node15 "
        NumWithPlace[39] = "Node155 "
        NumWithPlace[40] = "Node16 "
        NumWithPlace[41] = "Node17 "
        NumWithPlace[42] = "Node18 "
        NumWithPlace[43] = "Node19 "
        NumWithPlace[44] = "Node20 "
        NumWithPlace[45] = "Node205 "
        NumWithPlace[46] = "Node21 "
        NumWithPlace[47] = "Node22 "
        NumWithPlace[48] = "Node23 "
        NumWithPlace[49] = "Node24 "
        NumWithPlace[50] = "Node25 "
        
        print("Your Current Location is : \(NumWithPlace[checkInEachXandY]!)")
        
      
//end current location
        
        
        
        
        
        
        
      
       //end Viewdidload
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
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            overlay.removeFromSuperview()
            
        })
        loopcounter = loopcounter + 1
    }
    

    
    
    @IBAction func triggerShortest(_ sender: Any) {
        
        //For Shortest path
        let Entrance1 = MyNode(name: "Entrance1")
        let Node2 = MyNode(name: "Node2")
        let Ladder1 = MyNode(name: "Ladder1")
        let Node3 = MyNode(name: "Node3")
        let Node4 = MyNode(name: "Node4")
        let Toilet1Man = MyNode(name: "Toilet1Man")
        let Toilet1Woman = MyNode(name: "Toilet1Woman")
        let Node5 = MyNode(name: "Node5")
        let Library = MyNode(name: "Library")
        let Node6 = MyNode(name: "Node6")
        let DSSRoom = MyNode(name: "DSSRoom")
        let Node8 = MyNode(name: "Node8")
        let Node9 = MyNode(name: "Node9")
        let Node10 = MyNode(name: "Node10")
        let Node14 = MyNode(name: "Node14")
        let Ladder2 = MyNode(name: "Ladder2")
        let Lift = MyNode(name: "Lift")
        let Node11 = MyNode(name: "Node11")
        let Room102 = MyNode(name: "Room102")
        let Node12 = MyNode(name: "Node12")
        let ATRoom = MyNode(name: "ATRoom")
        let Node13 = MyNode(name: "Node13")
        let PublicRelation = MyNode(name: "PublicRelation")
        let Entrance2 = MyNode(name: "Entrance2")
        let Node155 = MyNode(name: "Node155")
        let Room104 = MyNode(name: "Room104")
        let Node15 = MyNode(name: "Node15")
        let Room105 = MyNode(name: "Room105")
        let Node16 = MyNode(name: "Node16")
        let KKRoom = MyNode(name: "KKRoom")
        let Node18 = MyNode(name: "Node18")
        let Room107 = MyNode(name: "Room107")
        let Node19 = MyNode(name: "Node19")
        let Room108 = MyNode(name: "Room108")
        let Node20 = MyNode(name: "Node20")
        let Room110 = MyNode(name: "Room110")
        let Node205 = MyNode(name: "Node205")
        let Node21 = MyNode(name: "Node21")
        let Room115 = MyNode(name: "Room115")
        let Node22 = MyNode(name: "Node22")
        let Room116 = MyNode(name: "Room116")
        let Room118 = MyNode(name: "Room118")
        let Node23 = MyNode(name: "Node23")
        let Node25 = MyNode(name: "Node25")
        let Toilet2Man = MyNode(name: "Toilet2Man")
        let Toilet2Woman = MyNode(name: "Toilet2Woman")
        let Node24 = MyNode(name: "Node24")
        let Ladder3 = MyNode(name: "Ladder3")
        let CopyStore = MyNode(name: "CopyStore")
        
        var allMynode = [MyNode]()
        
        allMynode = [Entrance1,Ladder1,Toilet1Man,Toilet1Woman,Library,DSSRoom,ATRoom,Entrance2,PublicRelation,Room102,Ladder2,Lift,Room104,Room105,KKRoom,Room107,Room108,Room110,Toilet2Man,Toilet2Woman,Ladder3,CopyStore,Room115,Room116,Room118]
        
        
        
        finaldestination = allMynode[selectedRow]

        Entrance1.connections.append(Connection(to: Node2, weight: 5))
        Node2.connections.append(Connection(to: Ladder1, weight: 1.4))
        Node2.connections.append(Connection(to: Node3, weight: 1.625))
        Node2.connections.append(Connection(to: Entrance1, weight: 5))
        Ladder1.connections.append(Connection(to: Node2, weight: 1))
        Node3.connections.append(Connection(to: Node2, weight: 1))
        Node3.connections.append(Connection(to: Node4, weight: 10.7))
        Node3.connections.append(Connection(to: Node5, weight: 2.25))
        Node4.connections.append(Connection(to: Node3, weight: 10.7))
        Node4.connections.append(Connection(to: Toilet1Man, weight: 1.1))
        Node4.connections.append(Connection(to: Toilet1Woman, weight: 1))
        Toilet1Man.connections.append(Connection(to: Node4, weight: 1.1))
        Toilet1Woman.connections.append(Connection(to: Node4, weight: 1))
        Node5.connections.append(Connection(to: Library, weight: 1.4))
        Node5.connections.append(Connection(to: Node3, weight: 10.7))
        Node5.connections.append(Connection(to: Node6, weight: 7))
        Library.connections.append(Connection(to: Node5, weight: 1.4))
        Node6.connections.append(Connection(to: Node5, weight: 7))
        Node6.connections.append(Connection(to: DSSRoom, weight: 1.4))
        Node6.connections.append(Connection(to: Node8, weight: 18))
        DSSRoom.connections.append(Connection(to: Node6, weight: 1.4))
        Node8.connections.append(Connection(to: Node6, weight: 18))
        Node8.connections.append(Connection(to: Node9, weight: 2.75))
        Node8.connections.append(Connection(to: Node155, weight: 9.1))
        Node9.connections.append(Connection(to: Node8, weight: 2.75))
        Node9.connections.append(Connection(to: Node10, weight: 1.25))
        Node9.connections.append(Connection(to: Node11, weight: 5.5))
        Node10.connections.append(Connection(to: Node9, weight: 1.25))
        Node10.connections.append(Connection(to: Node14, weight: 2.4))
        Node14.connections.append(Connection(to: Node10, weight: 2.4))
        Node14.connections.append(Connection(to: Ladder2, weight: 2.4))
        Node14.connections.append(Connection(to: Lift, weight: 4))
        Ladder2.connections.append(Connection(to: Node14, weight: 2.4))
        Lift.connections.append(Connection(to: Node14, weight: 4))
        Node11.connections.append(Connection(to: Node9, weight: 5.5))
        Node11.connections.append(Connection(to: Room102, weight: 3.75))
        Node11.connections.append(Connection(to: Node12, weight: 3.2))
        Room102.connections.append(Connection(to: Node11, weight: 3.75))
        Node12.connections.append(Connection(to: Node11, weight: 3.2))
        Node12.connections.append(Connection(to: ATRoom, weight: 3.75))
        Node12.connections.append(Connection(to: Node13, weight: 3.5))
        ATRoom.connections.append(Connection(to: Node12, weight: 3.75))
        Node13.connections.append(Connection(to: Node12, weight: 3.5))
        Node13.connections.append(Connection(to: PublicRelation, weight: 3.75))
        Node13.connections.append(Connection(to: Entrance2, weight: 2.6))
        PublicRelation.connections.append(Connection(to: Node13, weight: 3.75))
        Entrance2.connections.append(Connection(to: Node13, weight: 2.6))
        Node155.connections.append(Connection(to: Node8, weight: 9.1))
        Node155.connections.append(Connection(to: Room104, weight: 6))
        Node155.connections.append(Connection(to: Node15, weight: 5.4))
        Room104.connections.append(Connection(to: Node155, weight: 6))
        Node15.connections.append(Connection(to: Node155, weight: 5.4))
        Node15.connections.append(Connection(to: Room105, weight: 2.7))
        Node15.connections.append(Connection(to: Node16, weight: 2))
        Room105.connections.append(Connection(to: Node15, weight: 2.7))
        Node16.connections.append(Connection(to: Node15, weight: 2))
        Node16.connections.append(Connection(to: KKRoom, weight: 4.15))
        Node16.connections.append(Connection(to: Node18, weight: 5.8))
        KKRoom.connections.append(Connection(to: Node16, weight: 8.3))
        Node18.connections.append(Connection(to: Node16, weight: 5.8))
        Node18.connections.append(Connection(to: Room107, weight: 2.7))
        Node18.connections.append(Connection(to: Node19, weight: 7.8))
        Room107.connections.append(Connection(to: Node18, weight: 2.7))
        Node19.connections.append(Connection(to: Node18, weight: 7.8))
        Node19.connections.append(Connection(to: Room108, weight: 2.7))
        Node19.connections.append(Connection(to: Node20, weight: 1.7))
        Room108.connections.append(Connection(to: Node19, weight: 2.7))
        Node20.connections.append(Connection(to: Node19, weight: 1.7))
        Node20.connections.append(Connection(to: Room110, weight: 2.7))
        Node20.connections.append(Connection(to: Node205, weight: 0.8))
        Room110.connections.append(Connection(to: Node20, weight: 2.7))
        Node205.connections.append(Connection(to: Node20, weight: 0.8))
        Node205.connections.append(Connection(to: Node21, weight: 8.2))
        Node205.connections.append(Connection(to: Node23, weight: 7.5))
        Node21.connections.append(Connection(to: Node205, weight: 8.2))
        Node21.connections.append(Connection(to: Room115, weight: 1.4))
        Node21.connections.append(Connection(to: Node22, weight: 2))
        Room115.connections.append(Connection(to: Node21, weight: 1.4))
        Node22.connections.append(Connection(to: Node21, weight: 2))
        Node22.connections.append(Connection(to: Room116, weight: 1.4))
        Node22.connections.append(Connection(to: Room118, weight: 6.7))
        Room116.connections.append(Connection(to: Node22, weight: 1.4))
        Room118.connections.append(Connection(to: Node22, weight: 6.7))
        Node23.connections.append(Connection(to: Node205, weight: 7.5))
        Node23.connections.append(Connection(to: Node25, weight: 7))
        Node23.connections.append(Connection(to: Node24, weight: 1.75))
        Node25.connections.append(Connection(to: Node23, weight: 7))
        Node25.connections.append(Connection(to: Toilet2Man, weight: 3))
        Node25.connections.append(Connection(to: Toilet2Woman, weight: 1))
        Toilet2Man.connections.append(Connection(to: Node25, weight: 3))
        Toilet2Woman.connections.append(Connection(to: Node25, weight: 1))
        Node24.connections.append(Connection(to: Node23, weight: 1.75))
        Node24.connections.append(Connection(to: Ladder3, weight: 1.7))
        Node24.connections.append(Connection(to: CopyStore, weight: 0.5))
        Ladder3.connections.append(Connection(to: Node24, weight: 1.7))
        CopyStore.connections.append(Connection(to: Node24, weight: 0.5))
        
        let sourceNode = Library
        let destinationNode = finaldestination!
        
        var path = shortestPath(source: sourceNode, destination: destinationNode)
        
        if let succession: [String] = path?.array.reversed().flatMap({ $0 as? MyNode}).map({$0.name}) {
            print("Destination From \(sourceNode.name) to \(destinationNode.name)")
            print("🏁 Quickest path: \(succession)")
            print("🏁 Quickest Weight: \(sumWeight)")
            
            let alert = UIAlertController(title: "\(sourceNode.name) to \(destinationNode.name)", message: "🏁 Quickest path: \(succession) = \(sumWeight!) meter", preferredStyle: UIAlertControllerStyle.alert)
            
            //set allPath เพื่อเอาไปใช้ หาคำพูดในการบอกทาง
            allPath = succession
            
            for index in 0...allPath.count-1{
                
                
                switch allPath[index] {
                case "Entrance1":
                    let temp = pathStruct(nodeName: allPath[index] , x: 234, y: 53)
                    allPathRealTime.append(temp)
                case "Ladder1":
                    let temp = pathStruct(nodeName: allPath[index] , x: 239, y: 70)
                    allPathRealTime.append(temp)
                case "Toilet1Man":
                    let temp = pathStruct(nodeName: allPath[index] , x: 278, y: 77)
                    allPathRealTime.append(temp)
                case "Toilet1Woman":
                    let temp = pathStruct(nodeName: allPath[index] , x: 273, y: 71)
                    allPathRealTime.append(temp)
                case "Library":
                    let temp = pathStruct(nodeName: allPath[index] , x: 230, y: 83)
                    allPathRealTime.append(temp)
                case "DSSRoom":
                    let temp = pathStruct(nodeName: allPath[index] , x: 240, y: 103)
                    allPathRealTime.append(temp)
                case "ATRoom":
                    let temp = pathStruct(nodeName: allPath[index] , x: 262, y: 158)
                    allPathRealTime.append(temp)
                case "Entrance2":
                    let temp = pathStruct(nodeName: allPath[index] , x: 281, y: 171)
                    allPathRealTime.append(temp)
                case "PublicRelation":
                    let temp = pathStruct(nodeName: allPath[index] , x: 273, y: 183)
                    allPathRealTime.append(temp)
                case "Room102":
                    let temp = pathStruct(nodeName: allPath[index] , x: 251, y: 184)
                    allPathRealTime.append(temp)
                case "Ladder2":
                    let temp = pathStruct(nodeName: allPath[index] , x: 227, y: 184)
                    allPathRealTime.append(temp)
                case "Lift":
                    let temp = pathStruct(nodeName: allPath[index] , x: 220, y: 175)
                    allPathRealTime.append(temp)
                case "Room104":
                    let temp = pathStruct(nodeName: allPath[index] , x: 203, y: 175)
                    allPathRealTime.append(temp)
                case "Room105":
                    let temp = pathStruct(nodeName: allPath[index] , x: 188, y: 168)
                    allPathRealTime.append(temp)
                case "KKRoom":
                    let temp = pathStruct(nodeName: allPath[index] , x: 180, y: 194)
                    allPathRealTime.append(temp)
                case "Room107":
                    let temp = pathStruct(nodeName: allPath[index] , x: 153, y: 168)
                    allPathRealTime.append(temp)
                case "Room108":
                    let temp = pathStruct(nodeName: allPath[index] , x: 127, y: 168)
                    allPathRealTime.append(temp)
                case "Room110":
                    let temp = pathStruct(nodeName: allPath[index] , x: 122, y: 168)
                    allPathRealTime.append(temp)
                case "Toilet2Man":
                    let temp = pathStruct(nodeName: allPath[index] , x: 95, y: 202)
                    allPathRealTime.append(temp)
                case "Toilet2Woman":
                    let temp = pathStruct(nodeName: allPath[index] , x: 89, y: 200)
                    allPathRealTime.append(temp)
                case "Ladder3":
                    let temp = pathStruct(nodeName: allPath[index] , x: 88, y: 168)
                    allPathRealTime.append(temp)
                case "CopyStore":
                    let temp = pathStruct(nodeName: allPath[index] , x: 78, y: 163)
                    allPathRealTime.append(temp)
                case "Room115":
                    let temp = pathStruct(nodeName: allPath[index] , x: 114, y: 134)
                    allPathRealTime.append(temp)
                case "Room116":
                    let temp = pathStruct(nodeName: allPath[index] , x: 114, y: 129)
                    allPathRealTime.append(temp)
                case "Room118":
                    let temp = pathStruct(nodeName: allPath[index] , x: 120, y: 106)
                    allPathRealTime.append(temp)
                    
                case "Node2":
                    let temp = pathStruct(nodeName: allPath[index] , x: 234, y: 70)
                    allPathRealTime.append(temp)
                case "Node3":
                    let temp = pathStruct(nodeName: allPath[index] , x: 234, y: 75)
                    allPathRealTime.append(temp)
                case "Node4":
                    let temp = pathStruct(nodeName: allPath[index] , x: 262, y: 75)
                    allPathRealTime.append(temp)
                case "Node5":
                    let temp = pathStruct(nodeName: allPath[index] , x: 234, y: 82)
                    allPathRealTime.append(temp)
                case "Node6":
                    let temp = pathStruct(nodeName: allPath[index] , x: 234, y: 103)
                    allPathRealTime.append(temp)
                case "Node8":
                    let temp = pathStruct(nodeName: allPath[index] , x: 234, y: 163)
                    allPathRealTime.append(temp)
                case "Node9":
                    let temp = pathStruct(nodeName: allPath[index] , x: 234, y: 170)
                    allPathRealTime.append(temp)
                case "Node10":
                    let temp = pathStruct(nodeName: allPath[index] , x: 234, y: 176)
                    allPathRealTime.append(temp)
                case "Node11":
                    let temp = pathStruct(nodeName: allPath[index] , x: 252, y: 170)
                    allPathRealTime.append(temp)
                case "Node12":
                    let temp = pathStruct(nodeName: allPath[index] , x: 262, y: 170)
                    allPathRealTime.append(temp)
                case "Node13":
                    let temp = pathStruct(nodeName: allPath[index] , x: 273, y: 170)
                    allPathRealTime.append(temp)
                case "Node14":
                    let temp = pathStruct(nodeName: allPath[index] , x: 219, y: 176)
                    allPathRealTime.append(temp)
                case "Node15":
                    let temp = pathStruct(nodeName: allPath[index] , x: 188, y: 163)
                    allPathRealTime.append(temp)
                case "Node155":
                    let temp = pathStruct(nodeName: allPath[index] , x: 205, y: 163)
                    allPathRealTime.append(temp)
                case "Node16":
                    let temp = pathStruct(nodeName: allPath[index] , x: 180, y: 163)
                    allPathRealTime.append(temp)
                case "Node17":
                    let temp = pathStruct(nodeName: allPath[index] , x: 180, y: 181)
                    allPathRealTime.append(temp)
                case "Node18":
                    let temp = pathStruct(nodeName: allPath[index] , x: 153, y: 163)
                    allPathRealTime.append(temp)
                case "Node19":
                    let temp = pathStruct(nodeName: allPath[index] , x: 127, y: 163)
                    allPathRealTime.append(temp)
                case "Node20":
                    let temp = pathStruct(nodeName: allPath[index] , x: 121, y: 163)
                    allPathRealTime.append(temp)
                case "Node205":
                    let temp = pathStruct(nodeName: allPath[index] , x: 118, y: 163)
                    allPathRealTime.append(temp)
                case "Node21":
                    let temp = pathStruct(nodeName: allPath[index] , x: 118, y: 134)
                    allPathRealTime.append(temp)
                case "Node22":
                    let temp = pathStruct(nodeName: allPath[index] , x: 118, y: 128)
                    allPathRealTime.append(temp)
                case "Node23":
                    let temp = pathStruct(nodeName: allPath[index] , x: 93, y: 163)
                    allPathRealTime.append(temp)
                case "Node24":
                    let temp = pathStruct(nodeName: allPath[index] , x: 88, y: 163)
                    allPathRealTime.append(temp)
                case "Node25":
                    let temp = pathStruct(nodeName: allPath[index] , x: 93, y: 190)
                    allPathRealTime.append(temp)
                
                default:
                    print("default of switch")
                }
                
                
                
                
                
                
                
                
            }
            
            
            
            print("all path (realtime) : \(allPath)")
            
            
            
            genroutingMessage()
            print(routingmessage)
            
            
            //start part of realtime routing
//
//            for i in 0...VirtualCurrentLocationOnX.count-1 {
//            var currentRecall = [VirtualCurrentLocationOnX[i],VirtualCurrentLocationOnY[i]]
//
//            if (currentRecall[0] == allPathRealTime[checkArriveThisNodeYet].x
//                && currentRecall[1] == allPathRealTime[checkArriveThisNodeYet].y){
//
//                print(i)
//                print(WordInPath[checkArriveThisNodeYet])
//                print("current location = \(allPathRealTime[checkArriveThisNodeYet].nodeName)")
//
//
//                if (checkArriveThisNodeYet < routingmessage.count-1){
//                    checkArriveThisNodeYet+=1;
//                }else{
//
//                }
//
//
//            }else {
//                var x = currentRecall[0] - allPathRealTime[checkArriveThisNodeYet].x
//                var y = currentRecall[1] - allPathRealTime[checkArriveThisNodeYet].y
//                distanceToThisNode = (sqrt(x*x+y*y))*0.18;
//                distance = distanceToThisNode
//                //                print(distance)
//                var wordDistance = "เหลืออีก  \(distance!) เมตร ก่อนจะถึงจุดต่อไป";
//                if( i == VirtualCurrentLocationOnX.count-1){
//                    wordDistance = "ถึงจุดหมายเรียบร้อยแล้ว";
//                }
//                print(wordDistance)
//                print(i)
//
//            }
//            }
            

    
        //end of realtime routing
            
            

            

            
            let durationBetweenToasts: Double = 10
            for i in 0...VirtualCurrentLocationOnX.count-1 {
                let deadline: DispatchTime = .now() + (Double(i) * durationBetweenToasts)
                DispatchQueue.main.asyncAfter(deadline: deadline) {

                    self.realtimeRouting(i : i)


//   self.label2.text = allPath[i]
                   
                  




             

                }
            }
           
            


            
        } else {
            print("💥 No path between \(sourceNode.name) & \(destinationNode.name)")
        }

        
    }
    
    //realtime routing func
    
    func realtimeRouting (i : Int) {
        

            
            var currentRecall = [VirtualCurrentLocationOnX[i],VirtualCurrentLocationOnY[i]]
            
            if (currentRecall[0] == allPathRealTime[checkArriveThisNodeYet].x
                && currentRecall[1] == allPathRealTime[checkArriveThisNodeYet].y){
                
     
                print(routingmessage[checkArriveThisNodeYet])
//                print("current location = \(allPathRealTime[checkArriveThisNodeYet].nodeName)")
                
                self.view.makeToast(routingmessage[checkArriveThisNodeYet], duration: 5.0, position: .top)
                //                    add more style for toast
                var style = ToastStyle()
                ToastManager.shared.style = style
                ToastManager.shared.isTapToDismissEnabled = false
                
                UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, routingmessage[checkArriveThisNodeYet])
                
                
                if (checkArriveThisNodeYet < routingmessage.count-1){
                    checkArriveThisNodeYet+=1;
                }else{
                    
                }
                
                
            }else {
                var x = currentRecall[0] - allPathRealTime[checkArriveThisNodeYet].x
                var y = currentRecall[1] - allPathRealTime[checkArriveThisNodeYet].y
                distanceToThisNode = (sqrt(x*x+y*y))*0.18;
                distance = distanceToThisNode
                //                print(distance)
                var wordDistance = "เหลืออีก  \(distance!) เมตร ก่อนจะถึงจุดต่อไป";
                if( i == VirtualCurrentLocationOnX.count-1){
                    wordDistance = "ถึงจุดหมายเรียบร้อยแล้ว";
                }
                print(wordDistance)
                
                self.view.makeToast(wordDistance, duration: 5.0, position: .top)
                //                    add more style for toast
                var style = ToastStyle()
                ToastManager.shared.style = style
                ToastManager.shared.isTapToDismissEnabled = false
                
                UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, wordDistance)

                
            }
        
        
    }
    

    //ทำ routing message
    func genroutingMessage()
    {
        for var i in (0..<allPath.count){
            if(i == 0){
                if(allPath[i] == "Entrance1"){
                    routingmessage.append("เดินตรงไป 5 เมตร") }
                else if(allPath[i] == "Ladder1"){
                    routingmessage.append("เดินตรงไป 1.4 เมตร")}
                else if(allPath[i] == "Toilet1Man"){
                    routingmessage.append("เดินตรงไป 1 เมตร")}
                else if(allPath[i] == "Toilet1Woman"){
                    routingmessage.append("เดินตรงไป 1.625 เมตร")}
                else if(allPath[i] == "Library"){
                    routingmessage.append("เดินตรงไป 1.4 เมตร")}
                else if(allPath[i] == "DSSRoom"){
                    routingmessage.append("เดินตรงไป 1.4 เมตร")}
                else if(allPath[i] == "ATRoom"){
                    routingmessage.append("เดินตรงไป 3.75 เมตร")}
                else if(allPath[i] == "Entrance2"){
                    routingmessage.append("เดินตรงไป 2.6 เมตร")}
                else if(allPath[i] == "PublicRelation"){
                    routingmessage.append("เดินตรงไป 3.75 เมตร")}
                else if(allPath[i] == "Ladder2"){
                    routingmessage.append("เดินตรงไป 2.4 เมตร")}
                else if(allPath[i] == "Lift"){
                    routingmessage.append("เดินตรงไป 4.5 เมตร")}
                else if(allPath[i] == "Room104"){
                    routingmessage.append("เดินตรงไป 4 เมตร")}
                else if(allPath[i] == "Room105"){
                    routingmessage.append("เดินตรงไป 2.7 เมตร")}
                else if(allPath[i] == "KKRoom"){
                    routingmessage.append("เดินตรงไป 8.3 เมตร")}
                else if(allPath[i] == "Room107"){
                    routingmessage.append("เดินตรงไป 2.7 เมตร")}
                else if(allPath[i] == "Room108"){
                    routingmessage.append("เดินตรงไป 2.7 เมตร")}
                else if(allPath[i] == "Room110"){
                    routingmessage.append("เดินตรงไป 2.7 เมตร")}
                else if(allPath[i] == "CopyStore"){
                    routingmessage.append("เดินตรงไป 0.5 เมตร")}
                else if(allPath[i] == "Ladder3"){
                    routingmessage.append("เดินตรงไป 2.7 เมตร")}
                else if(allPath[i] == "Toilet2Man"){
                    routingmessage.append("เดินตรงไป 2 เมตร")}
                else if(allPath[i] == "Toilet2Woman"){
                    routingmessage.append("เดินตรงไป 2 เมตร")}
                else if(allPath[i] == "Room115"){
                    routingmessage.append("เดินตรงไป 1.4 เมตร")}
                else if(allPath[i] == "Room116"){
                    routingmessage.append("เดินตรงไป 1.4 เมตร")}
                else if(allPath[i] == "Room118"){
                    routingmessage.append("เดินตรงไป 6.7 เมตร")}
            }else{
                
                if( i != allPath.count-1){
                    
                    
                    
                    if(allPath[i+1] == "Ladder1"){//ตัวมันเองเป็น node 2 ไปหา Ladder1
                        print(i)
                        if(allPath[i-1] == "Entrance1"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 1.4 เมตร")
                        }
                        if(allPath[i-1] == "Node3"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 1.4 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Entrance1"){//ตัวมันเองเป็น node2 ไปหา Entrance1
                        if(allPath[i-1] == "Ladder1"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 5 เมตร")
                        }
                        if(allPath[i-1] == "Node3"){
                            routingmessage.append("เดินตรงไป 5 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node3"){//ตัวมันเองเป็น node2 ไปหา node3
                        if(allPath[i-1] == "Ladder1"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 1.625 เมตร")
                        }
                        if(allPath[i-1] == "Entrance1"){
                            routingmessage.append("เดินตรงไป 1.625 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node2"){//node3 to node2
                        if(allPath[i-1] == "Node4"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 1.625 เมตร")
                        }
                        if(allPath[i-1] == "Node5"){
                            routingmessage.append("เดินตรงไป 1.625 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node4"){//node3 to node4
                        if(allPath[i-1] == "Node2"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 7 เมตร")
                        }
                        if(allPath[i-1] == "Node5"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 7 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node5"){//node3 to node 5
                        if(allPath[i-1] == "Node4"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 2.25 เมตร")
                        }
                        if(allPath[i-1] == "Node2"){
                            routingmessage.append("เดินตรงไป 2.25 เมตร")
                            print(i)
                        }
                    }
                    if(allPath[i+1] == "Node3"){//node5 to node 3
                        if(allPath[i-1] == "Library"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 2.25 เมตร")
                        }
                        if(allPath[i-1] == "Node6"){
                            routingmessage.append("เดินตรงไป 2.25 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Library"){//node5 to library
                        if(allPath[i-1] == "Node6"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 1.4 เมตร")
                        }
                        if(allPath[i-1] == "Node3"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 1.4 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node6"){//node5 to node6
                        if(allPath[i-1] == "Library"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 77 เมตร")
                        }
                        if(allPath[i-1] == "Node3"){
                            routingmessage.append("เดินตรงไป 7 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node5"){//node6 to node5
                        if(allPath[i-1] == "DSSRoom"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 7 เมตร")
                        }
                        if(allPath[i-1] == "Node8"){
                            routingmessage.append("เดินตรงไป 7 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node3"){//node6 to DSSRoom
                        if(allPath[i-1] == "Node5"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป  เมตร")
                        }
                        if(allPath[i-1] == "Node8"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 1.4 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node8"){//node6 to node 8
                        if(allPath[i-1] == "DSSRoom"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 18 เมตร")
                        }
                        if(allPath[i-1] == "Node5"){
                            routingmessage.append("เดินตรงไป 18 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Toilet1Man"){//node4 to toilet1man
                        if(allPath[i-1] == "Toilet1Woman"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 1.5 เมตร")
                        }
                        if(allPath[i-1] == "Node3"){
                            routingmessage.append("เดินตรงไป 1.5 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Toilet1Woman"){//node4 to toilet1woman
                        if(allPath[i-1] == "Node3"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 1 เมตร")
                        }
                        if(allPath[i-1] == "Toilet1Man"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 1 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node3"){//node4 to node3
                        if(allPath[i-1] == "Toilet1Woman"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 7 เมตร")
                        }
                        if(allPath[i-1] == "Toilet1Man"){
                            routingmessage.append("เดินตรงไป 7 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node6"){//node8 to node6
                        if(allPath[i-1] == "Node155"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 18 เมตร")
                        }
                        if(allPath[i-1] == "Node9"){
                            routingmessage.append("เดินตรงไป 18 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node155"){//node8 to node155
                        if(allPath[i-1] == "Node9"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 9.1 เมตร")
                        }
                        if(allPath[i-1] == "Node6"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 9.1 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node9"){//node8 to node9
                        if(allPath[i-1] == "Node155"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 2.75 เมตร")
                        }
                        if(allPath[i-1] == "Node6"){
                            routingmessage.append("เดินตรงไป 2.75 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node8"){//node9 to node8
                        if(allPath[i-1] == "Node11"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 2.75 เมตร")
                        }
                        if(allPath[i-1] == "Node10"){
                            routingmessage.append("เดินตรงไป 2.75 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node10"){//node9 to node10
                        if(allPath[i-1] == "Node11"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 1.35 เมตร")
                        }
                        if(allPath[i-1] == "Node8"){
                            routingmessage.append("เดินตรงไป 1.35 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node11"){//node9 to node 11
                        if(allPath[i-1] == "Node8"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 5.5 เมตร")
                        }
                        if(allPath[i-1] == "Node10"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 5.5 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node9"){//node10 to node9
                        if(allPath[i-1] == "Node14"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 1.35 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node14"){//node10 to node14
                        if(allPath[i-1] == "Node9"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 2.4 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node10"){//node14 to node10
                        if(allPath[i-1] == "Ladder2"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 2.4 เมตร")
                        }
                        if(allPath[i-1] == "Lift"){
                            routingmessage.append("เดินตรงไป 2.4 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Lift"){//node14 to lift
                        if(allPath[i-1] == "Ladder2"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 4.5 เมตร")
                        }
                        if(allPath[i-1] == "Node10"){
                            routingmessage.append("เดินตรงไป 4.5 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Ladder2"){//node14 to ladder2
                        if(allPath[i-1] == "Node10"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 2.4 เมตร")
                        }
                        if(allPath[i-1] == "Lift"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 2.4 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node9"){//node11 to node9
                        if(allPath[i-1] == "Room102"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 5.5 เมตร")
                        }
                        if(allPath[i-1] == "Node12"){
                            routingmessage.append("เดินตรงไป 5.5 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Room102"){//node11 to room102
                        if(allPath[i-1] == "Node12"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 3.75 เมตร")
                        }
                        if(allPath[i-1] == "Node9"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 3.75 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node12"){//node11 to node12
                        if(allPath[i-1] == "Room102"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 3.2 เมตร")
                        }
                        if(allPath[i-1] == "Node9"){
                            routingmessage.append("เดินตรงไป 3.2 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node11"){//node12 to node11
                        if(allPath[i-1] == "ATRoom"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 3.2 เมตร")
                        }
                        if(allPath[i-1] == "Node13"){
                            routingmessage.append("เดินตรงไป 3.2 เมตร")
                        }
                    }
                    if(allPath[i+1] == "ATRoom"){//node12 to ATRoom
                        if(allPath[i-1] == "Node11"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 3.75 เมตร")
                        }
                        if(allPath[i-1] == "Node13"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 3.75 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node13"){//node12 to node13
                        if(allPath[i-1] == "ATRoom"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 3.5 เมตร")
                        }
                        if(allPath[i-1] == "Node11"){
                            routingmessage.append("เดินตรงไป 3.5 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node12"){//node13 to node12
                        if(allPath[i-1] == "PublicRelation"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 3.5 เมตร")
                        }
                        if(allPath[i-1] == "Entrance2"){
                            routingmessage.append("เดินตรงไป 3.5 เมตร")
                        }
                    }
                    if(allPath[i+1] == "PublicRelation"){//node13 to publicrelation
                        if(allPath[i-1] == "Entrance2"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 3.75 เมตร")
                        }
                        if(allPath[i-1] == "Node12"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 3.75 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Entrance2"){//node13 to Entrance2
                        if(allPath[i-1] == "PublicRelation"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 2.6 เมตร")
                        }
                        if(allPath[i-1] == "Node12"){
                            routingmessage.append("เดินตรงไป 2.6 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node8"){//node155 to node8
                        if(allPath[i-1] == "Room104"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 9.1 เมตร")
                        }
                        if(allPath[i-1] == "Node15"){
                            routingmessage.append("เดินตรงไป 9.1 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node15"){//node155 to node15
                        if(allPath[i-1] == "Room104"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 5.4 เมตร")
                        }
                        if(allPath[i-1] == "Node8"){
                            routingmessage.append("เดินตรงไป 5.4 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Room104"){//node155 to room104
                        if(allPath[i-1] == "Node8"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 4 เมตร")
                        }
                        if(allPath[i-1] == "Node15"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 4 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node155"){//node15 to node155
                        if(allPath[i-1] == "Room105"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 5.4 เมตร")
                        }
                        if(allPath[i-1] == "Node16"){
                            routingmessage.append("เดินตรงไป 5.4 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Room105"){//node15 to room105
                        if(allPath[i-1] == "Node155"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 2.7 เมตร")
                        }
                        if(allPath[i-1] == "Node16"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 2.7 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node16"){//node15 to node16
                        if(allPath[i-1] == "Room105"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 2 เมตร")
                        }
                        if(allPath[i-1] == "Node155"){
                            routingmessage.append("เดินตรงไป 2 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node15"){//node16 to node15
                        if(allPath[i-1] == "KKRoom"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 2 เมตร")
                        }
                        
                        if(allPath[i-1] == "Node18"){
                            routingmessage.append("เดินตรงไป 2 เมตร")
                        }
                    }
                    if(allPath[i+1] == "KKRoom"){//node16 to KKRoom
                        if(allPath[i-1] == "Node15"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 8.3 เมตร")
                        }
                        if(allPath[i-1] == "Node18"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 8.3 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node18"){//node16 to node18
                        if(allPath[i-1] == "KKRoom"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 5.8 เมตร")
                        }
                        if(allPath[i-1] == "Node15"){
                            routingmessage.append("เดินตรงไป 5.8 เมตร")
                        }
                    }
                    //                        if(allPath[i+1] == "Node16"){//node17 to node16
                    //                            if(allPath[i-1] == "KKRoom"){
                    //                                routingmessage.append("เดินตรงไป 4.15 เมตร")
                    //                            }
                    //                        }
                    if(allPath[i+1] == "Node3"){//node17 to KKRoom
                        if(allPath[i-1] == "Node16"){
                            routingmessage.append("เดินตรงไป 4.15 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node16"){//node18 to node16
                        if(allPath[i-1] == "Room107"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 5.8 เมตร")
                        }
                        if(allPath[i-1] == "Node19"){
                            routingmessage.append("เดินตรงไป 5.8 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Room107"){//node18 to room107
                        if(allPath[i-1] == "Node16"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 2.7 เมตร")
                        }
                        if(allPath[i-1] == "Node19"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 2.7 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node19"){//node18 to node19
                        if(allPath[i-1] == "Room107"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 7.8 เมตร")
                        }
                        if(allPath[i-1] == "Node16"){
                            routingmessage.append("เดินตรงไป 7.8 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node18"){//node19 to node18
                        if(allPath[i-1] == "Room108"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 7.8 เมตร")
                        }
                        if(allPath[i-1] == "Node20"){
                            routingmessage.append("เดินตรงไป 7.8 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Room108"){//node19 to Room108
                        if(allPath[i-1] == "Node18"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 2.7 เมตร")
                        }
                        if(allPath[i-1] == "Node20"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 2.7 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node20"){//node19 to node20
                        if(allPath[i-1] == "Room108"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 1.7 เมตร")
                        }
                        if(allPath[i-1] == "Node18"){
                            routingmessage.append("เดินตรงไป 1.7 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node20"){//node20 to node19
                        if(allPath[i-1] == "Room110"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 1.7 เมตร")
                        }
                        if(allPath[i-1] == "Node205"){
                            routingmessage.append("เดินตรงไป 1.7 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Room110"){//node20 to Room110
                        if(allPath[i-1] == "Node19"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 2.7 เมตร")
                        }
                        if(allPath[i-1] == "Node205"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 2.7 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node205"){//node20 to node205
                        if(allPath[i-1] == "Room110"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 0.8 เมตร")
                        }
                        if(allPath[i-1] == "Node23"){
                            routingmessage.append("เดินตรงไป 0.8 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node20"){//node205 to node20
                        if(allPath[i-1] == "Node21"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 0.8 เมตร")
                        }
                        if(allPath[i-1] == "Node23"){
                            routingmessage.append("เดินตรงไป 0.8 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node21"){//node205 to node21
                        if(allPath[i-1] == "Node23"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 8.2 เมตร")
                        }
                        if(allPath[i-1] == "Node20"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 8.2 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node23"){//node205 to node23
                        if(allPath[i-1] == "Node21"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 7.5 เมตร")
                        }
                        if(allPath[i-1] == "Node20"){
                            routingmessage.append("เดินตรงไป 7.5 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node205"){//node21 to node205
                        if(allPath[i-1] == "Room115"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 8.2 เมตร")
                        }
                        if(allPath[i-1] == "Node22"){
                            routingmessage.append("เดินตรงไป 8.2 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Room115"){//node21 to Room115
                        if(allPath[i-1] == "Node205"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 1.4 เมตร")
                        }
                        if(allPath[i-1] == "Node22"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 1.4 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node22"){//node21 to node22
                        if(allPath[i-1] == "Room115"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 2 เมตร")
                        }
                        if(allPath[i-1] == "Node205"){
                            routingmessage.append("เดินตรงไป 2 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node21"){//node22 to node21
                        if(allPath[i-1] == "Room116"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 2 เมตร")
                        }
                        if(allPath[i-1] == "Room118"){
                            routingmessage.append("เดินตรงไป 2 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Room116"){//node22 to Room116
                        if(allPath[i-1] == "Node21"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 1.4 เมตร")
                        }
                        if(allPath[i-1] == "Room118"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 1.4 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Room118"){//node22 to Room118
                        if(allPath[i-1] == "Room116"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 6.7 เมตร")
                        }
                        if(allPath[i-1] == "Node21"){
                            routingmessage.append("เดินตรงไป 6.7 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node205"){//node23 to node205
                        if(allPath[i-1] == "Node25"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 7.5 เมตร")
                        }
                        if(allPath[i-1] == "Node24"){
                            routingmessage.append("เดินตรงไป 7.5 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node25"){//node23 to node25
                        if(allPath[i-1] == "Node205"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 7 เมตร")
                        }
                        if(allPath[i-1] == "Node24"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 7 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node24"){//node23 to node24
                        if(allPath[i-1] == "Node25"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 1.75 เมตร")
                        }
                        if(allPath[i-1] == "Node205"){
                            routingmessage.append("เดินตรงไป 1.75 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node23"){//node24 to node23
                        if(allPath[i-1] == "Ladder3"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 1.75 เมตร")
                        }
                        if(allPath[i-1] == "CopyStore"){
                            routingmessage.append("เดินตรงไป 1.75 เมตร")
                        }
                    }
                    if(allPath[i+1] == "CopyStore"){//node24 to copystore
                        if(allPath[i-1] == "Ladder3"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 0.5 เมตร")
                        }
                        if(allPath[i-1] == "Node23"){
                            routingmessage.append("เดินตรงไป 0.5 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Ladder3"){//node24 to ladder3
                        if(allPath[i-1] == "Node23"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 2.7 เมตร")
                        }
                        if(allPath[i-1] == "CopyStore"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 2.7 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Node23"){//node25 to node23
                        if(allPath[i-1] == "Toilet2Woman"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 7 เมตร")
                        }
                        if(allPath[i-1] == "Toilet2Man"){
                            routingmessage.append("เดินตรงไป 7 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Toilet2Woman"){//node25 to toilet2woman
                        if(allPath[i-1] == "Toilet2Man"){
                            routingmessage.append("หมุนซ้ายและเดินตรงไป 1 เมตร")
                        }
                        if(allPath[i-1] == "Node23"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 1 เมตร")
                        }
                    }
                    if(allPath[i+1] == "Toilet2Man"){//node25 to toilet2man
                        if(allPath[i-1] == "Toilet2Woman"){
                            routingmessage.append("หมุนขวาและเดินตรงไป 1 เมตร")
                        }
                        if(allPath[i-1] == "Node23"){
                            routingmessage.append("เดินตรงไป 1 เมตร")
                        }
                    }
                }
            }
        }
        
       
        
    
    
    

    }

    

//end of main class
}
class Node {
    var visited = false
    var connections: [Connection] = []
}

class Connection {
    public let to: Node
    public let weight: Double
    
    public init(to node: Node, weight: Double) {
        assert(weight >= 0, "weight has to be equal or greater than zero")
        self.to = node
        self.weight = weight
    }
}

class Path {
    public let cumulativeWeight: Double
    public let node: Node
    public let previousPath: Path?
    
    init(to node: Node, via connection: Connection? = nil, previousPath path: Path? = nil) {
        if
            let previousPath = path,
            let viaConnection = connection {
            self.cumulativeWeight = viaConnection.weight + previousPath.cumulativeWeight
            sumWeight = self.cumulativeWeight
        } else {
            self.cumulativeWeight = 0
        }
        
        self.node = node
        self.previousPath = path
    }
}

extension Path {
    var array: [Node] {
        var array: [Node] = [self.node]
        
        var iterativePath = self
        while let path = iterativePath.previousPath {
            array.append(path.node)
            
            iterativePath = path
        }
        
        return array
    }
}

func shortestPath(source: Node, destination: Node) -> Path? {
    var frontier: [Path] = [] {
        didSet { frontier.sort { return $0.cumulativeWeight < $1.cumulativeWeight } } // the frontier has to be always ordered
    }
    
    frontier.append(Path(to: source)) // the frontier is made by a path that starts nowhere and ends in the source
    
    while !frontier.isEmpty {
        let cheapestPathInFrontier = frontier.removeFirst() // getting the cheapest path available
        guard !cheapestPathInFrontier.node.visited else { continue } // making sure we haven't visited the node already
        
        if cheapestPathInFrontier.node === destination {
            return cheapestPathInFrontier // found the cheapest path 😎
        }
        
        cheapestPathInFrontier.node.visited = true
        
        for connection in cheapestPathInFrontier.node.connections where !connection.to.visited { // adding new paths to our frontier
            frontier.append(Path(to: connection.to, via: connection, previousPath: cheapestPathInFrontier))
        }
    } // end while
    return nil // we didn't find a path 😣
}

// **** EXAMPLE BELOW ****
class MyNode: Node {
    let name: String
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
