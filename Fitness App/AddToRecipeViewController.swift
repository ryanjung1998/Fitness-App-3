//
//  AddToRecipeViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-06.
//

import UIKit
class AddToRecipeViewController : UIViewController
{
    
    var userID : Int!
    var creatorID : Int!
    var rName : String!
    var foodID : Int!
    
    
    @IBOutlet weak var quantEntry: UITextField!
    
    @IBOutlet weak var mealPlanEntry: UITextField!
    @IBOutlet weak var fNamelbl: UILabel!
    
    @IBAction func addTapped(_ sender: Any) {
        //code for saving changes to db
        performSegue(withIdentifier: "unwindToRecipe", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "unwindToRecipe"){
//            let tableViewProg = segue.destination as? RecipeViewController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fNamelbl.text = rName
    }
    
}
