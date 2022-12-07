//
//  NewMealPlanViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-07.
//

import UIKit

class NewMealPlanViewController : UIViewController
{
    var userID : Int!
    
    @IBOutlet weak var tEntry1: UITextField!
    
    @IBOutlet weak var privacySwitch: UISwitch!
    @IBOutlet weak var errorLbl: UILabel!
    
    @IBAction func addTapped(_ sender: Any) {
        if(checkString(input: tEntry1.text)){
            //other verification
            //adding to db code
            performSegue(withIdentifier: "unwindToTable", sender: self)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "unwindToTable"){
            let dest = segue.destination as? MealPlanTableViewController
        }
    }
}
