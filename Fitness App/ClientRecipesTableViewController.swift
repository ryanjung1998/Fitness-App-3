//
//  ClientRecipesViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-03.
//

import UIKit

class ClientRecipesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var entryTableView: UITableView!
    
    var userID : Int!
    var entryList = [String]()
    var idList = [Int]()
    //list of program objects
    override func viewDidLoad() {
        //let db = DBHelper() // Initialize a database
        //db.createDefaults() // Load in deafult tables
        // don't know if need this stuff
        super.viewDidLoad()
        initList()
        // Do any additional setup after loading the view.
    }
    
    func initList()//Have to connect to database here
    {
        entryList = ["Recipe","Recipe","Recipe","Recipe","Recipe","Recipe","Recipe","Recipe","Recipe","Recipe"]
        idList = [1,2,3,4,5,6,7,8,9,10]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID") as! RecipeTableViewCell
        
        let thisEntry = entryList[indexPath.row]
        tableViewCell.rName.text = thisEntry
        tableViewCell.creatorID.text = String(idList[indexPath.row])
        return tableViewCell
    
        
        
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "progSegue", sender: self)
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "progSegue"){
//            let indexPath = self.entryTableView.indexPathForSelectedRow!
//            let tableViewProg = segue.destination as? ClientProgramTableViewController
//            tableViewProg!.progName = entryList[indexPath.row]
//            tableViewProg!.userID = userID
//            //these values will come from the database
//            self.entryTableView.deselectRow(at: indexPath, animated: true)
//        }
//    }

}
