//
//  MealPlanFilterViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-06.
//

import UIKit

class MealPlanFilterViewController : UIViewController
{
    var userID : Int!
    @IBOutlet weak var tEntry1: UITextField!
    @IBOutlet weak var tEntry2: UITextField!
    
    
    @IBOutlet weak var applyButton: UIButton!
    
    @IBAction func applyTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindToMealPlan", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "unwindToMealPlan"){
            let tableViewProg = segue.destination as? MealPlanTableViewController
            tableViewProg!.filtName = tEntry1.text
            tableViewProg!.filtID = Int(tEntry2.text!) ?? nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
