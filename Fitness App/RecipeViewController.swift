//
//  RecipeViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-05.
//

import UIKit

class RecipeViewController: UIViewController {
    
    var userID : Int!
    var creatorID : Int!
    var recipeName: String!
    
    @IBOutlet weak var rName: UILabel!
    @IBOutlet weak var cID: UILabel!
    @IBOutlet weak var pTime: UILabel!
    @IBOutlet weak var tCals: UILabel!
    @IBOutlet weak var tFat: UILabel!
    @IBOutlet weak var tProt: UILabel!
    @IBOutlet weak var tCarbs: UILabel!
    
    
    @IBOutlet weak var InstructionsView: UITextView!
    
    @IBAction func addToPlanTapped(_ sender: Any) {
        performSegue(withIdentifier: "addToMPlanSegue", sender: self)
    }
    
    @IBAction func ingredientsTapped(_ sender: Any) {
        performSegue(withIdentifier: "ingredientsSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rName.text = recipeName
        cID.text = String(creatorID)
        //set other attributes based on database values
        InstructionsView.text = "Line 1/n Line 2/n Line 3"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addToMPlanSegue"){
            let dest = segue.destination as? AddToPlanViewController
            dest!.rName = recipeName
            
            dest!.userID = userID
            dest!.creatorID = creatorID
            //these values will come from the database
        }
    }

}
