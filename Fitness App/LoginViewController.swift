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
        print("Documents Directory: ", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last ?? "Not Found!") // Print the database path
        // Below initializes the database at first. If you want to re-initialize, then you must comment db.createDefaults() and sampleInsert(db:db)
        let db = DBHelper() // Initialize a database path
        db.createDefaults() // Load in default tables
        sampleInsert(db: db) // Load in sample data
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

