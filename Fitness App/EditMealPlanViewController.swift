//
//  EditMealPlanViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-06.
//

import UIKit
class EditMealPlanViewController : UIViewController
{
    
    var userID : Int!
    var mpcID : Int!
    var mpName : String!
    var rcID : Int!
    var rName : String!
    var quant : Int!
    
    @IBOutlet weak var quantEntry: UITextField!
    
    @IBOutlet weak var fNamelbl: UILabel!
    @IBAction func removeTapped(_ sender: Any) {
        //code for removing
        performSegue(withIdentifier: "mealPlanDetSegue", sender: self)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        if(checkInt(input: quantEntry.text)){
            performSegue(withIdentifier: "mealPlanDetSegue", sender: self)
            //code for saving changes
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
        if(segue.identifier == "mealPlanDetSegue"){
//            let tableViewProg = segue.destination as? MealPlanTableViewController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fNamelbl.text = rName
        quantEntry.text = String(quant)
    }
    
}

