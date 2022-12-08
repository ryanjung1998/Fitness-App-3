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
    var filtName : String?
    var filtCals : Int?
    var filtProt : Int?
    var filtFat : Int?
    var filtCarb : Int?
    let db = DBHelper()
    
    var entryList = [String]()
    var idList = [Int]()
    
    @IBAction func filtTapped(_ sender: Any) {
        performSegue(withIdentifier: "filterRecipesSegue", sender: self)
    }
    
    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: "newRecipeSegue", sender: self)
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
        let querList = db.getRecipes(userID: userID)
        var i = 0
        entryList = [] // Food name
        idList = []
        while(i<querList.count){
            entryList.append(querList[i][0])
            idList.append(Int(querList[i][1])!)
            i+=1
        }
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
        self.performSegue(withIdentifier: "recipeDetSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "recipeDetSegue"){
            let indexPath = self.entryTableView.indexPathForSelectedRow!
            let dest = segue.destination as? RecipeViewController
            dest!.userID = userID
            dest!.recipeName = entryList[indexPath.row]
            dest!.creatorID = idList[indexPath.row]
            //these values will come from the database
            self.entryTableView.deselectRow(at: indexPath, animated: true)
        }
        if(segue.identifier == "filterRecipesSegue"){
            let dest = segue.destination as? RecipeFilterViewController
            dest!.userID = userID
        }
        if(segue.identifier == "newRecipeSegue"){
            let dest = segue.destination as? NewRecipeViewController
            dest!.userID = userID
        }
    }
}
