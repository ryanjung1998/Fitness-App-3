//
//  ClientMainMenuController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-02.
//

import Foundation
import UIKit

class ClientMainMenuViewController : UIViewController
{
    var userID: Int = 0 //set this to the uses ID of the signed in user
    
    @IBOutlet weak var profileButton: UIButton!
    
    @IBAction func profileTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "profileSegue", sender: self)
    }
    
    @IBAction func journalTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "clientJournalSegue", sender: self)
    }
    
    @IBAction func workoutProgramsTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "clientWorkoutProgramsSegue", sender: self)
    }
    
    @IBAction func exercisesTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "listSegue", sender: self)
    }
    
    
    
    
    @IBOutlet weak var journalButton: UIButton!
    
    @IBOutlet weak var exercisesButton: UIButton!
    
    @IBOutlet weak var wprogramButton: UIButton!
    
    @IBOutlet weak var recipesButton: UIButton!
    
    @IBOutlet weak var mplanButton: UIButton!
    
    @IBOutlet weak var groceryButton: UIButton!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var feedbackButton: UIButton!
    
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //    if(segue.identifier == "profileSegue"){
    //        let clientProfileViewController = segue.destination as? ClientProfileViewController
            
     //   }
     //   else if(segue.identifier == "journalSegue"){
     //       let clientJournalViewController = segue.destination as? TableViewController
    //    }
    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
