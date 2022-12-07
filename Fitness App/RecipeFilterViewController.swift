//
//  RecipeFilterViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-06.
//

import UIKit

class RecipeFilterViewController : UIViewController
{
    var userID : Int!
    @IBOutlet weak var tEntry1: UITextField!
    @IBOutlet weak var tEntry2: UITextField!
    @IBOutlet weak var tEntry3: UITextField!
    @IBOutlet weak var tEntry4: UITextField!
    @IBOutlet weak var tEntry5: UITextField!
    
    @IBOutlet weak var applyButton: UIButton!
    
    @IBAction func applyTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindToRecipeSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "unwindToRecipeSegue"){
            let dest = segue.destination as? ClientRecipesTableViewController
            dest!.filtName = tEntry1.text
            dest!.filtCals = Int(tEntry2.text!)
            dest!.filtProt = Int(tEntry3.text!)
            dest!.filtFat = Int(tEntry4.text!)
            dest!.filtCarb = Int(tEntry5.text!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
