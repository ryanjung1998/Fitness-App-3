//
//  ClientGListTableViewController.swift
//  Fitness App
//
//  Created by Ryan Jung on 2022-12-04.
//

import UIKit

class ClientGListTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var entryTableView: UITableView!
    
    var userID : Int!
    var entryList = [String]()
    var quantList = [Int]()
    //list of program objects
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initList()
        // Do any additional setup after loading the view.
    }
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    func initList()//Have to connect to database here
    {
        entryList = ["Food1","Food2","Food3","Food4","Food5","Food6","Food7","Food8","Food9","Food10"]
        quantList = [1,2,3,4,5,6,7,8,9,10]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID") as! GListTableViewCell
        
        let thisEntry = entryList[indexPath.row]
        tableViewCell.fName.text = thisEntry
        tableViewCell.quantity.text = String(quantList[indexPath.row])
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editGListSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "editGListSegue"){
            let indexPath = self.entryTableView.indexPathForSelectedRow!
            let tableViewProg = segue.destination as? EditGListViewController
            tableViewProg!.fName = entryList[indexPath.row]
            tableViewProg!.userID = userID
            tableViewProg!.quant = quantList[indexPath.row]
            //these values will come from the database
            self.entryTableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
