
import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
import Foundation
import Toast_Swift



var sumWeight : Double! = 0

var destination:String!





var selectedRow = 0





class IndoorNavVC: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource  {
    
    
    
    
    let defaultManager: Alamofire.SessionManager = {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "10.34.250.12": .disableEvaluation
        ]
        
        
        return SessionManager(
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
    }()
    
    
    
    
    let destinationNode = ["Entrance1","Ladder1","Toilet1Man","Toilet1Woman","Library","DSSRoom","ATRoom","Entrance2","PublicRelation","Room102","Ladder2","Lift","Room104","Room105","KKRoom","Room107","Room108","Room110","Toilet2Man","Toilet2Woman","Ladder3","CopyStore","Room115","Room116","Room118"]
    
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var labelLocation: UILabel!
    
    var startLocation : String?
    
    
    
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
        
        print("start location : \(startLocation!)")
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let playerViewController = segue.destination as? IndoorRouting
        playerViewController?.destination = destination
        playerViewController?.startLocation = startLocation
        
        
        
    }
    
    
    
    //end IndoorNavVC Class
}

