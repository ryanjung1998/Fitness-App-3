//
//  NewAdminViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-07.
//

import UIKit

class NewAdminViewController: UIViewController {
    
    var userID : Int!
    
    @IBOutlet weak var userIDLbl: UILabel!
    @IBOutlet weak var tEntry1: UITextField!
    @IBOutlet weak var tEntry2: UITextField!
    @IBOutlet weak var tEntry3: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    let db = DBHelper()
    
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
        if (tEntry1.text!.isAlphanumeric && tEntry2.text!.isAlphanumeric && tEntry3.text!.isAlphanumeric){
            //do other verification
            //do creating new client
            let DOB = datePicker.date
            var newUsr = User(ethnicity: tEntry1.text!, countryOfResidence: tEntry2.text!, gender: tEntry3.text!, birthDay: DOB)
            newUsr.userInDB(db: db)
            print(newUsr.userID)
            var newAdmin = Admin(userToAdmin: newUsr)
            newAdmin.adminInDB(db: db, adminToPromo: newUsr.userID)
            performSegue(withIdentifier: "unwindToLoginn", sender: self)
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
        if (segue.identifier == "unwindToLoginn") {
//            let dest = segue.destination as? LoginViewController
        }
    }


}
