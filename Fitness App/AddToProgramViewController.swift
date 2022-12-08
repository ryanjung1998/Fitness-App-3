//
//  AddToProgramViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-05.
//

import UIKit

class AddToProgramViewController : UIViewController
{
    var userID : Int!
    var exeName : String!
    var creatorID : Int!
    
    @IBOutlet weak var tEntry1: UITextField!
    @IBOutlet weak var tEntry2: UITextField!
    @IBOutlet weak var tEntry4: UITextField!
    @IBOutlet weak var tEntry3: UITextField!
    @IBOutlet weak var tEntry6: UITextField!
    @IBOutlet weak var tEntry5: UITextField!
    @IBOutlet weak var tEntry7: UITextField!
    
    @IBAction func addTapped(_ sender: Any) {
    //verify shit
    //adding to db code
        if(tEntry1.text!.isAlphanumeric && checkInt(input: tEntry2.text) && checkInt(input: tEntry3.text) && checkInt(input: tEntry4.text) && checkInt(input: tEntry5.text) && checkInt(input: tEntry6.text) && checkDouble(input: tEntry7.text)) {
            //other verification
            performSegue(withIdentifier: "unwindToExeDet", sender: self)
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
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "unwindToExeDet"){
//            let dest = segue.destination as? ExerciseDetailsViewController
//
//        }
//    }
    
}
