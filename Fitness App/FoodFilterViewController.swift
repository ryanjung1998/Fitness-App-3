//
//  FoodFilterViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-06.
//

import UIKit

class FoodFilterViewController : UIViewController
{
    var userID : Int!
    @IBOutlet weak var tEntry1: UITextField!
    @IBOutlet weak var tEntry2: UITextField!
    @IBOutlet weak var tEntry3: UITextField!
    @IBOutlet weak var tEntry4: UITextField!
    @IBOutlet weak var tEntry5: UITextField!
    
    @IBOutlet weak var applyButton: UIButton!
    
    @IBAction func applyTapped(_ sender: Any) {
        if(checkString(input: tEntry1.text) && checkInt(input: tEntry2.text) && checkInt(input: tEntry3.text) && checkInt(input: tEntry4.text) && checkInt(input: tEntry5.text)){
            //other validation
            performSegue(withIdentifier: "unwindToFoodSegue", sender: self)
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
        if(segue.identifier == "unwindToFoodSegue"){
            let dest = segue.destination as? FoodTableViewController
            dest!.filtName = tEntry1.text
            dest!.filtCals = Int(tEntry2.text!)
            dest!.filtProt = Int(tEntry3.text!)
            dest!.filtFat = Int(tEntry4.text!)
            dest!.filtCarbs = Int(tEntry5.text!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
