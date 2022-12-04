//
//  ClientProgramViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-03.
//

import UIKit

class ClientProgramTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var entryTableView: UITableView!
    @IBOutlet weak var gtitle: UILabel!
    var progName : String!
    var userID : Int!
    
    var entryList = [String]()
    
    override func viewDidLoad() {
        //let db = DBHelper() // Initialize a database
        //db.createDefaults() // Load in deafult tables
        // don't know if need this stuff
        super.viewDidLoad()
        
        initList()
        gtitle.text = progName
        // Do any additional setup after loading the view.
    }
    
    func initList()//Have to connect to database here
    {
        entryList = ["Exercise 1","Exercise 2","Exercise 3","Exercise 4","Exercise 5","Exercise 6",]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "exInProgTableViewCellID") as! exInProgTableViewCell 
        
        let thisEntry = entryList[indexPath.row]
        tableViewCell.exName.text = thisEntry
        return tableViewCell
    
        
        
    }

}

    

    
