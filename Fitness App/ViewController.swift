//
//  ViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-11-27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        let db = DBHelper() // Initialize a database
        db.createDefaults() // Load in deafult tables
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

