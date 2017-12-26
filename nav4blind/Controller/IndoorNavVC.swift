
import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
import Foundation
import Toast_Swift



var sumWeight : Double! = 0

var destination:String!

var startLocation: String! = ""


var selectedRow = 0




class IndoorNavVC: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource  {
    

    
    
    
    
    
    var getfromrouting = [MyNode]()
    
    let destinationNode = ["Entrance1","Ladder1","Toilet1Man","Toilet1Woman","Library","DSSRoom","ATRoom","Entrance2","PublicRelation","Room102","Ladder2","Lift","Room104","Room105","KKRoom","Room107","Room108","Room110","Toilet2Man","Toilet2Woman","Ladder3","CopyStore","Room115","Room116","Room118"]
    

    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var labelLocation: UILabel!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
            return destinationNode.count
      
     
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
            return destinationNode[row]
            
        
      
    }
    
    @IBAction func pick(_ sender: Any) {
        let vdestination = destinationNode[pickerView.selectedRow(inComponent: 0)]
        
        
        
        
        
        
        destination = vdestination
        
        
        
        
        selectedRow = pickerView.selectedRow(inComponent: 0)
        
        
        performSegue(withIdentifier: "routingVC", sender: self)
       
        
      

        
    }
    
    @IBAction func unwindFromRouting(unwindSegue: UIStoryboardSegue){
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

       
        
    
        
        self.pickerView.delegate = self
        
        self.pickerView.dataSource = self
        
        pickerView.selectRow(2, inComponent: 0, animated: true)
        
        //start find current location
        
        
        var Current = [51,51];
        let Entrance1 = [1,2];
        let Ladder1 = [1,2];
        let Toilet1Man = [1,2];
        let Toilet1Woman = [1,2];
        let Library = [51,51];
        let DSSRoom = [1,2];
        let ATRoom = [1,2];
        let Entrance2 = [1,2];
        let PublicRelation = [1,2];
        let Room102 = [1,2];
        let Ladder2 = [1,2];
        let Lift = [1,2];
        let Room104 = [1,2];
        let Room105 = [1,2];
        let KKRoom = [50,100];
        let Room107 = [1,2];
        let Room108 = [1,2];
        let Room110 = [1,2];
        let Toilet2Man = [1,2];
        let Toilet2Woman = [1,2];
        let Ladder3 = [1,2];
        let CopyStore = [1,2];
        let Room115 = [1,2];
        let Room116 = [1,2];
        let Room118 = [1,2];
        let Node2 = [1,2];
        let Node3 = [1,2];
        let Node4 = [1,2];
        let Node5 = [1,2];
        let Node6 = [1,2];
        let Node8 = [1,2];
        let Node9 = [1,2];
        let Node10 = [1,2];
        let Node11 = [1,2];
        let Node12 = [1,2];
        let Node13 = [1,2];
        let Node14 = [1,2];
        let Node15 = [1,2];
        let Node155 = [1,2];
        let Node16 = [1,2];
        let Node17 = [1,2];
        let Node18 = [1,2];
        let Node19 = [100,100];
        let Node20 = [1,2];
        let Node205 = [1,2];
        let Node21 = [1,2];
        let Node22 = [1,2];
        let Node23 = [1,2];
        let Node24 = [1,2];
        let Node25 = [1,2];
        
        
        var arraylist = [[Int]]()
        
        arraylist.append( Entrance1 )
        arraylist.append( Ladder1 )
        arraylist.append( Toilet1Man )
        arraylist.append( Toilet1Woman )
        arraylist.append( Library )
        arraylist.append( DSSRoom )
        arraylist.append( ATRoom )
        arraylist.append( Entrance2 )
        arraylist.append( PublicRelation )
        arraylist.append( Room102 )
        arraylist.append( Ladder2 )
        arraylist.append( Lift )
        arraylist.append( Room104 )
        arraylist.append( Room105 )
        arraylist.append( KKRoom )
        arraylist.append( Room107 )
        arraylist.append( Room108 )
        arraylist.append( Room110 )
        arraylist.append( Toilet2Man )
        arraylist.append( Toilet2Woman )
        arraylist.append( Ladder3 )
        arraylist.append( CopyStore )
        arraylist.append( Room115 )
        arraylist.append( Room116 )
        arraylist.append( Room118 )
        arraylist.append( Node2 )
        arraylist.append( Node3 )
        arraylist.append( Node4 )
        arraylist.append( Node5 )
        arraylist.append( Node6 )
        arraylist.append( Node8 )
        arraylist.append( Node9 )
        arraylist.append( Node10 )
        arraylist.append( Node11 )
        arraylist.append( Node12 )
        arraylist.append( Node13 )
        arraylist.append( Node14 )
        arraylist.append( Node15 )
        arraylist.append( Node155 )
        arraylist.append( Node16 )
        arraylist.append( Node17 )
        arraylist.append( Node18 )
        arraylist.append( Node19 )
        arraylist.append( Node20 )
        arraylist.append( Node205 )
        arraylist.append( Node21 )
        arraylist.append( Node22 )
        arraylist.append( Node23 )
        arraylist.append( Node24 )
        arraylist.append( Node25 )
        
        //print(arraylist)
        
        var checkInEachXandY:Int = 0;
        var checkLastPithagorus:Double = 10000;
        var x:Double = 0
        var y:Double = 0
        var Pithagorus:Double = 0
        
        for  i in (0..<arraylist.count)
        {
            
            x = Double(Current[0] -  arraylist[i][0])
            y = Double(Current[1] - arraylist[i][1])
            Pithagorus = sqrt(x*y+y*y)
            if(Pithagorus<checkLastPithagorus){
                checkLastPithagorus = Pithagorus
                checkInEachXandY = i+1;
            }
            
            
        }
        
//        print(checkInEachXandY)
        
        
        
        
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
        
        
        //end current location process
        
        labelLocation.text = ("you're at : \(NumWithPlace[checkInEachXandY]!)")
        startLocation =  NumWithPlace[checkInEachXandY]!
        
      
       
        
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       
        let playerViewController = segue.destination as? IndoorRouting
        playerViewController?.destination = destination
        playerViewController?.startLocation = startLocation

        
  
    }

    
    
    //end IndoorNavVC Class
}

