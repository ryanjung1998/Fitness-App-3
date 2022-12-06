//
//  EditIngredientsViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-05.
//

import UIKit
class EditIngredientsViewController : UIViewController
{
    
    var userID : Int!
    var creatorID : Int!
    var foodID : Int!
    var fName : String!
    var quant : Int!
    
    @IBOutlet weak var quantEntry: UITextField!
    
    @IBOutlet weak var fNamelbl: UILabel!
    @IBAction func removeTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindToIngredients", sender: self)
        //code for removing
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindToIngredients", sender: self)
        //code for saving changes
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "unwindToIngredients"){
//            let tableViewProg = segue.destination as? IngredientsViewController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fNamelbl.text = fName
        quantEntry.text = String(quant)
    }
    
}
