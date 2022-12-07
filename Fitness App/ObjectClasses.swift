//
//  UserClass.swift
//  Fitness App
//
//  Created by Fardin Mahid on 2022-12-02.
//

import Foundation
import SQLite3


class User{
    final var userID :Int
    var ethnicity : String
    var countryOfResidence : String
    var gender : String
    var birthDay : Date
    static var counter : Int = 0
    
    init(ethnicity: String, countryOfResidence: String, gender: String, birthDay: Date) {
        //self.user = user
        /*
         userID will be a value not in the database
         so we would have to seach the database
         */
        self.ethnicity = ethnicity
        self.countryOfResidence = countryOfResidence
        self.gender = gender
        self.birthDay = birthDay
        self.userID = User.counter
        User.counter += 1 // for now
    }
}

class Client{
    //Since User ID already in the User class, we don't need to worry about it
    var clientID: Int
    var ethnicity: String
    var countryOfResidence : String
    var gender : String
    var birthDay : Date
    static var clientCounter : Int = 0
    var listID : Int
    var protein : Double
    var carbohydrates : Double
    var fat: Double
    var weight : Double
    var sugar : Double
    var height : Double
    
    init(userToClient: User, listID: Int, protein: Double, carbohydrates: Double, fat: Double, weight: Double, sugar: Double, height: Double) {
        self.clientID = userToClient.userID
        self.ethnicity = userToClient.ethnicity
        self.countryOfResidence = userToClient.countryOfResidence
        self.gender = userToClient.gender
        self.birthDay = userToClient.birthDay
        self.listID = listID
        self.protein = protein
        self.carbohydrates = carbohydrates
        self.fat = fat
        self.weight = weight
        self.sugar = sugar
        self.height = height
    }
}


//class Admin : User{
//    // Leaving empty for now until we figure out functions for it [TODO]
//}



class feedback{
    var adminId: Int
    var clientID: Int
    var comments:String
    
    init(adminId: Int, clientID: Int, comments: String) {
        self.adminId = adminId
        self.clientID = clientID
        self.comments = comments
    }
    
    //should show the feedback in UI if time allows
}


class GroceryList{ // Integrate on_grocery_list [TODO]
    var clientID: Int
    var listID: Int
    
    init(clientID: Int, listID: Int) {
        self.clientID = clientID
        self.listID = listID
    }
    
}



class Food{
    var foodID : Int
    var calories:Int
    var price: Double
    var carbohydrates:Double
    var protein: Double
    var sugar: Double
    var name: String
    var CreatorID: Int
    
    init(foodID: Int, calories: Int, price: Double, carbohydrates: Double, protein: Double, sugar: Double, name: String, CreatorID: Int) {
        self.foodID = foodID
        self.calories = calories
        self.price = price
        self.carbohydrates = carbohydrates
        self.protein = protein
        self.sugar = sugar
        self.name = name
        self.CreatorID = CreatorID
    }
    
    //Export Delete others for database
    
}



class MealPlan{ // Integrate meal_consists_of [TODO]
    var userID: Int
    var name: String
    var privacy: Bool = false
    
    init(userID: Int, name: String, privacy: Bool) {
        self.userID = userID
        self.name = name
        self.privacy = privacy
    }
    //insert edit, delete like all of them
}



class Recipe{ // Integrate IncludedIn [TODO]
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
        self.creatorID = creatorID.clientID
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

class Exercise{
    var Name: String
    var met: Int
    var creatorID: Int
    var cardioFlag: Bool
    var strengthFlag: Bool
    
    init(Name: String, met: Int, creatorID: Int, cardioFlag: Bool, strengthFlag: Bool) {
        self.Name = Name
        self.met = met
        self.creatorID = creatorID
        self.cardioFlag = cardioFlag
        self.strengthFlag = strengthFlag
    }
}

class Muscles_Worked{
    var Name: String
    var creatorID: Int
    var muscle: String
    
    init(Name: String, creatorID: Int, muscle: String) {
        self.Name = Name
        self.creatorID = creatorID
        self.muscle = muscle
    }
}

class Exercise_Equipment{
    var name: String
    var equipment_name: String
    
    init(name: String, equipment_name: String) {
        self.name = name
        self.equipment_name = equipment_name
    }
}

class Workout_program{ // Integrate program_includes_exercise [TODO]
    var userID: Int
    var name: String
    var privacy: Bool
    
    init(userID: Int, name: String, privacy: Bool) {
        self.userID = userID
        self.name = name
        self.privacy = privacy
    }
}

class Performed{
    var userID: Int
    var program_Name: String
    var perDate: Date
    
    init(userID: Int, program_Name: String, perDate: Date) {
        self.userID = userID
        self.program_Name = program_Name
        self.perDate = perDate
    }
}

class Journal_Entry{
    var userID: Int
    var jDate: Date
    var weight: Int
    var caloriesBurned: Int
    var quality: String
    var hours: Int
    
    init(userID: Int, jDate: Date, weight: Int, caloriesBurned: Int, quality: String, hours: Int) {
        self.userID = userID
        self.jDate = jDate
        self.weight = weight
        self.caloriesBurned = caloriesBurned
        self.quality = quality
        self.hours = hours
    }
}
