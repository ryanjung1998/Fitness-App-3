//
//  AddToProgramViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-05.
//

import UIKit

class AddToProgramViewController : UIViewController
{
    var userID : Int!
    var exeName : String!
    var creatorID : Int!
    
    @IBOutlet weak var tEntry1: UITextField!
    @IBOutlet weak var tEntry2: UITextField!
    @IBOutlet weak var tEntry4: UITextField!
    @IBOutlet weak var tEntry3: UITextField!
    @IBOutlet weak var tEntry6: UITextField!
    @IBOutlet weak var tEntry5: UITextField!
    
    
    @IBAction func addTapped(_ sender: Any) {
        //verification of entered info code
        
        //adding to db code
        performSegue(withIdentifier: "unwindToExeDet", sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}