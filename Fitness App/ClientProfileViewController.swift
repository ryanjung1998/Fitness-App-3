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
    let db = DBHelper()
    
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
        
        var client = db.getClientProfile(userID: userID)
        let formatter1 = DateFormatter() // Format date as string
        formatter1.dateStyle = .short    // Formatting
        IDnum.text = String(userID)
        ethnicityEntry.text = client[3]
        countryEntry.text = client[2]
        genderEntry.text = client[1]
        heightEntry.text = client[9]
        weightEntry.text = client[7]
        bdPicker.date = (formatter1.date(from: client[0])!)
        proteinEntry.text = client[4]
        carbsEntry.text = client[5]
        fatEntry.text = client[6]
        sugarEntry.text = client[8]
        
        //get these values based on userID
    }
    @IBAction func saveChangesTapped(_ sender: Any) {
        if(ethnicityEntry.text!.isAlphanumeric && countryEntry.text!.isAlphanumeric && genderEntry.text!.isAlphanumeric && checkInt(input: proteinEntry.text) && checkInt(input: carbsEntry.text) && checkInt(input: fatEntry.text) && checkInt(input: sugarEntry.text)){
            //let db = DBHelper()
            //var
            //save changes
            print("changes accepted")
            
        }
        else{
            errorLbl.text = "Invalid Input"
        }
    }
}

