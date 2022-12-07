//
//  IngredientsViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-05.
//

import UIKit

class IngredientsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var entryTableView: UITableView!
    
    var userID : Int!
    var recipeName : String!
    var creatorID : Int!
    
    var entryList = [String]()
    var quantList = [Int]()
    var idList = [Int]()
    
    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: "addFoodsSegue", sender: self)
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
        entryList = ["Ingredient 1","Ingredient 2","Ingredient 3","Ingredient 4","Ingredient 5","Ingredient 6"]
        quantList = [1,2,3,4,5,6]
        idList = [1,2,3,4,5,6]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID") as! recipeTableViewCell
        
        let thisEntry = entryList[indexPath.row]
        tableViewCell.rName.text = thisEntry
        tableViewCell.creatorID.text = String(quantList[indexPath.row])
        return tableViewCell
    
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editIngredientSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "editIngredientSegue"){
            let indexPath = self.entryTableView.indexPathForSelectedRow!
            let dest = segue.destination as? EditIngredientsViewController
            dest!.fName = entryList[indexPath.row]
            dest!.foodID = idList[indexPath.row]
            dest!.quant = quantList[indexPath.row]
            dest!.userID = userID
            dest!.creatorID = creatorID
            //these values will come from the database
            self.entryTableView.deselectRow(at: indexPath, animated: true)
        }
        else if(segue.identifier == "addFoodsSegue"){
            let dest = segue.destination as? FoodTableViewController
            dest!.userID = userID
            dest!.recipeName = recipeName
            dest!.creatorID = creatorID
        }
    }

}
