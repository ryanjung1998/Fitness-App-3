//
//  UI-Helper.swift
//  Fitness App
//
//  Created by Adrian Llonor on 2022-12-07.
//

import Foundation

// Prevent SQL injection
extension String { // Extend the string class to have this variable
    var isAlphanumeric: Bool {
        // If the string is non empty and contains only alphanumerics, then return true, otherwise false
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
}

// Sample data
func sampleInsert(db:DBHelper){
    let formatter1 = DateFormatter() // Format date as string
    formatter1.dateStyle = .short    // Formatting
    // Make master admin
    let master = User(ethnicity: "admin", countryOfResidence: "computer", gender: "machine", birthDay: formatter1.date(from: "12/7/22")!)
    master.userInDB(db: db) // Insert into database
    let masterAdmin = Admin(userToAdmin: master) // Make master an admin
    masterAdmin.adminInDB(db: db, adminToPromo: master.userID) // Insert into database
    
    
    // Make a client
    // First initialize as user
    let jojo = User(ethnicity: "American", countryOfResidence: "USA", gender: "Male", birthDay: formatter1.date(from: "12/08/99")!)
    jojo.userInDB(db: db)

    // Then turn into client
    let Joseph = Client(userToClient: jojo, protein: 130, carbohydrates: 50, fat: 55, weight: 145, sugar: 60, height: 170)
    Joseph.clientInDB(db: db)
    let firstFeedback = feedback(adminId: masterAdmin.adminId, clientID: Joseph.clientID, comments: "I am really liking this app!")
    firstFeedback.feedbackInDB(db: db)
    
    // First exercise
    let legs1 = Exercise(Name: "Squat", met: 45, creatorID: masterAdmin.adminId, cardioFlag: false, strengthFlag: true)
    legs1.exerciseInDB(db: db)
    // Muscles worked for the first exercise
    let legs1muscles = Muscles_Worked(Name: "Squat", creatorID: masterAdmin.adminId, muscle: "Quadriceps")
    legs1muscles.musclesWorkedInDB(db: db)
    // Equipment used for first exercise
    let legs1equip = Exercise_Equipment(name: "Squat", equipment_name: "Squat Rack and Barbell")
    legs1equip.exerciseEquipmentInDB(db: db)
    
    // Second exercise
    let legs2 = Exercise(Name: "Deadlift", met: 45, creatorID: masterAdmin.adminId, cardioFlag: false, strengthFlag: true)
    legs2.exerciseInDB(db: db)

    // Muscles worked for second exercise
    let legs2muscles = Muscles_Worked(Name: "Deadlift", creatorID: masterAdmin.adminId, muscle: "Hamstrings")
    legs2muscles.musclesWorkedInDB(db: db)

    // Equipment used for second exercise
    let legs2equip = Exercise_Equipment(name: "Deadlift", equipment_name: "Barbell")
    legs2equip.exerciseEquipmentInDB(db: db)

    
    // Third exercise
    let legs3 = Exercise(Name: "Hip Thrusts", met: 45, creatorID: masterAdmin.adminId, cardioFlag: false, strengthFlag: true)
    legs3.exerciseInDB(db: db)

    // Muscles worked for third exercise
    let legs3muscles = Muscles_Worked(Name: "Hip Thrusts", creatorID: masterAdmin.adminId, muscle: "Glutes")
    legs3muscles.musclesWorkedInDB(db: db)

    // Equipment used for third exercise
    let legs3equip = Exercise_Equipment(name: "Hip Thrusts", equipment_name: "Barbell")
    legs3equip.exerciseEquipmentInDB(db: db)

    // Creating a workout program called legDay
    let legDay = Workout_program(userID: Joseph.clientID, name: "Leg day", privacy: false)
    legDay.workoutProgramInDB(db: db)
    // Adding workout 1
    legDay.exercisesInProgramInDB(db: db, exercise: "Squat", pr: 225, weight: 135, reps: 12, sets: 3, time: 0, distance: 0)
    // Adding workout 2
    legDay.exercisesInProgramInDB(db: db, exercise: "Deadlift", pr: 250, weight: 150, reps: 8, sets: 3, time: 0, distance: 0)
    
    // Creating a workout that wants to remain private from other users
    let gluteDay = Workout_program(userID: Joseph.clientID, name: "Glute day", privacy: true)
    gluteDay.workoutProgramInDB(db: db)
    gluteDay.exercisesInProgramInDB(db: db, exercise: "Hip Thrusts", pr: 405, weight: 355, reps: 8, sets: 4, time: 0, distance: 0)
    
    // Make a journal entry
    let journalling = Journal_Entry(userID: Joseph.clientID, jDate: formatter1.date(from: "12/7/22")!, weight: 150, caloriesBurned: 500, quality: "Excellent", hours: 2)
    journalling.journalInDB(db: db)

    // Enter a performed entry into the DB
    let iDidThis = Performed(userID: Joseph.clientID, program_Name: legDay.name, perDate: journalling.jDate)
    iDidThis.performedInDB(db: db)
    
    // Making food using masterAdmin
    let food1 = Food(calories: 50, price: 2, fat: 14, carbohydrates: 15, protein: 50, sugar: 5, name: "Chicken", CreatorID: masterAdmin.adminId)
    let food2 = Food(calories: 50, price: 2, fat: 14, carbohydrates: 15, protein: 5, sugar: 5, name: "Cheese", CreatorID: masterAdmin.adminId)
    let food3 = Food(calories: 50, price: 2, fat: 14, carbohydrates: 15, protein: 2, sugar: 5, name: "Pita Bread", CreatorID: masterAdmin.adminId)
    food1.foodInDB(db: db)
    food2.foodInDB(db: db)
    food3.foodInDB(db: db)
    
    // Making a recipe
    let recipe1 = Recipe(creator: Joseph, recipeName: "Quesadilla", instructions: "Cook chicken fully then sprinkle cheese. Fold into the pita bread then toast.", prepTime: 15, totalCal: 1200, totalProtien: 57, totalfat: 42, totalCarbs: 45)
    recipe1.recipeInDB(db: db)
    // Adding the foods used to make this recipe
    recipe1.includedFoodInRecipeInDB(db: db, foodID: food1.foodID)
    recipe1.includedFoodInRecipeInDB(db: db, foodID: food2.foodID)
    recipe1.includedFoodInRecipeInDB(db: db, foodID: food3.foodID)
    
    let mealPlan = MealPlan(userID: Joseph.clientID, name: "Mexican", privacy: false)
    mealPlan.mealPlanInDB(db: db)
    mealPlan.mealConsistsOfInDB(db: db, recipeName: "Quesadilla", servings: 2)
    
    let groceryList = GroceryList(clientID: Joseph.clientID)
    groceryList.groceryListInDB(db: db)
    groceryList.onGroceryListInDB(db: db, foodNum: food1.foodID, quantity: 3)
    groceryList.onGroceryListInDB(db: db, foodNum: food2.foodID, quantity: 4)
    groceryList.onGroceryListInDB(db: db, foodNum: food3.foodID, quantity: 5)
}
