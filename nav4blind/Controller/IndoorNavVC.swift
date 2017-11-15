
import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
import Foundation



var sumWeight : Double! = 0

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
        
        
//        self.defaultManager.request("https://10.34.250.12/api/location/v1/history/clients/78%3A4f%3A43%3A8a%3Adb%3Aab?date=2017%2F09%2F19", headers: headers).authenticate(user: user, password: password)
//
//            .responseJSON { response in
//                switch response.result {
//                case .success(let value):
//                    let json = JSON(value)
////                    print("JSON: \(json)")
////                    print("JSONDict: \(json["mapCoordinate"].stringValue)")
//
//                   print("map: \(json[0]["mapCoordinate"]["x"].stringValue + "," + json[0]["mapCoordinate"]["y"].stringValue)")
//
//
//
//
//                    self.coordinateLabel.text = "x , y : " + json[0]["mapCoordinate"]["x"].stringValue + " , " + json[0]["mapCoordinate"]["y"].stringValue
//
//                case .failure(let error):
//                    print(error)
//
//
//                }
//
//        }
        
        var xcorOut : Double! = 231
        
        var ycorOut : Double! = 90
   
       
        
        //red dot blink
        var helloWorldTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(IndoorNavVC.marksMan), userInfo: [
            "X": xcorOut, "Y": ycorOut], repeats: true)
        
        
        
        
        
        
        
        
     
        
        
        
        
    }
    
    
    @IBAction func goEntrance1(_ sender: Any) {
        
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
        Node5.connections.append(Connection(to: Node4, weight: 10.7))
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
        Node14.connections.append(Connection(to: Node2, weight: 2.4))
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
        let destinationNode = Entrance1
        
        var path = shortestPath(source: sourceNode, destination: destinationNode)
        
        if let succession: [String] = path?.array.reversed().flatMap({ $0 as? MyNode}).map({$0.name}) {
            print("Destination From \(sourceNode.name) to \(destinationNode.name)")
            print("🏁 Quickest path: \(succession)")
            print("🏁 Quickest Weight: \(sumWeight)")
            
            let alert = UIAlertController(title: "\(sourceNode.name) to \(destinationNode.name)", message: "🏁 Quickest path: \(succession) = \(sumWeight!) meter", preferredStyle: UIAlertControllerStyle.alert)
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        } else {
            print("💥 No path between \(sourceNode.name) & \(destinationNode.name)")
        }
        
    }
    
    @IBAction func goEntrance2(_ sender: Any) {
        
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
        Node5.connections.append(Connection(to: Node4, weight: 10.7))
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
        Node14.connections.append(Connection(to: Node2, weight: 2.4))
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
        let destinationNode = Entrance2
        
        var path = shortestPath(source: sourceNode, destination: destinationNode)
        
        if let succession: [String] = path?.array.reversed().flatMap({ $0 as? MyNode}).map({$0.name}) {
            print("Destination From \(sourceNode.name) to \(destinationNode.name)")
            print("🏁 Quickest path: \(succession)")
            print("🏁 Quickest Weight: \(sumWeight)")
            
            let alert = UIAlertController(title: "\(sourceNode.name) to \(destinationNode.name)", message: "🏁 Quickest path: \(succession) = \(sumWeight!) meter", preferredStyle: UIAlertControllerStyle.alert)
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
            
        } else {
            print("💥 No path between \(sourceNode.name) & \(destinationNode.name)")
            
            
        }
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




