//
//  EditGListViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-06.
//

import UIKit
class EditGListViewController : UIViewController
{
    
    var userID : Int!
    var foodID : Int!
    var quant : Int!
    var fName : String!
    
    @IBOutlet weak var quantEntry: UITextField!
    
    @IBOutlet weak var fNamelbl: UILabel!
    
    @IBAction func removeTapped(_ sender: Any) {
        //code for removing
        performSegue(withIdentifier: "unwindToGList", sender: self)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        if(checkInt(input: quantEntry.text)){
            //code for saving changes
            performSegue(withIdentifier: "unwindToGList", sender: self)
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
        if(segue.identifier == "unwindToGList"){
//            let tableViewProg = segue.destination as? ClientGListTableViewController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fNamelbl.text = fName
        quantEntry.text = String(quant)
    }
    
}
