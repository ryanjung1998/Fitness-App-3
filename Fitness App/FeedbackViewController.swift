//
//  FeedbackViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-06.
//

import UIKit
class FeedbackViewController : UIViewController
{
    var userID : Int!
    
    @IBOutlet weak var textfield: UITextView!
    
    
    @IBAction func submitTapped(_ sender: Any) {
        //save feedback to db
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
