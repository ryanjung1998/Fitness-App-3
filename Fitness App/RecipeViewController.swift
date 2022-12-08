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
    let db = DBHelper()
    
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
        
        var varList = db.getDetailsOfRecipe(recipeName: recipeName)
        rName.text = recipeName
        cID.text = "Creator ID: " + varList[0]
        //set other attributes based on database values
        pTime.text = "Prep Time: " + varList[1]
        tCals.text = "Total Calories: " + varList[2]
        tProt.text = "Total Protein: " + varList[3]
        tFat.text = "Total Fat: " + varList[4]
        tCarbs.text = "Total Carbs: " + varList[5]
        InstructionsView.text = varList[6]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addToMPlanSegue"){
            let dest = segue.destination as? AddToPlanViewController
            dest!.rName = recipeName
            dest!.userID = userID
            dest!.creatorID = creatorID
            //these values will come from the database
        }
        else if (segue.identifier == "ingredientsSegue"){
            let dest = segue.destination as? IngredientsViewController
            dest!.recipeName = recipeName
            dest!.userID = userID
            dest!.creatorID = creatorID
            
        }
    }
    

}
