//
//  getUserLocation.swift
//  nav4blind
//
//  Created by Pathompong Chaisri on 23/2/2561 BE.
//  Copyright © 2561 Pathompong Chaisri. All rights reserved.
//

import UIKit






class getUserLocation: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource  {

    @IBOutlet weak var pickerView: UIPickerView!
    var startLocation : String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.delegate = self
        
        self.pickerView.dataSource = self
        
        pickerView.selectRow(2, inComponent: 0, animated: true)
        
        


    }
    
    let startNode = ["Entrance1","Ladder1","Toilet1Man","Toilet1Woman","Library","DSSRoom","ATRoom","Entrance2","PublicRelation","Room102","Ladder2","Lift","Room104","Room105","KKRoom","Room107","Room108","Room110","Toilet2Man","Toilet2Woman","Ladder3","CopyStore","Room115","Room116","Room118"]

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return startNode.count
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return startNode[row]
        
        
        
    }
    

    
    @IBAction func pick(_ sender: Any) {
        startLocation = startNode[pickerView.selectedRow(inComponent: 0)]
        
        
        
        
        selectedRow = pickerView.selectedRow(inComponent: 0)
        
         print("after pick : \(startLocation!)")
        performSegue(withIdentifier: "toChooseDestination", sender: self)
    
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        print("bef prepare : \(startLocation!)")
        let playerViewController = segue.destination as? IndoorNavVC
        playerViewController?.startLocation = startLocation
        

        
        
    }
    
//end class
}

