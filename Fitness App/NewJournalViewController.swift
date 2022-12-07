//
//  NewJournalViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-07.
//

import UIKit

class NewJournalViewController : UIViewController
{
    var userID : Int!
    
    @IBOutlet weak var tEntry1: UITextField!
    @IBOutlet weak var tEntry5: UITextField!
    @IBOutlet weak var tEntry2: UITextField!
    @IBOutlet weak var tEntry4: UITextField!
    @IBOutlet weak var tEntry3: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var errorLbl: UILabel!
    
    
    @IBAction func addTapped(_ sender: Any) {
        if(checkString(input: tEntry1.text) && checkInt(input: tEntry2.text) && checkInt(input: tEntry3.text) && checkString(input: tEntry4.text) && checkInt(input: tEntry5.text)){
            //other verification
            //adding to db code
            performSegue(withIdentifier: "unwindToJournal", sender: self)
        }
        else{
            errorLbl.text = "Invalid Input"
        }
    }
    
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
    
    func checkDouble(input : String?)->Bool{
        if let inputReal = input {
            if (Double(inputReal) ?? -1) == -1{
                print("not a valid double input")
                return false}
            else{return true}
        }
        else{return true}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.date = Date()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "unwindToJournal"){
            let dest = segue.destination as? ClientJournalTableViewController
            
        }
    }
    
}
