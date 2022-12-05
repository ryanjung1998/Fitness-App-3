//
//  Food.swift
//  Fitness App
//
//  Created by Fardin Mahid on 2022-12-04.
//

import Foundation


class Food{
    var foodID : Int
    var calories:Int
    var price: Double
    var carbohydrates:Double
    var protien: Double
    var sugar: Double
    var name: String
    var CreatorID: Int
    
    init(foodID: Int, calories: Int, price: Double, carbohydrates: Double, protien: Double, sugar: Double, name: String, CreatorID: Admin) {
        self.foodID = foodID
        self.calories = calories
        self.price = price
        self.carbohydrates = carbohydrates
        self.protien = protien
        self.sugar = sugar
        self.name = name
        self.CreatorID = CreatorID.userID
    }
    
    //Export Delete others for database
    
}
