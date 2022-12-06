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
    var reps : Int!
    var sets : Int!
    var dur : Int!
    
    @IBOutlet weak var exeTitle: UILabel!
    
    @IBOutlet weak var repsEntry: UITextField!
    
    @IBOutlet weak var setsEntry: UITextField!
    
    @IBOutlet weak var recEntry: UITextField!
    
    @IBOutlet weak var weightEntry: UITextField!
    
    @IBOutlet weak var distEntry: UITextField!

    @IBOutlet weak var removeButton: UIButton!
    
    @IBOutlet weak var durEntry: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func removeTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindToProgram", sender: self)
        //code for removing
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindToProgram", sender: self)
        //code for saving changes
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "unwindToProgram"){
//            let tableViewProg = segue.destination as? ClientProgramTableViewController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        exeTitle.text = exeName
        repsEntry.text = String(reps)
        setsEntry.text = String(sets)
        recEntry.text = String(100)
        weightEntry.text = String(100)
        durEntry.text = String(dur)
        distEntry.text = String(100)
    }
    
}
