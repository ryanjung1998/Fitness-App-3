//
//  ClientMainMenuController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-02.
//

import UIKit

class ClientMainMenuViewController : UIViewController
{
    var userID: Int! //set this to the uses ID of the signed in user
    
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var profileButton: UIButton!
    
    @IBAction func profileTapped(_ sender: Any) {
        performSegue(withIdentifier: "profileSegue", sender: self)
    }
    
    @IBAction func journalTapped(_ sender: Any) {
        performSegue(withIdentifier: "clientJournalSegue", sender: self)
    }
    
    @IBAction func workoutProgramsTapped(_ sender: Any) {
        performSegue(withIdentifier: "clientWorkoutProgramsSegue", sender: self)
    }
    
    @IBAction func exercisesTapped(_ sender: Any) {
        performSegue(withIdentifier: "clientExercisesSegue", sender: self)
    }
    
    @IBAction func recipesTapped(_ sender: Any) {
        performSegue(withIdentifier: "clientRecipesSegue", sender: self)
    }
    
    @IBAction func mPlansTapped(_ sender: Any) {
        performSegue(withIdentifier: "mPlansSegue", sender: self)
    }
    
    @IBAction func gListTapped(_ sender: Any) {
        performSegue(withIdentifier: "gListSegue", sender: self)
    }
    
    @IBAction func feedbackTapped(_ sender: Any) {
        performSegue(withIdentifier: "feedbackSegue", sender: self)
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        performSegue(withIdentifier: "logoutSegue", sender: self)
    }
    @IBOutlet weak var journalButton: UIButton!
    
    @IBOutlet weak var exercisesButton: UIButton!
    
    @IBOutlet weak var wprogramButton: UIButton!
    
    @IBOutlet weak var recipesButton: UIButton!
    
    @IBOutlet weak var mplanButton: UIButton!
    
    @IBOutlet weak var groceryButton: UIButton!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var feedbackButton: UIButton!
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "profileSegue"){
            let dest = segue.destination as? ClientProfileViewController
            dest!.userID = userID
        }
        else if(segue.identifier == "clientJournalSegue"){
            let dest = segue.destination as? ClientJournalTableViewController
            dest!.userID = userID 
        }
        else if(segue.identifier == "clientWorkoutProgramsSegue"){
            let dest = segue.destination as? ClientWorkoutTableTest
            dest!.userID = userID
        }
        else if(segue.identifier == "clientRecipesSegue"){
            let dest = segue.destination as? ClientRecipesTableViewController
            dest!.userID = userID
        }
        else if(segue.identifier == "gListSegue"){
            let dest = segue.destination as? ClientGListTableViewController
            dest!.userID = userID
        }
        else if(segue.identifier == "clientExercisesSegue"){
            let dest = segue.destination as? ClientExercisesTableViewController
            dest!.userID = userID
        }
        else if(segue.identifier == "mPlansSegue"){
            let dest = segue.destination as? MealPlanTableViewController
            dest!.userID = userID
        }
        else if(segue.identifier == "feedbackSegue"){
            let dest = segue.destination as? FeedbackViewController
            dest!.userID = userID
        }
        else if(segue.identifier == "logoutSegue"){
//            let dest = segue.destination as? LoginViewController
        }
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        idLabel.text = "User ID: " + String(userID)
        // Do any additional setup after loading the view.
    }
}

