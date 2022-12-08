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
    let db = DBHelper()
    
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
        entryList = []
        repsList = []
        setsList = []
        durList = []
        var varList = db.getProgramDetails(programName: progName)
        var i = 0
        while(i<varList.count){
            entryList.append(varList[i][0])
            repsList.append(Int(varList[i][1])!)
            setsList.append(Int(varList[i][2])!)
            durList.append(Int(varList[i][3])!)
            i+=1
        }

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
            tableViewProg!.reps = repsList[indexPath.row]
            tableViewProg!.sets = setsList[indexPath.row]
            tableViewProg!.dur = durList[indexPath.row]
            //these values will come from the database
            self.entryTableView.deselectRow(at: indexPath, animated: true)
        }
    }

}

    

    
