//
//  OnList.swift
//  Fitness App
//
//  Created by Fardin Mahid on 2022-12-04.
//

import Foundation


class OnList{
    var listID: Int
    var foodID: [Int]
    var clientID : Int
    var Quantity : Int = 0
    
    init(listID: Int,clientID:Client) {
        self.listID = listID
        self.clientID = clientID.userID
    }
    
    public func createList(foodList: [Food]){
        var i:Int = 0
        while(!foodList.isEmpty){
            if !self.foodID.contains(foodList[i].foodID){
                continue
            }
            self.foodID[i] = foodList[i].foodID
        }
    }
    
    //Instert delete edit functions that we can copy/paste
    
}
