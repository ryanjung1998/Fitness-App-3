//
//  ClientJournalTableViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-03.
//

import UIKit

class ClientJournalTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    

    @IBOutlet weak var entryTableView: UITableView!
    
    var userID: Int!
    var entryList = [String]()
    
    override func viewDidLoad() {
        //let db = DBHelper() // Initialize a database
        //db.createDefaults() // Load in deafult tables
        // don't know if need this stuff
        super.viewDidLoad()
        initList()
        // Do any additional setup after loading the view.
    }
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    func initList()//Have to connect to database here
    {
        entryList = ["Journal Entry","Journal Entry","Journal Entry","Journal Entry","Journal Entry","Journal Entry","Journal Entry","Journal Entry","Journal Entry","Journal Entry","Journal Entry","Journal Entry","Journal Entry","Journal Entry"]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "journalTableViewCellID") as! TableViewCell
        
        let thisEntry = entryList[indexPath.row]
        tableViewCell.entryName.text = thisEntry
        return tableViewCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "journalEntrySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "journalEntrySegue"){
            let indexPath = self.entryTableView.indexPathForSelectedRow!
            
            let tableViewEntry = segue.destination as? JournalEntryViewController
            
            tableViewEntry!.userID = userID
            tableViewEntry!.ddate = Date()
            tableViewEntry!.wweight = 100
            tableViewEntry!.cals = 3000
            tableViewEntry!.qual = "good"
            tableViewEntry!.hours = 8
            //these values will come from the database
            
            self.entryTableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
