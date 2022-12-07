//
//  EditMealPlanViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-06.
//

import UIKit
class EditMealPlanViewController : UIViewController
{
    
    var userID : Int!
    var mpcID : Int!
    var mpName : String!
    var rcID : Int!
    var rName : String!
    var quant : Int!
    
    @IBOutlet weak var quantEntry: UITextField!
    
    @IBOutlet weak var fNamelbl: UILabel!
    @IBAction func removeTapped(_ sender: Any) {
        //code for removing
        performSegue(withIdentifier: "unwindToIngredients", sender: self)
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
        fNamelbl.text = rName
        quantEntry.text = String(quant)
    }
    
}

