//
//  AddToPlanViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-05.
//

import UIKit
class AddToPlanViewController : UIViewController
{
    
    var userID : Int!
    var creatorID : Int!
    var rName : String!
    
    @IBOutlet weak var quantEntry: UITextField!
    
    @IBOutlet weak var mealPlanEntry: UITextField!
    @IBOutlet weak var fNamelbl: UILabel!
    
    @IBAction func addTapped(_ sender: Any) {
        if(mealPlanEntry.text!.isAlphanumeric && checkInt(input: quantEntry.text)){
            //code for saving changes to db
            performSegue(withIdentifier: "unwindToRecipe", sender: self)
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "unwindToRecipe"){
//            let tableViewProg = segue.destination as? RecipeViewController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fNamelbl.text = "Add " + rName + " to Plan"
    }
    
}

