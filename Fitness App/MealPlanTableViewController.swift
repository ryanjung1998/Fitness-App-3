//
//  MealPlanTableViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-06.
//

import UIKit

class MealPlanTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var entryTableView: UITableView!
    
    var userID : Int!
    var filtName : String?
    var filtID : Int?
    
    var entryList = [String]()
    var idList = [Int]()
    
    @IBAction func filtTapped(_ sender: Any) {
        performSegue(withIdentifier: "filterMealPlansSegue", sender: self)
    }
    
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initList()
        // Do any additional setup after loading the view.
    }
    
    func initList()//Have to connect to database here
    {
        entryList = ["Plan1", "Plan2", "Plan3", "Plan4", "Plan5", "Plan6", "Plan7",]
        idList = [1,2,3,4,5,6,7]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID") as! recipeTableViewCell
        
        let thisEntry = entryList[indexPath.row]
        tableViewCell.rName.text = thisEntry
        tableViewCell.creatorID.text = String(idList[indexPath.row])
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "mealPlanDetSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "mealPlanDetSegue"){
            let indexPath = self.entryTableView.indexPathForSelectedRow!
            let dest = segue.destination as? MealPlanDetailViewController
            dest!.userID = userID
            dest!.mpName = entryList[indexPath.row]
            dest!.creatorID = idList[indexPath.row]
            //these values will come from the database
            self.entryTableView.deselectRow(at: indexPath, animated: true)
        }
        if(segue.identifier == "filterMealPlansSegue"){
            let dest = segue.destination as? MealPlanFilterViewController
            dest!.userID = userID
        }
    }
}
