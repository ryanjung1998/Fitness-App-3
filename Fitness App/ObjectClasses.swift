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
        var db = DBHelper()
        
        self.ethnicity = ethnicity
        self.countryOfResidence = countryOfResidence
        self.gender = gender
        self.birthDay = birthDay
        self.userID = User.counter
        User.counter += 1 // Increment counter
        
    }
    // Insert a user into the database
    func userInDB(db:DBHelper){
        db.insertUser(UserID: self.userID, Birth_date: self.birthDay, Gender: self.gender, CountryOfResidence: self.countryOfResidence, Ethnicity: self.ethnicity)
    }
    
    func rmUserDB(db:DBHelper){
        db.delUser(id: self.userID)
    }
}

class Client{
    //Since User ID already in the User class, we don't need to worry about it
    var clientID: Int
    var ethnicity: String
    var countryOfResidence : String
    var gender : String
    var birthDay : Date
    var listID : Int
    var protein : Int
    var carbohydrates : Int
    var fat: Int
    var weight : Int
    var sugar : Int
    var height : Int
    
    init(userToClient: User, protein: Int, carbohydrates: Int, fat: Int, weight: Int, sugar: Int, height: Int) {
        self.clientID = userToClient.userID
        self.ethnicity = userToClient.ethnicity
        self.countryOfResidence = userToClient.countryOfResidence
        self.gender = userToClient.gender
        self.birthDay = userToClient.birthDay
        self.listID = userToClient.userID
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
    
    func rmClientDB(db:DBHelper){
        db.delClient(id: self.clientID)
    }
    
    func editProtien(db:DBHelper, Protein:Int){
        db.editClientProtein(usrID: self.clientID, Protien: Protein)
    }
    
    func editCarbs(db:DBHelper, Carbs:Int){
        db.editClientCarbs(usrID: self.clientID, carbs: Carbs)
    }
    
    func editFat(db:DBHelper, fat:Int){
        db.editClientFat(usrID: self.clientID, Fat: fat)
    }
    
    func editWeight(db:DBHelper, weightKG:Int){
        db.editClientWeight(usrID: self.clientID, val: weightKG)
        
    }
    
    func editSugar(db:DBHelper, sugar:Int){
        db.editClientSugar(usrID: self.clientID, val: sugar)
    }
    
    func editHeight(db:DBHelper, Height:Int){
        db.editClientHeight(usrID: self.clientID, val: Height)
    }
    
}


class Admin{
    var adminId: Int
    init(userToAdmin: User) {
        self.adminId = userToAdmin.userID
    }
    func adminInDB(db:DBHelper, adminToPromo:Int){ // Use this function to appoint a user to an admin
        db.insertAdmin(UserID: adminToPromo)
    }
    func rmAdminInDB(db:DBHelper, adminToRm:Int){ // Use this function to delete another admin from the Admin table
        db.delAdmin(id: adminToRm)
    }
}

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
    
    func rmClientDB(db:DBHelper){
        db.delFeedback(adminID: self.adminId, clientID: self.clientID)
    }
    
    //should show the feedback in UI if time allows
}

/* -------------------------------- FOOD -------------------------------- */

class GroceryList{
    var clientID: Int
    var listID: Int
    
    init(clientID: Int) {
        self.clientID = clientID
        self.listID = clientID // Make it the same as clientID
    }
    func groceryListInDB(db:DBHelper){
        db.insertGroceryList(ClientID: self.clientID, ListID: self.listID)
    }
    // When we put stuff in grocery list, we need food num [TODO]
    func onGroceryListInDB(db:DBHelper, foodNum: Int, quantity: Int){
        db.insertOnGroceryList(ListId: self.listID, FoodId: foodNum, Quantity: quantity, ClientID: self.clientID)
    }
    func rmGroceryListInDB(db:DBHelper){
        db.delGroceryList(clientID: self.clientID, listID: self.listID)
    }
    func rmOnGroceryListInDB(db:DBHelper, foodNum: Int){
        db.delOnGroceryList(listID: self.listID, foodID: foodNum, clientID: self.clientID)
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
    static var foodCounter : Int = 0

    
    init(calories: Int, price: Int, fat:Int, carbohydrates: Int, protein: Int, sugar: Int, name: String, CreatorID: Int) {
        self.foodID = Food.foodCounter
        Food.foodCounter += 1 // Increment counter
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
    
    func rmFoodInDB(db:DBHelper){
        db.delFood(foodID: self.foodID, creatorID: self.CreatorID)
    }
    
    func editPrice(db:DBHelper, price:Int){
        db.editFoodPrice(foodID: self.foodID, CreatrID: self.CreatorID, Price: price)
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
    func rmMealPlanInDB(db:DBHelper){
        db.delMealPlan(id: self.userID, name: self.name)
    }
    func rmMealConsistsOfInDB(db:DBHelper, recipe:String){
        db.delMealConsistsOf(mealName: self.name, recipeName: recipe)
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
    
    init(creator: Client, recipeName: String, instructions: String, prepTime: Int, totalCal: Int, totalProtien: Int, totalfat: Int, totalCarbs: Int) {
        self.creatorID = creator.clientID
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
    
    func rmRecipeInDB(db:DBHelper){
        db.delRecipe(creatorID: self.creatorID, recipeName: self.recipeName)
    }
    
    func rmIncludedFoodInRecipeInDB(db:DBHelper, food: Int){
        db.delIncludedIn(recipeID: self.recipeName, creatorID: self.creatorID, foodID: food)
    }
    
    func editPrivacy(db:DBHelper, priv:Bool){
        db.editRecipePriv(creatorID: self.creatorID, RName: self.recipeName, Priv: priv)
    }
    
    func editInstruction(db:DBHelper,Instruct:String){
        db.editRecipeInstructions(creatorID: self.creatorID, RName: self.recipeName, Instructions: Instruct )
    }
    
    func editPrepTime(db:DBHelper,Prep:Int){
        db.editRecipePrepTime(creatorID: self.creatorID, RName: self.recipeName, PT: Prep)
    }
    
    func editTCals(db:DBHelper,TCal:Int){
        db.editRecipeTotalCals(creatorID: self.creatorID, RName: self.recipeName, Totalcal: TCal)
    }
    
    func editTPro(db:DBHelper,TPro:Int){
        db.editRecipeTotalProtien(creatorID: self.creatorID, RName: self.recipeName, TotalPro: TPro)
    }
    
    func editTFat(db:DBHelper,TFat:Int){
        db.editRecipeTotalFat(creatorID: self.creatorID, RName: self.recipeName, Totalfat: TFat)
    }
    
    func editTCarbs(db:DBHelper,TCarbs:Int){
        db.editRecipeTotalCarbs(creatorID: self.creatorID, RName: self.recipeName, Totalcarbs: TCarbs)
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
    
    func rmExerciseInDB(db:DBHelper){
        db.delExercise(exName: self.Name, creatorId: self.creatorID)
    }
    
    func editMET(db: DBHelper, met:Int){
        db.editExerciseMET(name: self.Name, usrID: self.creatorID, MET: met)
    }
}

class Muscles_Worked{
    var Name: String // References exercise name
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
    func rmMusclesWorkedInDB(db:DBHelper){
        db.delMusclesWorked(exName: self.Name, creatorId: self.creatorID, muscle: self.muscle)
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
    func rmExerciseEquipmentInDB(db:DBHelper){
        db.delExerciseEquipment(exName: self.name, eqName: self.equipment_name)
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
    func exercisesInProgramInDB(db:DBHelper, exercise: String, pr: Int, weight: Int, reps: Int, sets: Int, time: Int, distance: Int){
        db.insertProIncEx(PName: self.name, EName: exercise, PersonalRecord: pr, Weight: weight, Repetitions: reps, Sets: sets, Time: time, Distance: distance, CreatorID: self.userID)
    }
    
    func rmWorkoutProgramInDB(db:DBHelper){
        db.delWorkoutProgram(userID: self.userID, programName: self.name)
    }
    
    func rmExercisesInProgramInDB(db:DBHelper, exercise: String){
        db.delProgramIncludesExercise(pname: self.name, ename: exercise, id: self.userID)
    }
    
    func editPrivacy(db:DBHelper, privacy:Bool){
        db.editWorkoutProgramPriv(usrID: self.userID, name: self.name, priv: privacy)
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
    
    func rmPerformedInDB(db:DBHelper){
        db.delPerformed(id: self.userID, programName: self.program_Name, perdate: self.perDate)
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
    
    func rmJournalInDB(db:DBHelper){
        db.delJournal(userID: self.userID, jdate: self.jDate)
    }
    
    
    func editWeight(db: DBHelper, weight:Int){
        db.editJournalEntWeight(UsrID: self.userID, JDate: self.jDate, val: weight)
    }
    
    func editCalBurned(db: DBHelper, Burned:Int){
        db.editJournalEntCalBurned(UsrID: self.userID, JDate: self.jDate, val: Burned)
    }
    
    func editQuality(db: DBHelper, quality:String){
        db.editJournalEntQuality(UsrID: self.userID, JDate: self.jDate, val: quality)
    }
    
    func editHours(db: DBHelper, Hours:Int){
        db.editJournalEntHours(UsrID: self.userID, JDate: self.jDate, val: Hours)
    }
    
    
}
