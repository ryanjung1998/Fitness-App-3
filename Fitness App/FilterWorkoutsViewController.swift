//
//  FilterWorkoutsViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-05.
//

import UIKit

class FilterWorkoutsViewController : UIViewController
{
    var userID : Int!
    @IBOutlet weak var tEntry1: UITextField!
    @IBOutlet weak var tEntry2: UITextField!
    
    
    @IBOutlet weak var applyButton: UIButton!
    
    @IBAction func applyTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindToProgram", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "unwindToProgram"){
//            let tableViewProg = segue.destination as? ClientWorkoutTableViewController
//            tableViewProg!.filtName = tEntry1.text
//            tableViewProg!.filtID = Int(tEntry2.text!) ?? 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
