//
//  FilterWorkoutsViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-05.
//

import UIKit

class FilterWorkoutsViewController : UIViewController
{
    var userID : Int!
    @IBOutlet weak var tEntry1: UITextField!
    @IBOutlet weak var tEntry2: UITextField!
    
    
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var applyButton: UIButton!
    
    func checkInt(input : String?)->Bool{
        if let inputReal = input {
            if inputReal == ""{
                print("thought it was empty string")
                return true}
            else if (Int(inputReal) ?? -1) == -1{
                print("not an integer input")
                return false}
            else{
                print("valid integer input")
                return true}
        }
        else{
            print("thought it was nil")
            return true
        }
    }
    
    func checkString(input : String?)->Bool{
        if let inputReal = input {
            if inputReal == ""{
                print("thought it was empty string")
                return true}
            else if (inputReal.contains("\\") || inputReal.contains("\"") || inputReal.contains("\'")){
                print("not a valid input" + inputReal)
                return false}
            else{
                print("valid integer input")
                return true}
        }
        else{
            print("thought it was nil")
            return true
        }
    }
    
    @IBAction func applyTapped(_ sender: Any) {
        if (checkString(input: tEntry1.text) && checkInt(input: tEntry2.text)){
            print("Entry 1 good: " + (tEntry1.text ?? "error"))
            print("Entry 2 good: " + (tEntry2.text ?? "error"))
            performSegue(withIdentifier: "unwindToProgram", sender: self)
        }
        else{
            errorLbl.text = "Input Invalid"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "unwindToProgram"){
            let tableViewProg = segue.destination as? ClientWorkoutTableTest
            tableViewProg!.filtName = tEntry1.text
            tableViewProg!.filtID = Int(tEntry2.text!) ?? nil 
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
