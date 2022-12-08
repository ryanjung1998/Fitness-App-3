//
//  MealPlanDetailViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-06.
//

import UIKit

class MealPlanDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var entryTableView: UITableView!
    
    var userID : Int!
    var creatorID : Int!
    var mpName : String!
    var mpcID : Int!
    let db = DBHelper()
    
    var filtName : String?
    var filtCals : Int?
    var filtProt : Int?
    var filtFat : Int?
    var filtCarb : Int?
    
    var entryList = [String]()
    var quantList = [Int]()
    var idList = [Int]()
    
    
    @IBAction func addToGListTapped(_ sender: Any) {
        //add ingredients to grocery list code
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
        let querList = db.getRecipesInMealPlan(planName: mpName) // [food, quant]
        var i = 0
        entryList = [] // Food name
        quantList = []
        idList = []

        while(i<querList.count){
            entryList.append(querList[i][0])
            quantList.append(Int(querList[i][1])!)
            idList.append(Int(querList[i][2])!)
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
        tableViewCell.creatorID.text = String(quantList[indexPath.row])
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editMPSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "editMPSegue"){
            let indexPath = self.entryTableView.indexPathForSelectedRow!
            let dest = segue.destination as? EditMealPlanViewController
            dest!.userID = userID
            dest!.rName = entryList[indexPath.row]
            dest!.quant = quantList[indexPath.row]
            dest!.mpName = mpName
            dest!.mpcID = mpcID
            dest!.rcID = idList[indexPath.row]
            //these values will come from the database
            
            self.entryTableView.deselectRow(at: indexPath, animated: true)
        }
        if(segue.identifier == "filterMealPlansSegue"){
            let dest = segue.destination as? MealPlanFilterViewController
            dest!.userID = userID
        }
    }
}
