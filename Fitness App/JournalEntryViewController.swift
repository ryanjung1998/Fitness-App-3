//
//  JournalEntryViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-03.
//

import Foundation
import UIKit

class JournalEntryViewController : UIViewController
{
    var ddate : Date!
    var wweight : Int!
    
    var cals : Int!
    var qual : String!
    var hours : Int!
    
    let dateFormatter = DateFormatter()
    
    
    @IBOutlet weak var weight: UILabel!
    
    @IBOutlet weak var calsBurned: UILabel!
    
    @IBOutlet weak var sleepQual: UILabel!
    
    @IBOutlet weak var sleepHours: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "YY/MM/dd"
        date.text = dateFormatter.string(from:ddate)
        weight.text = String(wweight)
        calsBurned.text = String(cals)
        sleepQual.text = String(qual)
        sleepHours.text = String(hours)
        
        // Do any additional setup after loading the view.
    }
}
