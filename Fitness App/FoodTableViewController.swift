//
//  FoodTable
//  FoodTableViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-06.
//

import UIKit

class FoodTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var entryTableView: UITableView!
    
    var userID : Int!
    var creatorID : Int!
    var recipeName : String!
    
    var entryList = [String]()
    var foodIDList = [Int]()
    var filtName : String?
    var filtID : Int?
    var filtCals : Int?
    var filtFat : Int?
    var filtProt : Int?
    var filtCarbs : Int?
    
    //list of program objects
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initList()
        // Do any additional setup after loading the view.
    }
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    
    @IBAction func filtTapped(_ sender: Any) {
        performSegue(withIdentifier: "filterFoodsSegue", sender: self)
    }
    func initList()//Have to connect to database here
    {
        entryList = ["Food 1","Food 2","Food 3","Food 4","Food 5","Food 6","Food 7"]
        foodIDList = [1,2,3,4,5,6,7]
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
        performSegue(withIdentifier: "filterFoodsSegue", sender: self)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "addFoodSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addFoodSegue"){
            let indexPath = self.entryTableView.indexPathForSelectedRow!
            let tableViewProg = segue.destination as? AddToRecipeViewController
            tableViewProg!.foodID = foodIDList[indexPath.row]
            tableViewProg!.creatorID = creatorID
            tableViewProg!.userID = userID
            tableViewProg!.rName = recipeName
            //these values will come from the database
            self.entryTableView.deselectRow(at: indexPath, animated: true)
        }
        else if(segue.identifier == "filterFoodsSegue"){
            let dest = segue.destination as? FoodFilterViewController
            dest!.userID = userID
        }
    }
}
