//
//  NewClientViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-07.
//

import UIKit

class NewClientViewController: UIViewController {
    
    var userID : Int!
    
    @IBOutlet weak var userIDLbl: UILabel!
    @IBOutlet weak var tEntry1: UITextField!
    @IBOutlet weak var tEntry2: UITextField!
    @IBOutlet weak var tEntry3: UITextField!
    @IBOutlet weak var tEntry4: UITextField!
    @IBOutlet weak var tEntry5: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tEntry6: UITextField!
    @IBOutlet weak var tEntry7: UITextField!
    @IBOutlet weak var tEntry8: UITextField!
    @IBOutlet weak var tEntry9: UITextField!
    
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
    
    
    @IBAction func createTapped(_ sender: Any) {
        if (tEntry1.text!.isAlphanumeric && tEntry2.text!.isAlphanumeric && tEntry3.text!.isAlphanumeric && checkInt(input: tEntry4.text) && checkInt(input: tEntry5.text) && checkInt(input: tEntry6.text) && checkInt(input: tEntry7.text) && checkInt(input: tEntry8.text) && checkInt(input: tEntry9.text)){
            //do other verification
            //do creating new client
            let db = DBHelper()
            let DOB = datePicker.date
            let stringDate = DOB.formatted(date: .numeric, time: .omitted)
            var newUsr: User = User(ethnicity: tEntry1.text!, countryOfResidence: tEntry2.text!, gender: tEntry3.text!, birthDay: DOB)
                newUsr.userInDB(db: db)
            let height = Int(tEntry4.text!) ?? 0
            let weight = Int(tEntry5.text!) ?? 0
            let pro = Int(tEntry6.text!) ?? 0
            let carbs = Int(tEntry7.text!) ?? 0
            let fat = Int(tEntry8.text!) ?? 0
            let sugar = Int(tEntry9.text!) ?? 0
            var newClient: Client = Client(userToClient: newUsr, protein: pro , carbohydrates: carbs, fat: fat, weight: weight, sugar: sugar, height: height)
            newClient.clientInDB(db: db)
            performSegue(withIdentifier: "unwindToLoginScreen", sender: self)
        }
        
        else {
            errorLbl.text = "Invalid Input"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        datePicker.date = Date()
        userIDLbl.text = String(userID)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "unwindToLoginScreen") {
//            let dest = segue.destination as? LoginViewController
        }
    }


}
