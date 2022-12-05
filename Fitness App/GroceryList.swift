//
//  GroceryList.swift
//  Fitness App
//
//  Created by Fardin Mahid on 2022-12-04.
//

import Foundation


class GroceryList{
    var clientID: Int
    var listID: Int
    
    init(client:Client) {
        self.clientID = client.userID
        self.listID = client.listID
        <#statements#>
    }
    
    public func insert(gL: GroceryList) ->Bool{
        //inserts into DB
        return true
    }
    
    public func edit(cliID:Client, change:String) -> Bool{
        //change the DB
        
        return true
    }
    
    public func delete(cliID:Client){
        
    }
    
}
