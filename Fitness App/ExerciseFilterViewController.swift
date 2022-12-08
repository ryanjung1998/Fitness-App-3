//
//  ExerciseFilterViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-05.
//

import UIKit

class ExerciseFilterViewController : UIViewController
{
    var userID : Int!
    @IBOutlet weak var tEntry1: UITextField!
    @IBOutlet weak var tEntry2: UITextField!
    @IBOutlet weak var tEntry4: UITextField!
    @IBOutlet weak var tEntry3: UITextField!
    
    @IBOutlet weak var applyButton: UIButton!
    
    @IBAction func applyTapped(_ sender: Any) {
        if(checkInt(input: tEntry1.text) && tEntry2.text!.isAlphanumeric && tEntry3.text!.isAlphanumeric && tEntry4.text!.isAlphanumeric){
            //other verification
            performSegue(withIdentifier: "unwindToExe", sender: self)
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
        if(segue.identifier == "unwindToExe"){
            let dest = segue.destination as? ClientExercisesTableViewController
            dest!.filtName = tEntry1.text
            dest!.filtCardio = tEntry2.text
            dest!.filtStrength = tEntry3.text
            dest!.filtMuscle = tEntry4.text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

