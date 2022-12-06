//
//  ViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-11-27.
//

import UIKit

class LoginViewController: UIViewController {
    //testing push
    @IBOutlet weak var clientLoginButton: UIButton!
    
    @IBOutlet weak var adminLoginButton: UIButton!
    
    @IBOutlet weak var newClientButton: UIButton!
    
    @IBOutlet weak var newAdminButton: UIButton!
    
    @IBOutlet weak var idEntry: UITextField!
    
    @IBAction func adminLoginTap(_ sender: Any) {
        self.performSegue(withIdentifier: "adminMenuSegue", sender: self)
    }
    
    @IBAction func clientLoginTap(_ sender: Any) {
        self.performSegue(withIdentifier: "clientMenuSegue", sender: self)
    }
    
    
    override func viewDidLoad() {
        let db = DBHelper() // Initialize a database
        db.createDefaults() // Load in deafult tables
        db.insertDefaults() // Dummy values
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "clientMenuSegue") {
            let menu = segue.destination as? ClientMainMenuViewController
            menu!.userID = Int(idEntry.text!) ?? 0
        }
        
    }


}

