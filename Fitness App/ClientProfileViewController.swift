//
//  ClientProfileView.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-02.
//

import Foundation
import UIKit

class ClientProfileViewController : UIViewController
{
    var userID: Int!
    
    @IBOutlet weak var IDnum: UILabel!
    
    @IBOutlet weak var ethnicityEntry: UITextField!
    
    @IBOutlet weak var countryEntry: UITextField!
    
    @IBOutlet weak var genderEntry: UITextField!
    
    @IBOutlet weak var heightEntry: UITextField!
    
    @IBOutlet weak var weightEntry: UITextField!
    
    @IBOutlet weak var bdPicker: UIDatePicker!
    
    @IBOutlet weak var proteinEntry: UITextField!
    
    @IBOutlet weak var carbsEntry: UITextField!
    
    @IBOutlet weak var fatEntry: UITextField!
    
    @IBOutlet weak var sugarEntry: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        IDnum.text = "default"
        ethnicityEntry.text = "default"
        countryEntry.text = "default"
        genderEntry.text = "default"
        heightEntry.text = String(150)
        weightEntry.text = String(150)
        bdPicker.date = Date()
        proteinEntry.text = String(10)
        carbsEntry.text = String(10)
        fatEntry.text = String(10)
        sugarEntry.text = String(10)
        
        //get these values based on userID
    }
    @IBAction func saveChangesTapped(_ sender: Any) {
        //save entered values to database
    }
}

