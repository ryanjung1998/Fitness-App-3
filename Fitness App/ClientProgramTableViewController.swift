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
    var creatorID : Int!
    var entryList = [String]()
    var repsList = [Int]()
    var setsList = [Int]()
    var durList = [Int]()
    
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
        repsList = [1,1,1,1,1,1]
        setsList = [1,1,1,1,1,1]
        durList = [1,1,1,1,1,1]
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "exInProgTableViewCellID") as! exInProgTableViewCell 
        
        let thisEntry = entryList[indexPath.row]
        tableViewCell.exName.text = thisEntry
        tableViewCell.exReps.text = String(repsList[indexPath.row])
        tableViewCell.exSets.text = String(setsList[indexPath.row])
        tableViewCell.exDur.text = String(durList[indexPath.row])
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "removeExerciseSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "removeExerciseSegue"){
            let indexPath = self.entryTableView.indexPathForSelectedRow!
            let tableViewProg = segue.destination as? ClientRemoveExerciseViewController
            tableViewProg!.exeName = entryList[indexPath.row]
            tableViewProg!.userID = userID
            tableViewProg!.progName = progName
            tableViewProg!.creatorID = creatorID
            //these values will come from the database
            self.entryTableView.deselectRow(at: indexPath, animated: true)
        }
    }

}

    

    
