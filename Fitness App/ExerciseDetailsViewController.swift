//
//  ExerciseDetailsViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-05.
//

import UIKit

class ExerciseDetailsViewController : UIViewController
{
    var userID : Int!
    var name : String!
    var creatorID : Int!

    @IBOutlet weak var Header: UILabel!
    
    @IBOutlet weak var idEntry: UILabel!
    @IBOutlet weak var strengthlbl: UILabel!
    @IBOutlet weak var cardiolbl: UILabel!
    @IBOutlet weak var metLbl: UILabel!
    @IBOutlet weak var equipLbl: UILabel!
    @IBAction func addToTapped(_ sender: Any) {
        performSegue(withIdentifier: "addToProgSegue", sender: self)
    }
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Header.text = name
        idEntry.text = String(creatorID)
        metLbl.text = String(1.1)
        cardiolbl.text = "Yes"
        strengthlbl.text = "No"
        equipLbl.text = "Equipment 1, Equipment 2"
        
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addToProgSegue"){
            let dest = segue.destination as? AddToProgramViewController
            dest!.exeName = name
            dest!.userID = userID
            dest!.creatorID = creatorID
        }
    }
}

