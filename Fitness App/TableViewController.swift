//
//  TableViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-02.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var entryTableView: UITableView!
    
    var entryList = [String]()
    
    override func viewDidLoad() {
        //let db = DBHelper() // Initialize a database
        //db.createDefaults() // Load in deafult tables
        // don't know if need this stuff
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func initList()//Have to connect to database here
    {
        let entry1 = "Entry 1"
        entryList.append(entry1)
        
        let entry2 = "Entry 2"
        entryList.append(entry2)
        
        let entry3 = "Entry 3"
        entryList.append(entry3)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID") as! TableViewCell
        
        let thisEntry = entryList[indexPath.row]
        tableViewCell.entryName.text = thisEntry
        return tableViewCell
    }

}
