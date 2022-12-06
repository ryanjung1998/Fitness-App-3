//
//  ClientExercisesTableViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-05.
//

import UIKit

class ClientExercisesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var entryTableView: UITableView!
    
    var userID : Int!
    var entryList = [String]()
    var creatorIDList = [Int]()
    var filtName : String?
    var filtCardio : String?
    var filtStrength : String?
    var filtMuscle : String?
    
    
    //list of program objects
    override func viewDidLoad() {
        super.viewDidLoad()
        initList()
        // Do any additional setup after loading the view.
    }
    
    func initList()//Have to connect to database here
    {
        entryList = ["Exercise","Exercise","Exercise","Exercise","Exercise","Exercise","Exercise","Exercise","Exercise","Exercise","Exercise","Exercise","Exercise","Exercise","Exercise","Exercise","Exercise","Exercise"]
        creatorIDList = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
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
        performSegue(withIdentifier: "filterExercisesSegue", sender: self)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "exeDetailsSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "exeDetailsSegue"){
            let indexPath = self.entryTableView.indexPathForSelectedRow!
            let tableViewProg = segue.destination as? ExerciseDetailsViewController
            tableViewProg!.name = entryList[indexPath.row]
            tableViewProg!.creatorID = creatorIDList[indexPath.row]
            tableViewProg!.userID = userID
            //these values will come from the database
            self.entryTableView.deselectRow(at: indexPath, animated: true)
        }
        
    }

}
