//
//  FeedbackViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-06.
//

import UIKit
class FeedbackViewController : UIViewController
{
    var userID : Int!
    
    @IBOutlet weak var textfield: UITextView!
    
    
    @IBOutlet weak var errorLbl: UILabel!
    @IBAction func submitTapped(_ sender: Any) {
        if(textfield.text!.isAlphanumeric){
            //save feedback to db
            errorLbl.text = ""
        }
        else{
            errorLbl.text = "Invalid Characters Present"
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
        textfield.text = ""
        // Do any additional setup after loading the view.
    }
}
