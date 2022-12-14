//
//  JournalEntryViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-03.
//

import UIKit

class JournalEntryViewController : UIViewController
{
    var userID : Int!
    var ddate : Date!
    var wweight : Int!
    
    var cals : Int!
    var qual : String!
    var hours : Int!
    
    let db = DBHelper()
    let dateFormatter = DateFormatter()
    
    
    @IBOutlet weak var weight: UILabel!
    
    @IBOutlet weak var calsBurned: UILabel!
    
    @IBOutlet weak var sleepQual: UILabel!
    
    @IBOutlet weak var sleepHours: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the list of journals
        //date, weight, cal, qual, sleep

        dateFormatter.dateFormat = "MM/d/YY"
        date.text = dateFormatter.string(from:ddate)
        var journalList = db.getJournalEntries(userID: self.userID)
        var i = 0
        var j = 0
        var entry = [String]()
        while(i<journalList.count){
            if (journalList[i][j] == dateFormatter.string(from:ddate)){ // Find the list with the date
            }
            i+=1
        }
        if (entry.count<1){
            entry = journalList[0]
        }
        weight.text = entry[1]
        calsBurned.text = entry[2]
        sleepQual.text = entry[3]
        sleepHours.text = entry[4]
        
        // Do any additional setup after loading the view.
    }
}
