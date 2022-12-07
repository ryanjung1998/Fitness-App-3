//
//  EditGListViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-06.
//

import UIKit
class EditGListViewController : UIViewController
{
    
    var userID : Int!
    var foodID : Int!
    var quant : Int!
    var fName : String!
    
    @IBOutlet weak var quantEntry: UITextField!
    
    @IBOutlet weak var fNamelbl: UILabel!
    @IBAction func removeTapped(_ sender: Any) {
        //code for removing
        performSegue(withIdentifier: "unwindToGList", sender: self)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        //code for saving changes
        performSegue(withIdentifier: "unwindToGList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "unwindToGList"){
//            let tableViewProg = segue.destination as? ClientGListTableViewController
//
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fNamelbl.text = fName
        quantEntry.text = String(quant)
    }
    
}
