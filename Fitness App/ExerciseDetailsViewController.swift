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
    let db = DBHelper()

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
        var varList = db.getExerciseDetailsWithEquip(eName: name)
        Header.text = name
        idEntry.text = String(creatorID)
        metLbl.text = varList[1]
        cardiolbl.text = (varList[2] == 1)
        strengthlbl.text = (varList[3] == 1)
        equipLbl.text = varList[4]
        
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

