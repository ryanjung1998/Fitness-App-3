//
//  ExerciseFilterViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-05.
//

import UIKit

class ExerciseFilterViewController : UIViewController
{
    var userID : Int!
    @IBOutlet weak var tEntry1: UITextField!
    @IBOutlet weak var tEntry2: UITextField!
    @IBOutlet weak var tEntry4: UITextField!
    @IBOutlet weak var tEntry3: UITextField!
    
    @IBOutlet weak var applyButton: UIButton!
    
    @IBAction func applyTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindToExe", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "unwindToExe"){
            let dest = segue.destination as? ClientExercisesTableViewController
            dest!.filtName = tEntry1.text
            dest!.filtCardio = tEntry2.text
            dest!.filtStrength = tEntry3.text
            dest!.filtMuscle = tEntry4.text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

