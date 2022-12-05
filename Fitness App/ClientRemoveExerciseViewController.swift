//
//  ClientRemoveExerciseViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-04.
//

import UIKit

class ClientRemoveExerciseViewController : UIViewController
{
    
    var progName : String!
    var userID : Int!
    var creatorID : Int!
    var exeName : String!
    @IBOutlet weak var removeButton: UIButton!
    
    @IBAction func removeTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindToProgram", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "unwindToProgram"){
            let tableViewProg = segue.destination as? ClientProgramTableViewController
            //do removing of exercise from db here
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
