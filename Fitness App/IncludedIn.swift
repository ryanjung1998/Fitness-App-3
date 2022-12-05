//
//  IncludedIn.swift
//  Fitness App
//
//  Created by Fardin Mahid on 2022-12-05.
//

import Foundation


class IncludedIn{
    var recipeID : Int
    var creatorID : Int
    var FoodID : Int
    
    init(recipeID: Int, creatorID: Client, FoodID: Food) {
        self.recipeID = recipeID
        self.creatorID = creatorID.userID
        self.FoodID = FoodID.foodID
    }
    
    //Insert/Edit/Delete db stuffs
}
