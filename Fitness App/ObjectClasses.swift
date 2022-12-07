//
//  UserClass.swift
//  Fitness App
//
//  Created by Fardin Mahid on 2022-12-02.
//

import Foundation
import SQLite3

/* -------------------------------- PEOPLE -------------------------------- */

class User{
    // Variables for the object
    final var userID :Int
    var ethnicity : String
    var countryOfResidence : String
    var gender : String
    var birthDay : Date
    static var counter : Int = 0
    
    // Initialize variables for the instance
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
        User.counter += 1 // Increment counter
    }
    // Insert a user into the database
    func userInDB(db:DBHelper){
        db.insertUser(Birth_date: self.birthDay, Gender: self.gender, CountryOfResidence: self.countryOfResidence, Ethnicity: self.ethnicity)
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
    var protein : Int
    var carbohydrates : Int
    var fat: Int
    var weight : Int
    var sugar : Int
    var height : Int
    
    init(userToClient: User, listID: Int, protein: Int, carbohydrates: Int, fat: Int, weight: Int, sugar: Int, height: Int) {
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
    
    func clientInDB(db:DBHelper){
        db.insertClient(UserID: self.clientID, Protein: self.protein, Carbohydrates: self.carbohydrates, Fat: self.fat, Weight: self.weight, Sugar: self.sugar, Height: self.height, ListID: self.listID)
    }
}


// [TODO] Make admin promotion function
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
    
    func feedbackInDB(db:DBHelper){
        db.insertFeedback(AdminID: self.adminId, ClientID: self.clientID, Comments: self.comments)
    }
    
    //should show the feedback in UI if time allows
}

/* -------------------------------- FOOD -------------------------------- */

class GroceryList{
    var clientID: Int
    var listID: Int
    
    init(clientID: Int, listID: Int) {
        self.clientID = clientID
        self.listID = listID
    }
    func groceryListInDB(db:DBHelper){
        db.insertGroceryList(ClientID: self.clientID, ListID: self.listID)
    }
    // When we put stuff in grocery list, we need food num [TODO]
    func onGroceryListInDB(db:DBHelper, foodNum: Int, quantity: Int){
        db.insertOnGroceryList(ListId: self.listID, FoodId: foodNum, Quantity: quantity, ClientID: self.clientID)
    }
    
}



class Food{
    var foodID : Int
    var calories:Int
    var price: Int
    var fat: Int
    var carbohydrates:Int
    var protein: Int
    var sugar: Int
    var name: String
    var CreatorID: Int
    
    init(foodID: Int, calories: Int, price: Int, fat:Int, carbohydrates: Int, protein: Int, sugar: Int, name: String, CreatorID: Int) {
        self.foodID = foodID
        self.calories = calories
        self.price = price
        self.fat = fat
        self.carbohydrates = carbohydrates
        self.protein = protein
        self.sugar = sugar
        self.name = name
        self.CreatorID = CreatorID
    }
    func foodInDB(db:DBHelper){
        db.insertFood(FoodID: self.foodID, Calories: self.calories, Price: self.price, Fat: self.fat, Carbohydrates: self.carbohydrates, Protein: self.protein, Sugar: self.sugar, Name: self.name, CreatorID: self.CreatorID)
    }
    
    // Make a food listing query [TODO]
    
    //Export Delete others for database
    
}



class MealPlan{
    var userID: Int
    var name: String
    var privacy: Bool = false
    
    init(userID: Int, name: String, privacy: Bool) {
        self.userID = userID
        self.name = name
        self.privacy = privacy
    }
    func mealPlanInDB(db:DBHelper){
        db.insertMealPlan(UserID: self.userID, Name: self.name, Privacy: self.privacy)
    }
    // When we want to add a meal, we also need the recipe [TODO]
    func mealConsistsOfInDB(db:DBHelper, recipeName: String, servings: Int){
        db.insertMealConsistsOf(MealName: self.name, RecipeName: recipeName, Servings: servings)
    }
    // [TODO] Make a method that will query for the recipes
    // addToGroceryList(db, MealPlanName, UserID)
}


class Recipe{
    var creatorID:Int
    var recipeName: String
    var privacy:Bool = false
    var instructions:String
    var prepTime: Int
    var totalCal: Int
    var totalProtien: Int
    var totalfat: Int
    var totalCarbs: Int
    
    //These threee should be calculated
    
    init(creatorID: Client, recipeName: String, instructions: String, prepTime: Int, totalCal: Int, totalProtien: Int, totalfat: Int, totalCarbs: Int) {
        self.creatorID = creatorID.clientID
        self.recipeName = recipeName
        self.instructions = instructions
        self.prepTime = prepTime
        self.totalCal = totalCal
        self.totalProtien = totalProtien
        self.totalfat = totalfat
        self.totalCarbs = totalCarbs
    }
    
    func recipeInDB(db:DBHelper){
        db.insertRecipe(CreatorId: self.creatorID, RecipeName: self.recipeName, Privacy: self.privacy, Instructions: self.instructions, PrepTime: self.prepTime, TotalCalories: self.totalCal, TotalProtein: self.totalProtien, TotalFat: self.totalfat, TotalCarbs: self.totalCarbs)
    }
    // When we want to add food, we need the foodID along with it [TODO]
    func includedFoodInRecipeInDB(db: DBHelper, foodID: Int){
        db.insertIncludedIn(RecipeID: self.recipeName, CreatorID: self.creatorID, FoodID: foodID)
    }
    //simple edit delete etc
    
    
    /* -------------------------------- MUSCLES -------------------------------- */
    
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
    func exerciseInDB(db:DBHelper){
        db.insertExercise(Name: self.Name, MET: self.met, CreatorID: self.creatorID, CardioFlag: self.cardioFlag, StrengthFlag: self.strengthFlag)
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
    func musclesWorkedInDB(db:DBHelper){
        db.insertMusclesWorked(Name: self.Name, CreatorID: self.creatorID, Muscle: self.muscle)
    }
}

class Exercise_Equipment{
    var name: String
    var equipment_name: String
    
    init(name: String, equipment_name: String) {
        self.name = name
        self.equipment_name = equipment_name
    }
    func exerciseEquipmentInDB(db:DBHelper){
        db.insertExerciseEquipment(Name: self.name, Equipment_Name: self.equipment_name)
    }
}

class Workout_program{
    var userID: Int
    var name: String
    var privacy: Bool
    
    init(userID: Int, name: String, privacy: Bool) {
        self.userID = userID
        self.name = name
        self.privacy = privacy
    }
    func workoutProgramInDB(db:DBHelper){
        db.insertWorkoutProgram(UserID: self.userID, Name: self.name, Privacy: self.privacy)
    }
    
    // This one takes in a lot
    func exercisesInProgramInDB(db:DBHelper, exercise: String, pr: Int, weight: Int, reps: Int, sets: Int, time: Int, distance: Int, creatorID: Int){
        db.insertProIncEx(PName: self.name, EName: exercise, PersonalRecord: pr, Weight: weight, Repetitions: reps, Sets: sets, Time: time, Distance: distance, CreatorID: creatorID)
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
    func performedInDB(db:DBHelper){
        db.insertPerformed(UserID: self.userID, Program_name: self.program_Name, PerDate: self.perDate)
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
    
    func journalInDB(db:DBHelper){
        db.insertJournal(UserID: self.userID, JDate: self.jDate, Weight: self.weight, CaloriesBurned: self.caloriesBurned, Quality: self.quality, Hours: self.hours)
    }
}
