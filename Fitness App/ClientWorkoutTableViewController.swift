//
//  ClientWorkoutTableTest.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-05.
//

import UIKit

class ClientWorkoutTableTest: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var entryTableView: UITableView!
    
    var userID : Int!
    var entryList = [String]()
    var creatorIDList = [Int]()
    var filtName : String?
    var filtID : Int?
    //list of program objects
    
    
    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: "newWorkoutSegue", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initList()
        // Do any additional setup after loading the view.
    }
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    func initList()//Have to connect to database here
    {
        entryList = ["Program","Program","Program","Program","Program","Program","Program","Program","Program","Program","Program","Program","Program","Program","Program","Program","Program","Program"]
        creatorIDList = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
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
    
    
    @IBAction func filterTapped(_ sender: Any) {
        performSegue(withIdentifier: "filterWorkoutsSegue", sender: self)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "progSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "progSegue"){
            let indexPath = self.entryTableView.indexPathForSelectedRow!
            let tableViewProg = segue.destination as? ClientProgramTableViewController
            tableViewProg!.progName = entryList[indexPath.row]
            tableViewProg!.creatorID = creatorIDList[indexPath.row]
            tableViewProg!.userID = userID
            //these values will come from the database
            self.entryTableView.deselectRow(at: indexPath, animated: true)
        }
        else if (segue.identifier == "filterWorkoutSegue"){
            let tableViewProg = segue.destination as? FilterWorkoutsViewController
            tableViewProg!.userID = userID
        }
        else if (segue.identifier == "newWorkoutSegue"){
            let tableViewProg = segue.destination as? NewWorkoutViewController
            tableViewProg!.userID = userID
        }
    }
}

    

    
