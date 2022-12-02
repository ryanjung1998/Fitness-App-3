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
    
    @IBOutlet weak var IDnum: UILabel!
    
    @IBOutlet weak var ethnicityEntry: UITextField!
    
    @IBOutlet weak var countryEntry: UITextField!
    
    @IBOutlet weak var genderEntry: UITextField!
    
    @IBOutlet weak var heightEntry: UITextField!
    
    @IBOutlet weak var weightEntry: UITextField!
    
    @IBOutlet weak var bdPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

