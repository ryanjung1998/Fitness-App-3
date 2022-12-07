//
//  ClientProfileView.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-02.
//

import Foundation
import UIKit

class ClientProfileViewController : UIViewController
{
    var userID: Int!
    
    @IBOutlet weak var IDnum: UILabel!
    @IBOutlet weak var ethnicityEntry: UITextField!
    @IBOutlet weak var countryEntry: UITextField!
    @IBOutlet weak var genderEntry: UITextField!
    @IBOutlet weak var heightEntry: UITextField!
    @IBOutlet weak var weightEntry: UITextField!
    @IBOutlet weak var bdPicker: UIDatePicker!
    @IBOutlet weak var proteinEntry: UITextField!
    @IBOutlet weak var carbsEntry: UITextField!
    @IBOutlet weak var fatEntry: UITextField!
    @IBOutlet weak var sugarEntry: UITextField!
    
    @IBOutlet weak var errorLbl: UILabel!
    func checkInt(input : String?)->Bool{
        if let inputReal = input {
            if (Int(inputReal) ?? -1) == -1{
                print("not an integer input")
                return false}
            else{return true}
        }
        else{return true}
    }
    
    func checkString(input : String?)->Bool{
        if let inputReal = input {
            if (inputReal.contains("\\") || inputReal.contains("\"") || inputReal.contains("\'")){
                print("not a valid input" + inputReal)
                return false}
            else{
                return true}
        }
        else{
            return true}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        IDnum.text = String(userID)
        ethnicityEntry.text = "default"
        countryEntry.text = "default"
        genderEntry.text = "default"
        heightEntry.text = String(150)
        weightEntry.text = String(150)
        bdPicker.date = Date()
        proteinEntry.text = String(10)
        carbsEntry.text = String(10)
        fatEntry.text = String(10)
        sugarEntry.text = String(10)
        
        //get these values based on userID
    }
    @IBAction func saveChangesTapped(_ sender: Any) {
        if(checkString(input: ethnicityEntry.text) && checkString(input: countryEntry.text) && checkString(input: genderEntry.text) && checkInt(input: proteinEntry.text) && checkInt(input: carbsEntry.text) && checkInt(input: fatEntry.text) && checkInt(input: sugarEntry.text)){
            //save changes
            print("changes accepted")
            
        }
        else{
            errorLbl.text = "Invalid Input"
        }
    }
}

