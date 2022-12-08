//
//  AdminTerminalViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-07.
//

import UIKit

class AdminTerminalViewController : UIViewController
{
    var userID: Int! //set this to the uses ID of the signed in user
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var terminalField: UITextView!



    @IBAction func executeTapped(_ sender: Any) {
        //execute sql stuff written in the terminal
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        performSegue(withIdentifier: "logoutSegue", sender: self)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        idLabel.text = "User ID: " + String(userID)
        terminalField.text = ""
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "profileSegue"){
            let dest = segue.destination as? ClientProfileViewController
            dest!.userID = userID
        }
    }
}
