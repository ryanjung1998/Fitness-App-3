//
//  Recipe.swift
//  Fitness App
//
//  Created by Fardin Mahid on 2022-12-05.
//

import Foundation


class Recipe{
    var creatorID:Int
    var recipeName: String
    var privacy:Bool = false
    var instructions:String
    var prepTime: String
    var totalCal: Int
    var totalProtien: Int
    var totalfat: Double
    var totalCarbs: Double
    
    //These threee should be calculated
    
    init(creatorID: Client, recipeName: String, instructions: String, prepTime: String, totalCal: Int, totalProtien: Int, totalfat: Double, totalCarbs: Double) {
        self.creatorID = creatorID.userID
        self.recipeName = recipeName
        self.instructions = instructions
        self.prepTime = prepTime
        self.totalCal = totalCal
        self.totalProtien = totalProtien
        self.totalfat = totalfat
        self.totalCarbs = totalCarbs
    }
    
    public func setPrivacy(p:Bool){
        self.privacy = p
    }
    
    //simple edit delete etc
    
    
}
