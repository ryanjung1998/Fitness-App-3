//
//  ViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-11-27.
//

import UIKit

class LoginViewController: UIViewController {
    //testing push
    @IBOutlet weak var clientLoginButton: UIButton!
    
    @IBOutlet weak var adminLoginButton: UIButton!
    
    @IBOutlet weak var newClientButton: UIButton!
    
    @IBOutlet weak var newAdminButton: UIButton!
    
    @IBOutlet weak var idEntry: UITextField!
    
    @IBOutlet weak var errorLbl: UILabel!
    
    @IBAction func adminLoginTap(_ sender: Any) {
        if (checkInt(input: idEntry.text)){
            //other verification
            performSegue(withIdentifier: "adminMenuSegue", sender: self)
        }
        else{errorLbl.text = "Invalid ID"}
    }
    
    
    @IBAction func clientLoginTap(_ sender: Any) {
        if (checkInt(input: idEntry.text)){
            //other verification
            performSegue(withIdentifier: "clientMenuSegue", sender: self)
        }
        else{errorLbl.text = "Invalid ID"}
    }
    
    @IBAction func newClientTapped(_ sender: Any) {
        performSegue(withIdentifier: "newClientSegue", sender: self)
    }
    
    @IBAction func newAdminTapped(_ sender: Any) {
        performSegue(withIdentifier: "newAdminSegue", sender: self)
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
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
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
        print("Documents Directory: ", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last ?? "Not Found!") // Print the database path
        // Below initializes the database at first. If you want to re-initialize, then you must comment db.createDefaults() and sampleInsert(db:db)
        let db = DBHelper() // Initialize a database path
//        db.createDefaults() // Load in default tables
//        sampleInsert(db: db) // Load in sample datagetRecipesInMealPlan
        //print(db.getRecipes(userID: 1))
//        print(db.getWorkoutPrograms(userID: 1))
//        print(db.getProgramDetails(programName: "Leg day"))
//        print(db.getExerciseDetails(exerciseName: "Squat", programName: "Leg day"))
//        print(db.getExercises(userID: 1))
        print(db.getExerciseDetailsWithEquip(eName: "Squat"))
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "clientMenuSegue") {
            let menu = segue.destination as? ClientMainMenuViewController
            menu!.userID = Int(idEntry.text!) ?? 0
        }
        else if (segue.identifier == "newClientSegue"){
            let dest = segue.destination as? NewClientViewController
            dest!.userID = 0
        }
        else if (segue.identifier == "adminMenuSegue") {
            let menu = segue.destination as? AdminTerminalViewController
            menu!.userID = Int(idEntry.text!) ?? 0
        }
        else if (segue.identifier == "newAdminSegue") {
            let dest = segue.destination as? NewAdminViewController
            dest!.userID = 0
        }
    }
}

