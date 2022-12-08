//
//  DBHelper.swift
//  Fitness App
//
//  Created by Adrian Llonor on 2022-11-28.
//

import Foundation
import SQLite3

class DBHelper{
    var db: OpaquePointer? // A pointer for database
    var path: String = "myDB.sqlite"// The DB name
    init() {
        self.db = createDB()
    }
    
    func createDB() -> OpaquePointer?{
        let filePath = try! FileManager.default.url(for: .documentDirectory,in: .userDomainMask, appropriateFor: nil, create: false).appendingPathExtension(path)
        
        var db: OpaquePointer? = nil
        
        if sqlite3_open(filePath.path, &db) != SQLITE_OK {
            print("Error in creating database.")
            return nil
        } else{
//            print("Database has been created with \(path)")
            return db
        }
    }
    func deleteDefaults(){ // Code for deleting
        delFood(foodID: 1, creatorID: 1)
        delRecipe(creatorID: 1, recipeName: "Keto Recipe")
        delMealConsistsOf(mealName: "Keto Diet", recipeName: "Keto Recipe")
        delMealPlan(id: 2, name: "Keto Diet 2")
        delFeedback(adminID: 1, clientID: 2)
        delUser(id: 1)
//        delAdmin(id: 1)
        delClient(id: 1)

        delExercise(exName: "Bench Press", creatorId: 1)
        delMusclesWorked(exName: "Bench Press", creatorId: 1, muscle: "Chest")
        delExerciseEquipment(exName: "Bench Press", eqName: "Bench and Barbell")
        delWorkoutProgram(userID: 1, programName: "Chest Day")
        delProgramIncludesExercise(pname: "Chest Day", ename: "Bench Press", id: 1)
        delGroceryList(clientID: 1, listID: 2)
        delOnGroceryList(listID: 2, foodID: 1, clientID: 2)
        delIncludedIn(recipeID: "Keto Recipe", creatorID: 1, foodID: 1)
        let jdstring = "12/6/22" // Set to a date in the database
        let formatter1 = DateFormatter() // Format date as string
        formatter1.dateStyle = .short    // Formatting
        delJournal(userID: 1, jdate: formatter1.date(from: jdstring)!)
        delPerformed(id: 1, programName: "Chest Day", perdate: formatter1.date(from: jdstring)!)
    }
    
    // ------------ DEFAULT FUNCTIONS --------------- //
    func insertDefaults(){
        insertAdmin(UserID: 0)
        insertUser(UserID: 1, Birth_date: Date(), Gender: "Male", CountryOfResidence: "Canada", Ethnicity: "Asian")
        insertClient(UserID: 1, Protein: 2, Carbohydrates: 3, Fat: 4, Weight: 5, Sugar: 6, Height: 7, ListID: 8)
        insertExercise(Name: "Bench Press", MET: 45, CreatorID: 1, CardioFlag: false, StrengthFlag: true)
        insertExerciseEquipment(Name: "Bench Press", Equipment_Name: "Bench and Barbell")
        insertWorkoutProgram(UserID: 1, Name: "Chest Day", Privacy: false)
        insertMusclesWorked(Name: "Bench Press", CreatorID: 1, Muscle: "Chest")
        //         [TODO] Just passing in today's date until we find a way to give it a real date
        insertPerformed(UserID: 1, Program_name: "Chest Day", PerDate: Date())
        insertJournal(UserID: 1, JDate: Date(), Weight: 115, CaloriesBurned: 150, Quality: "Good", Hours: 1)
        insertProIncEx(PName: "Chest Day", EName:"Bench Press", PersonalRecord: 225, Weight: 135, Repetitions: 12, Sets: 3, Time: 60, Distance: 0, CreatorID: 1)
        
        
        
        insertFeedback(AdminID: 1, ClientID: 2, Comments: "You are the best")
        insertGroceryList(ClientID: 1, ListID: 2)
        insertMealPlan(UserID: 2, Name: "Keto Diet", Privacy: true)
        insertMealConsistsOf(MealName: "Keto Diet", RecipeName: "Keto Recipe", Servings: 5)
        insertOnGroceryList(ListId: 2, FoodId: 1, Quantity: 3, ClientID: 2)
        insertRecipe(CreatorId: 1, RecipeName: "Keto Recipe", Privacy: false, Instructions: "Make any meal and replace rice with quinoa", PrepTime: 5, TotalCalories: 350, TotalProtein: 30, TotalFat: 15, TotalCarbs: 5)
        insertFood(FoodID: 1, Calories: 8, Price: 1, Fat: 0, Carbohydrates: 5, Protein: 8, Sugar: 2, Name: "Quinoa", CreatorID: 1)
        insertIncludedIn(RecipeID: "Keto Recipe", CreatorID: 1, FoodID: 1)
    }
    
    func editTuples(){
            editClientProtein(usrID: 1, Protien: 13)
            editClientFat(usrID: 1, Fat: 14)
            editClientSugar(usrID: 1, val: 15)
            editClientHeight(usrID: 1, val: 16)
            editClientWeight(usrID: 1, val: 17)
            editClientCarbs(usrID: 1, carbs: 18)
            editExerciseMET(name: "Bench Press" , usrID: 1, MET: 41)
            editWorkoutProgramPriv(usrID: 1, name: "Chest Day" , priv: false)
            editprogramIncludesExerciseRep(PName: "Chest Day", EName: "Bench Press", CreatorID: 1, reps: 6)
            editprogramIncludesExercisePR(PName: "Chest Day", EName: "Bench Press", CreatorID: 1, val: 300)
            editprogramIncludesExerciseSets(PName: "Chest Day", EName: "Bench Press", CreatorID: 1, val: 7)
            editprogramIncludesExerciseWeight(PName: "Chest Day", EName: "Bench Press", CreatorID: 1, val: 136)
            editprogramIncludesExerciseDistance(PName: "Chest Day", EName: "Bench Press", CreatorID: 1, val: 1)
            editJournalEntHours(UsrID: 1, JDate: Date(), val: 2)
            editJournalEntWeight(UsrID: 1, JDate: Date(), val: 25)
            editJournalEntQuality(UsrID: 1, JDate: Date(), val: "Shit")
            editJournalEntCalBurned(UsrID: 1, JDate: Date(), val: 15)
            editConsistsOf(mealName: "Keto Diet", reicpeName: "Keto Recipe", Servings: 7)
            editMealPlanPriv(UserId: 2, name: "Keto Diet 2", priv: false)
            editOnGroceryList(listID: 2, ClientID: 2, foodID: 1, quantity: 8)
            editRecipePriv(creatorID: 1, RName: "Keto Recipe", Priv: true)
            editRecipePrepTime(creatorID: 1, RName: "Keto Recipe", PT: 10)
            editRecipeTotalFat(creatorID: 1, RName: "Keto Recipe", Totalfat: 55)
            editRecipeTotalCals(creatorID: 1, RName: "Keto Recipe", Totalcal: 56)
            editRecipeTotalCarbs(creatorID: 1, RName: "Keto Recipe", Totalcarbs: 57)
            editRecipeTotalProtien(creatorID: 1, RName: "Keto Recipe", TotalPro: 58)
            editRecipeInstructions(creatorID: 1, RName: "Keto Recipe", Instructions: "Throw Stuff into a bowl and start Mixing")
            editFoodPrice(foodID: 1, CreatrID: 1, Price: 17)
    //FoodID: 1, Calories: 8, Price: 1, Fat: 0, Carbohydrates: 5, Protein: 8, Sugar: 2, Name: "Quinoa", CreatorID: 1
    }


    
    // ---------------- INSERTING TUPLES --------------- //
    
    // Creating an insertion in the database
    func insertUser(UserID: Int, Birth_date: Date, Gender: String, CountryOfResidence: String, Ethnicity: String){
        // Make the query
        let query = "INSERT INTO USER (UserID, Birth_date, Gender, CountryOfResidence, Ethnicity) VALUES (?,?, ?, ?, ?)"
        // Make an opaquepointer for sqlite
        var statement : OpaquePointer? = nil
        
        // Prepare the statement and see if it passes
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_int(statement, 1, Int32(UserID))
            let formatter1 = DateFormatter() // Format date as string
            formatter1.dateStyle = .short    // Formatting
            sqlite3_bind_text(statement, 2, ((formatter1.string(from: Birth_date)) as NSString).utf8String, -1, nil) // Pass in date as a string
            sqlite3_bind_text(statement, 3, (Gender as NSString).utf8String, -1, nil) // Pass in string
            sqlite3_bind_text(statement, 4, (CountryOfResidence as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 5, (Ethnicity as NSString).utf8String, -1, nil)
            
            if sqlite3_step(statement) == SQLITE_DONE { // If it can successfully use inputs, then print success
                print("User inserted successfully")
            } else {
                print("User data unable to be inserted")
            }
        } else {
            print("User query is not as per requirement")
        }
    }
    func insertAdmin(UserID: Int){
        let query = "INSERT INTO ADMIN (UserID) VALUES (?)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_int(statement, 1, Int32(UserID))
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Admin inserted successfully")
            } else {
                print("Admin data unable to be inserted")
            }
        } else {
            print("Admin query is not as per requirement")
        }
    }
    func insertClient(UserID :Int, Protein: Int, Carbohydrates: Int, Fat: Int, Weight: Int, Sugar: Int, Height: Int, ListID: Int){
        let query = "INSERT INTO CLIENT (UserID, Protein, Carbohydrates, Fat, Weight, Sugar, Height, ListID) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Insert into SQL table
            sqlite3_bind_int(statement, 1, Int32(UserID)) // Double check
            sqlite3_bind_int(statement, 2, Int32(Protein))
            sqlite3_bind_int(statement, 3, Int32(Carbohydrates))
            sqlite3_bind_int(statement, 4, Int32(Fat))
            sqlite3_bind_int(statement, 5, Int32(Weight))
            sqlite3_bind_int(statement, 6, Int32(Sugar))
            sqlite3_bind_int(statement, 7, Int32(Height))
            sqlite3_bind_int(statement, 8, Int32(ListID))
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Client inserted successfully")
            } else {
                print("Client data unable to be inserted")
            }
        } else {
            print("Client query is not as per requirement")
        }
    }
    
    func insertPerformed(UserID: Int, Program_name: String, PerDate: Date){
        let query = "INSERT INTO PERFORMED (UserID, Program_name, PerDate) VALUES (?, ?, ?)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Insert into SQL table
            sqlite3_bind_int(statement, 1, Int32(UserID)) // Double check
            sqlite3_bind_text(statement, 2, (Program_name as NSString).utf8String, -1, nil)
            let formatter1 = DateFormatter() // Format date as string
            formatter1.dateStyle = .short    // Formatting
            sqlite3_bind_text(statement, 3, ((formatter1.string(from: PerDate)) as NSString).utf8String, -1, nil)
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Performed inserted successfully")
            } else {
                print("Performed data unable to be inserted")
            }
        } else {
            print("Performed query is not as per requirement")
        }
    }
    
    // In SQLite, bools are 0 for false and 1 for true
    func insertExercise(Name: String, MET: Int, CreatorID: Int, CardioFlag: Bool, StrengthFlag: Bool){
        let query = "INSERT INTO EXERCISE (Name, MET, CreatorID, CardioFlag, StrengthFlag) VALUES (?, ?, ?, ?, ?)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Insert into SQL table
            sqlite3_bind_text(statement, 1, (Name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 2, Int32(MET)) // Double check
            sqlite3_bind_int(statement, 3, Int32(CreatorID))
            let cardio = CardioFlag ? 1 : 0
            sqlite3_bind_int(statement, 4, Int32(cardio))
            let strength = StrengthFlag ? 1 : 0
            sqlite3_bind_int(statement, 5, Int32(strength))
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Exercise inserted successfully")
            } else {
                print("Exercise data unable to be inserted")
            }
        } else {
            print("Exercise query is not as per requirement")
        }
    }
    func insertMusclesWorked(Name: String, CreatorID: Int, Muscle: String){
        let query = "INSERT INTO MUSCLES_WORKED (Name, CreatorID, Muscle) VALUES (?, ?, ?)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Insert into SQL table
            sqlite3_bind_text(statement, 1, (Name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 2, Int32(CreatorID))
            sqlite3_bind_text(statement, 3, (Muscle as NSString).utf8String, -1, nil)
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Muscles_Worked inserted successfully")
            } else {
                print("Muscles_Worked data unable to be inserted")
            }
        } else {
            print("Muscles_Worked query is not as per requirement")
        }
    }
    func insertExerciseEquipment(Name: String, Equipment_Name: String){
        let query = "INSERT INTO EXERCISE_EQUIPMENT (Name, Equipment_Name) VALUES (?, ?)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Insert into SQL table
            sqlite3_bind_text(statement, 1, (Name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (Equipment_Name as NSString).utf8String, -1, nil)
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Exercise_Equipment inserted successfully")
            } else {
                print("Exercise_Equipment data unable to be inserted")
            }
        } else {
            print("Exercise_Equipment query is not as per requirement")
        }
    }
    func insertWorkoutProgram(UserID: Int, Name: String, Privacy: Bool){
        let query = "INSERT INTO WORKOUT_PROGRAM (UserID, Name, Privacy) VALUES (?, ?, ?)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Insert into SQL table
            sqlite3_bind_int(statement, 1, Int32(UserID)) // Double check
            sqlite3_bind_text(statement, 2, (Name as NSString).utf8String, -1, nil)
            let priv = Privacy ? 1 : 0
            sqlite3_bind_int(statement, 3, Int32(priv))
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Workout_Program inserted successfully")
            } else {
                print("Workout_Program data unable to be inserted")
            }
        } else {
            print("Workout_Program query is not as per requirement")
        }
    }
    
    func insertProIncEx(PName: String, EName: String,PersonalRecord: Int, Weight: Int, Repetitions: Int, Sets: Int, Time: Int, Distance: Int, CreatorID: Int){
        let query = "INSERT INTO PROGRAM_INCLUDES_EXERCISE (PName, EName, PersonalRecord, Weight, Repetitions, Sets, Time, Distance, CreatorID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Insert into SQL table
            sqlite3_bind_text(statement, 1, (PName as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (EName as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 3, Int32(PersonalRecord)) // Double check
            sqlite3_bind_int(statement, 4, Int32(Weight)) // Double check
            sqlite3_bind_int(statement, 5, Int32(Repetitions)) // Double check
            sqlite3_bind_int(statement, 6, Int32(Sets)) // Double check
            sqlite3_bind_int(statement, 7, Int32(Time)) // Double check
            sqlite3_bind_int(statement, 8, Int32(Distance)) // Double check
            sqlite3_bind_int(statement, 9, Int32(CreatorID)) // Double check
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Program_Includes_Exercise inserted successfully")
            } else {
                print("Program_Includes_Exercise data unable to be inserted")
            }
        } else {
            print("Program_Includes_Exercise query is not as per requirement")
        }
    }
    func insertJournal(UserID: Int, JDate: Date, Weight: Int, CaloriesBurned: Int, Quality: String, Hours: Int){
        let query = "INSERT INTO JOURNAL_ENTRY (UserID, JDate, Weight, CaloriesBurned, Quality, Hours) VALUES (?, ?, ?, ?, ?, ?)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Insert into SQL table
            sqlite3_bind_int(statement, 1, Int32(UserID))
            let formatter1 = DateFormatter() // Format date as string
            formatter1.dateStyle = .short    // Formatting
            sqlite3_bind_text(statement, 2, ((formatter1.string(from: JDate)) as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 3, Int32(Weight))
            sqlite3_bind_int(statement, 4, Int32(CaloriesBurned))
            sqlite3_bind_text(statement, 5, (Quality as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 6, Int32(Hours))
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Journal_entry inserted successfully")
            } else {
                print("Journal_entry data unable to be inserted")
            }
        } else {
            print("Journal_entry query is not as per requirement")
        }
    }
    
    
    
    func insertFeedback(AdminID: Int, ClientID: Int, Comments: String){
        let query = "INSERT INTO FEEDBACK (AdminID, ClientID, Comments) VALUES (?, ?, ?)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Insert into SQL table
            sqlite3_bind_int(statement, 1, Int32(AdminID))
            sqlite3_bind_int(statement, 2, Int32(ClientID))
            sqlite3_bind_text(statement, 3, (Comments as NSString).utf8String, -1, nil)
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Feedback inserted successfully")
            } else {
                print("Feedback data unable to be inserted")
            }
        } else {
            print("Feedback query is not as per requirement")
        }
    }
    
    func insertGroceryList(ClientID: Int, ListID: Int){
        let query = "INSERT INTO GROCERY_LIST (ClientID, ListID) VALUES (?, ?)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Insert into SQL table
            sqlite3_bind_int(statement, 1, Int32(ClientID))
            sqlite3_bind_int(statement, 2, Int32(ListID))
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Grocery_list inserted successfully")
            } else {
                print("Grocery_list data unable to be inserted")
            }
        } else {
            print("Grocery_list query is not as per requirement")
        }
    }
    
    func insertMealPlan(UserID: Int, Name: String, Privacy: Bool){
        let query = "INSERT INTO MEAL_PLAN (UserID, Name, Privacy) VALUES (?, ?, ?)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Insert into SQL table
            sqlite3_bind_int(statement, 1, Int32(UserID))
            sqlite3_bind_text(statement, 2, (Name as NSString).utf8String, -1, nil)
            let priv = Privacy ? 1 : 0
            sqlite3_bind_int(statement, 3, Int32(priv))
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Meal_plan inserted successfully")
            } else {
                print("Meal_plan data unable to be inserted")
            }
        } else {
            print("Meal_plan query is not as per requirement")
        }
    }
    
    func insertMealConsistsOf(MealName: String, RecipeName: String, Servings: Int){
        let query = "INSERT INTO MEAL_CONSISTS_OF (MealName, RecipeName, Servings) VALUES (?, ?, ?)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Insert into SQL table
            sqlite3_bind_text(statement, 1, (MealName as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (RecipeName as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 3, Int32(Servings))
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Meal_consists_of inserted successfully")
            } else {
                print("Meal_consists_of data unable to be inserted")
            }
        } else {
            print("Meal_consists_of query is not as per requirement")
        }
    }
    
    func insertOnGroceryList(ListId: Int, FoodId: Int, Quantity: Int, ClientID: Int){
        let query = "INSERT INTO ON_GROCERY_LIST (ListId, FoodId, Quantity, ClientID) VALUES (?, ?, ?, ?)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Insert into SQL table
            sqlite3_bind_int(statement, 1, Int32(ListId))
            sqlite3_bind_int(statement, 2, Int32(FoodId))
            sqlite3_bind_int(statement, 3, Int32(Quantity))
            sqlite3_bind_int(statement, 4, Int32(ClientID))
            if sqlite3_step(statement) == SQLITE_DONE {
                print("On_Grocery_List inserted successfully")
            } else {
                print("On_Grocery_List data unable to be inserted")
            }
        } else {
            print("On_Grocery_List query is not as per requirement")
        }
    }
    
    func insertRecipe(CreatorId: Int,RecipeName: String,Privacy: Bool,Instructions: String,PrepTime: Int,TotalCalories: Int,TotalProtein: Int,TotalFat: Int, TotalCarbs: Int){
        let query = "INSERT INTO RECIPE (CreatorId, RecipeName, Privacy, Instructions, PrepTime, TotalCalories, TotalProtein, TotalFat, TotalCarbs) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Insert into SQL table
            sqlite3_bind_int(statement, 1, Int32(CreatorId))
            sqlite3_bind_text(statement, 2, (RecipeName as NSString).utf8String, -1, nil)
            let priv = Privacy ? 1 : 0
            sqlite3_bind_int(statement, 3, Int32(priv))
            sqlite3_bind_text(statement, 4, (Instructions as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 5, Int32(PrepTime))
            sqlite3_bind_int(statement, 6, Int32(TotalCalories))
            sqlite3_bind_int(statement, 7, Int32(TotalProtein))
            sqlite3_bind_int(statement, 8, Int32(TotalFat))
            sqlite3_bind_int(statement, 9, Int32(TotalCarbs))
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Recipe inserted successfully")
            } else {
                print("Recipe data unable to be inserted")
            }
        } else {
            print("Recipe query is not as per requirement")
        }
    }
    
    func insertFood(FoodID: Int, Calories: Int, Price: Int, Fat: Int,Carbohydrates: Int, Protein: Int, Sugar: Int, Name: String, CreatorID: Int){
        let query = "INSERT INTO FOOD (FoodID, Calories, Price, Fat, Carbohydrates, Protein, Sugar, Name, CreatorID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Insert into SQL table
            sqlite3_bind_int(statement, 1, Int32(FoodID))
            sqlite3_bind_int(statement, 2, Int32(Calories))
            sqlite3_bind_int(statement, 3, Int32(Price))
            sqlite3_bind_int(statement, 4, Int32(Fat))
            sqlite3_bind_int(statement, 5, Int32(Carbohydrates))
            sqlite3_bind_int(statement, 6, Int32(Protein))
            sqlite3_bind_int(statement, 7, Int32(Sugar))
            sqlite3_bind_text(statement, 8, (Name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 9, Int32(CreatorID))
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Food inserted successfully")
            } else {
                print("Food data unable to be inserted")
            }
        } else {
            print("Food query is not as per requirement")
        }
    }
    func insertIncludedIn(RecipeID: String, CreatorID: Int, FoodID: Int){
        let query = "INSERT INTO INCLUDED_IN (RecipeID, CreatorID, FoodID) VALUES (?, ?, ?)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            // Insert into SQL table
            sqlite3_bind_text(statement, 1, (RecipeID as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 2, Int32(CreatorID))
            sqlite3_bind_int(statement, 3, Int32(FoodID))
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Included_in inserted successfully")
            } else {
                print("Included_in data unable to be inserted")
            }
        } else {
            print("Included_in query is not as per requirement")
        }
    }
    
    // -----------------------------------EDIT FUCNTIONS------------------------------------- ///
    
    /*--------- Client------------*/
    
    func editClientProtein(usrID: Int, Protien:Int){
        let query:String = "UPDATE CLIENT SET Protein = \(Protien) WHERE UserID = \(usrID) "
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Protien has been made")
            }
            else{
                print("The edit to Protien has not been made")
                
            }
            
        }
        else{
            print("Edit not considered")
        }
    }
    func editClientCarbs(usrID: Int, carbs:Int){
        let query:String = "UPDATE CLIENT SET Carbohydrates = \(carbs) WHERE UserID = \(usrID)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Carbohydrates has been made")
            }
            else{
                print("The edit to Carbohydrates has not been made")
                
            }
        }
    }
    
    func editClientFat(usrID: Int, Fat:Int){
        let query:String = "UPDATE CLIENT SET Fat = \(Fat) WHERE UserID = \(usrID)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Fat has been made")
            }
            else{
                print("The edit to Fat has not been made")
                
            }
        }
    }
    
    func editClientWeight(usrID: Int, val:Int){
        let query:String = "UPDATE CLIENT SET Weight = \(val) WHERE UserID = \(usrID)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Weight has been made")
            }
            else{
                print("The edit to Weight has not been made")
                
            }
        }
    }
    
    func editClientSugar(usrID: Int, val:Int){
        let query:String = "UPDATE CLIENT SET Sugar = \(val) WHERE UserID = \(usrID)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Weight has been made")
            }
            else{
                print("The edit to Weight has not been made")
                
            }
        }
    }
    
    func editClientHeight(usrID: Int, val:Int){
        let query:String = "UPDATE CLIENT SET Height = \(val) WHERE UserID = \(usrID)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Height has been made")
            }
            else{
                print("The edit to Height has not been made")
                
            }
        }
    }
    
    

    //UserID: 1, Name: "Chest Day", Privacy: false
    //"Bench Press", MET: 45, CreatorID: 1
    
    /*--------Excercise Stuffs---------------*/
    
    func editExerciseMET(name: String, usrID: Int, MET:Int ){
        let query:String = "UPDATE EXERCISE SET MET = \(MET) WHERE CreatorID = \(usrID) AND Name = '\(name)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to MET has been made")
            }
            else{
                print("The edit to MET has not been made")
                
            }
        }
        
    }
    
    
    func editWorkoutProgramPriv(usrID:Int,name:String,priv:Bool){
        let tableVal = priv ? 1 : 0
        let query:String = "UPDATE WORKOUT_PROGRAM SET Privacy = \(tableVal) WHERE UserID = \(usrID) AND Name = '\(name)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to WorkoutProgram's Privacy has been made")
            }
            else{
                print("The edit to Workout Program's Privacy has not been made")
                
            }
        }
        
    }
    /*---ProgramInclEx Edits-----------*/
    func editprogramIncludesExerciseRep(PName :String, EName: String, CreatorID: Int, reps:Int){
        let query:String = "UPDATE PROGRAM_INCLUDES_EXERCISE SET Repetitions = \(reps) WHERE CreatorID = \(CreatorID) AND PName = '\(PName)' AND EName = '\(EName)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Repetitions in INCLUDES EXCERCISE has been made")
            }
            else{
                print("The edit to Repetitions in INCLUDES EXCERCISE  has not been made")
                
            }
        }
    }
    

    
    func editprogramIncludesExercisePR(PName :String, EName: String, CreatorID: Int, val:Int){
        let query:String = "UPDATE PROGRAM_INCLUDES_EXERCISE SET PersonalRecord = \(val) WHERE CreatorID = \(CreatorID) AND PName = '\(PName)' AND EName = '\(EName)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to PR in INCLUDES EXCERCISE has been made")
            }
            else{
                print("The edit to PR in INCLUDES EXCERCISE  has not been made")
                
            }
        }
        
    }
    
    
    func editprogramIncludesExerciseWeight(PName :String, EName: String, CreatorID: Int, val:Int){
        let query:String = "UPDATE PROGRAM_INCLUDES_EXERCISE SET Weight = \(val) WHERE CreatorID = \(CreatorID) AND PName = '\(PName)' AND EName = '\(EName)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Weight in INCLUDES EXCERCISE has been made")
            }
            else{
                print("The edit to Weight in INCLUDES EXCERCISE  has not been made")
                
            }
        }
        
    }
    
    
    func editprogramIncludesExerciseSets(PName :String, EName: String, CreatorID: Int, val:Int){
        let query:String = "UPDATE PROGRAM_INCLUDES_EXERCISE SET Sets = \(val) WHERE CreatorID = \(CreatorID) AND PName = '\(PName)' AND EName = '\(EName)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Sets in INCLUDES EXCERCISE has been made")
            }
            else{
                print("The edit to Sets in INCLUDES EXCERCISE  has not been made")
                
            }
        }
        
    }
    
    func editprogramIncludesExerciseTime(PName :String, EName: String, CreatorID: Int, val:Int){
        let query:String = "UPDATE PROGRAM_INCLUDES_EXERCISE SET Time = \(val) WHERE CreatorID = \(CreatorID) AND PName = '\(PName)' AND EName = '\(EName)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Time in INCLUDES EXCERCISE has been made")
            }
            else{
                print("The edit to Time in INCLUDES EXCERCISE  has not been made")
                
            }
        }
        
    }
    
    func editprogramIncludesExerciseDistance(PName :String, EName: String, CreatorID: Int, val:Int){
        let query:String = "UPDATE PROGRAM_INCLUDES_EXERCISE SET Distance = \(val) WHERE CreatorID = \(CreatorID) AND PName = '\(PName)' AND EName = '\(EName)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Distance in INCLUDES EXCERCISE has been made")
            }
            else{
                print("The edit to Distance in INCLUDES EXCERCISE  has not been made")
                
            }
        }
        
    }
    
    func editJournalEntWeight(UsrID:Int, JDate:Date, val:Int){
        let stringDate = JDate.formatted(date: .numeric, time: .omitted)
        let query:String = "UPDATE JOURNAL_ENTRY SET Weight = \(val) WHERE UserID = \(UsrID) AND JDate = \(stringDate)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Weight in Journal Entry has been made")
            }
            else{
                print("The edit to Weight in Journal Entry  has not been made")
                
            }
        }
        
    }
    
    func editJournalEntCalBurned(UsrID:Int, JDate:Date, val:Int){
        let stringDate = JDate.formatted(date: .numeric, time: .omitted)
        let query:String = "UPDATE JOURNAL_ENTRY SET CaloriesBurned = \(val) WHERE UserID = \(UsrID) AND JDate = \(stringDate)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to CaloriesBurned in Journal Entry has been made")
            }
            else{
                print("The edit to Clories in Journal Entry  has not been made")
                
            }
        }
        
    }
    
    func editJournalEntQuality(UsrID:Int, JDate:Date, val:String){
        let stringDate = JDate.formatted(date: .numeric, time: .omitted)
        let query:String = "UPDATE JOURNAL_ENTRY SET Quality = '\(val)' WHERE UserID = \(UsrID) AND JDate = \(stringDate)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Quality in Journal Entry has been made")
            }
            else{
                print("The edit to Quality in Journal Entry  has not been made")
                
            }
        }
        
    }
    
    
    func editJournalEntHours(UsrID:Int, JDate:Date, val:Int){
        let stringDate = JDate.formatted(date: .numeric, time: .omitted)
        let query:String = "UPDATE JOURNAL_ENTRY SET Hours = \(val) WHERE UserID = \(UsrID) AND JDate = \(stringDate)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Hours in Journal Entry has been made")
            }
            else{
                print("The edit to Hours in Journal Entry  has not been made")
                
            }
        }
        
    }
    
    // ------------- FOODSTUFFS EDIT ------------- //
    
    func editConsistsOf(mealName:String, reicpeName:String, Servings: Int){
        let query:String = "UPDATE MEAL_CONSISTS_OF SET Servings = \(Servings) WHERE MealName = '\(mealName)' AND RecipeName = '\(reicpeName)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Servings in MEAL_CONSISTS_OF has been made")
            }
            else{
                print("The edit to Servings in MEAL_CONSISTS_OF  has not been made")
                
            }
        }
    }
    
    func editMealPlanPriv(UserId:Int,name:String, priv:Bool){
        let tableVal = priv ? 1 : 0
        let query:String = "UPDATE MEAL_PLAN SET Privacy = \(tableVal) WHERE UserID = \(UserId) AND Name = '\(name)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Privacy in MealPan has been made")
            }
            else{
                print("The edit to Privacy in MealPlan  has not been made")
                
            }
        }
        else{print("Syntax error probs LMAO")}
        
    }
    
    

    func editOnGroceryList(listID:Int,ClientID:Int,foodID:Int,quantity:Int){
        let query:String = "UPDATE ON_GROCERY_LIST SET Quantity = \(quantity) WHERE ListID = \(listID) AND ClientID = \(ClientID) AND FoodID = \(foodID)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to quantity on ON_GROCERY_LIST has been made")
            }
            else{
                print("The edit to quantity on ON_GROCERY_LIST  has not been made")
                
            }
        }
    }
    
    func editRecipePriv(creatorID:Int,RName:String,Priv:Bool){
        let tableVal = Priv ? 1 : 0
        let query:String = "UPDATE RECIPE SET Privacy = \(tableVal) WHERE CreatorID = \(creatorID) AND RecipeName = '\(RName)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Privacy on Recipe has been made")
            }
            else{
                print("The edit to Privacy on Recipe  has not been made")
                
            }
        }
    }
    
    func editRecipeInstructions(creatorID:Int,RName:String,Instructions:String){
        let query:String = "UPDATE RECIPE SET Instructions = '\(Instructions)' WHERE CreatorID = \(creatorID) AND RecipeName = '\(RName)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Instructions on Recipe has been made")
            }
            else{
                print("The edit to Instructions on Recipe  has not been made")
                
            }
        }
    }
    
    func editRecipePrepTime(creatorID:Int,RName:String,PT:Int){
        let query:String = "UPDATE RECIPE SET PrepTime = \(PT) WHERE CreatorID = \(creatorID) AND RecipeName = '\(RName)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to PrepTime on Recipe has been made")
            }
            else{
                print("The edit to PrepTime on Recipe  has not been made")
                
            }
        }
    }
    
    func editRecipeTotalCals(creatorID:Int,RName:String,Totalcal:Int){
        let query:String = "UPDATE RECIPE SET TotalCalories = \(Totalcal) WHERE CreatorID = \(creatorID) AND RecipeName = '\(RName)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to TotalCalories on Recipe has been made")
            }
            else{
                print("The edit to TotalCalories on Recipe  has not been made")
                
            }
        }
    }
    
    func editRecipeTotalProtien(creatorID:Int,RName:String,TotalPro:Int){
        let query:String = "UPDATE RECIPE SET TotalProtein = \(TotalPro) WHERE CreatorID = \(creatorID) AND RecipeName = '\(RName)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to TotalProtein on Recipe has been made")
            }
            else{
                print("The edit to TotalProtein on Recipe  has not been made")
                
            }
        }
    }
    
    func editRecipeTotalFat(creatorID:Int,RName:String,Totalfat:Int){
        let query:String = "UPDATE RECIPE SET TotalFat = \(Totalfat) WHERE CreatorID = \(creatorID) AND RecipeName = '\(RName)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to TotalFat on Recipe has been made")
            }
            else{
                print("The edit to TotalFat on Recipe  has not been made")
                
            }
        }
    }
    
    func editRecipeTotalCarbs(creatorID:Int,RName:String,Totalcarbs:Int){
        let query:String = "UPDATE RECIPE SET TotalCarbs = \(Totalcarbs) WHERE CreatorID = \(creatorID) AND RecipeName = '\(RName)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to TotalCarbs on Recipe has been made")
            }
            else{
                print("The edit to TotalCarbs on Recipe  has not been made")
                
            }
        }
    }
    
    func editFoodPrice(foodID:Int, CreatrID:Int, Price:Int){
        let query:String = "UPDATE FOOD SET Price = \(Price) WHERE CreatorID = \(CreatrID) AND FoodID = \(foodID)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("The edit to Price in Food has been made")
            }
            else{
                print("The edit to Price in Food  has not been made")
                
            }
        }
    }
    
    //Absolutley NO REASON to dit anything else in food for now

    
    // ---------------- CREATING TABLES --------------- //
    // Create the entire database
    func createDefaults(){
        // Give query
        let createUser = "CREATE TABLE IF NOT EXISTS USER(UserID INTEGER PRIMARY KEY NOT NULL, Birth_date DATE NOT NULL, Gender VARCHAR(10), CountryOfResidence VARCHAR(10), Ethnicity VARCHAR(10));"
        // Make statement for sqlite
        var statement : OpaquePointer? = nil
        
        // prepare the statement
        if sqlite3_prepare_v2(self.db, createUser, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{ // if it goes through, print success
                print("Created user successfully") // Remove later
            } else {
                print("User table creation failed") // Remove later
            }
        } else {
            print("Preparation for user table failed") // Remove later
        }
        
        let createAdmin = "CREATE TABLE IF NOT EXISTS ADMIN(UserID INTEGER PRIMARY KEY NOT NULL, FOREIGN KEY (UserID) REFERENCES USER (UserID));"
        if sqlite3_prepare_v2(self.db, createAdmin, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created admin successfully") // Remove later
            } else {
                print("Admin table creation failed") // Remove later
            }
        } else {
            print("Preparation for admin table failed") // Remove later
        }
        
        let createClient = "CREATE TABLE IF NOT EXISTS CLIENT (UserID INT NOT NULL, Protein INT, Carbohydrates INT, Fat INT, Weight INT,Sugar INT, Height INT, ListID INT, PRIMARY KEY (UserID),FOREIGN KEY (UserID) REFERENCES USER(UserID), FOREIGN KEY (ListID) REFERENCES GROCERY_LIST(ListID));"
        if sqlite3_prepare_v2(self.db, createClient, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created client successfully") // Remove later
            } else {
                print("Client table creation failed") // Remove later
            }
        } else {
            print("Preparation for client table failed") // Remove later
        }
        
        let createPerformed = "CREATE TABLE IF NOT EXISTS PERFORMED (UserID   INT   NOT NULL,Program_Name   VARCHAR(15)   NOT NULL,PerDate   DATE   NOT NULL,PRIMARY KEY (UserID, Program_Name, PerDate),FOREIGN KEY (UserID) REFERENCES CLIENT(UserID) ON DELETE CASCADE, FOREIGN KEY (Program_Name) REFERENCES WORKOUT_PROGRAM(Name) ON DELETE CASCADE,FOREIGN KEY (PerDate) REFERENCES JOURNAL_ENTRY(Date));"
        if sqlite3_prepare_v2(self.db, createPerformed, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created performed successfully") // Remove later
            } else {
                print("Performed table creation failed") // Remove later
            }
        } else {
            print("Preparation for performed table failed") // Remove later
        }
        
        
        let createExercise = "CREATE TABLE IF NOT EXISTS EXERCISE (Name   VARCHAR(15)   NOT NULL,MET   INT   NOT NULL,CreatorID   INT   NOT NULL,CardioFlag   BOOLEAN,StrengthFlag   BOOLEAN,PRIMARY KEY (Name, CreatorID),FOREIGN KEY (Name) REFERENCES EXERCISE_EQUIPMENT(Name),FOREIGN KEY (CreatorID) REFERENCES ADMIN(UserID));"
        if sqlite3_prepare_v2(self.db, createExercise, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created exercise successfully") // Remove later
            } else {
                print("Exercise table creation failed") // Remove later
            }
        } else {
            print("Preparation for exercise table failed") // Remove later
        }
        
        
        let createMusclesWorked = "CREATE TABLE IF NOT EXISTS MUSCLES_WORKED (Name VARCHAR(15) NOT NULL,CreatorID INT NOT NULL,Muscle VARCHAR(15),PRIMARY KEY (Name, CreatorID, Muscle),FOREIGN KEY (Name) REFERENCES EXERCISE(Name), FOREIGN KEY (CreatorID) REFERENCES EXERCISE(CreatorID) );"
        if sqlite3_prepare_v2(self.db, createMusclesWorked, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created muscles_worked successfully") // Remove later
            } else {
                print("muscles_worked table creation failed") // Remove later
            }
        } else {
            print("Preparation for muscles_worked table failed") // Remove later
        }
        
        
        let createExerciseEquipment = "CREATE TABLE IF NOT EXISTS EXERCISE_EQUIPMENT (Name   VARCHAR(15)   NOT NULL,Equipment_name   VARCHAR(15)   NOT NULL,PRIMARY KEY (Name, Equipment_name),FOREIGN KEY (Name) REFERENCES EXERCISE(Name));"
        if sqlite3_prepare_v2(self.db, createExerciseEquipment, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created EXERCISE_EQUIPMENT successfully") // Remove later
            } else {
                print("EXERCISE_EQUIPMENT table creation failed") // Remove later
            }
        } else {
            print("Preparation for EXERCISE_EQUIPMENT table failed") // Remove later
        }
        
        
        let createWorkoutProgram = "CREATE TABLE IF NOT EXISTS WORKOUT_PROGRAM (UserID   INT   NOT NULL,Name   VARCHAR(15)   NOT NULL,Privacy   BOOLEAN, PRIMARY KEY (UserID, Name), FOREIGN KEY(UserID) REFERENCES CLIENT(UserID) );"
        if sqlite3_prepare_v2(self.db, createWorkoutProgram, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created WORKOUT_PROGRAM successfully") // Remove later
            } else {
                print("WORKOUT_PROGRAM table creation failed") // Remove later
            }
        } else {
            print("Preparation for WORKOUT_PROGRAM table failed") // Remove later
        }
        
        
        let createProgramIncExercise = "CREATE TABLE IF NOT EXISTS PROGRAM_INCLUDES_EXERCISE (PName   VARCHAR(15)   NOT NULL,EName   VARCHAR(15)   NOT NULL,PersonalRecord   INT,Weight   INT,Repetitions   INT,Sets   INT,Time   INT,Distance   INT,CreatorID   INT   NOT NULL,PRIMARY KEY (PName, EName, CreatorID),FOREIGN KEY (PName) REFERENCES WORKOUT_PROGRAM(Name),FOREIGN KEY (EName) REFERENCES EXERCISE(Name),FOREIGN KEY (CreatorID) REFERENCES USER (UserID) );"
        if sqlite3_prepare_v2(self.db, createProgramIncExercise, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created PROGRAM_INCLUDES_EXERCISE successfully") // Remove later
            } else {
                print("PROGRAM_INCLUDES_EXERCISE table creation failed") // Remove later
            }
        } else {
            print("Preparation for PROGRAM_INCLUDES_EXERCISE table failed") // Remove later
        }
        
        
        let createJournalEntry = "CREATE TABLE IF NOT EXISTS JOURNAL_ENTRY (UserID   INT   NOT NULL,JDate   DATE   NOT NULL,Weight   INT,CaloriesBurned   INT,Quality   VARCHAR(5),Hours   INT,PRIMARY KEY (UserID, JDate),FOREIGN KEY (UserID) REFERENCES CLIENT(UserID) ON DELETE CASCADE);"
        if sqlite3_prepare_v2(self.db, createJournalEntry, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created JOURNAL_ENTRY successfully") // Remove later
            } else {
                print("JOURNAL_ENTRY table creation failed") // Remove later
            }
        } else {
            print("Preparation for JOURNAL_ENTRY table failed") // Remove later
        }
        
        
        let createFeedback = "CREATE TABLE IF NOT EXISTS FEEDBACK (AdminID   INT   NOT NULL,ClientID   INT   NOT NULL,Comments   VARCHAR(30)   NOT NULL,PRIMARY KEY (AdminID, ClientID),FOREIGN KEY (AdminID) REFERENCES ADMIN(UserID),FOREIGN KEY (ClientID) REFERENCES CLIENT(UserID) );"
        if sqlite3_prepare_v2(self.db, createFeedback, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created FEEDBACK successfully") // Remove later
            } else {
                print("FEEDBACK table creation failed") // Remove later
            }
        } else {
            print("Preparation for FEEDBACK table failed") // Remove later
        }
        
        
        let createGroceryList = "CREATE TABLE IF NOT EXISTS GROCERY_LIST (ClientID   INT   NOT NULL,ListID   INT   NOT NULL,PRIMARY KEY (ClientID, ListID),FOREIGN KEY  (ClientID) REFERENCES CLIENT(UserID) ON DELETE CASCADE,FOREIGN KEY (ListID) REFERENCES CLIENT(ListID) ON DELETE CASCADE);"
        if sqlite3_prepare_v2(self.db, createGroceryList, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created GROCERY_LIST successfully") // Remove later
            } else {
                print("GROCERY_LIST table creation failed") // Remove later
            }
        } else {
            print("Preparation for GROCERY_LIST table failed") // Remove later
        }
        
        
        let createMealPlan = "CREATE TABLE IF NOT EXISTS MEAL_PLAN (UserID   INT   NOT NULL,Name   VARCHAR(15),Privacy   BOOLEAN,PRIMARY KEY (UserID, Name),FOREIGN KEY (UserID) REFERENCES USER(UserID) ON DELETE CASCADE);"
        if sqlite3_prepare_v2(self.db, createMealPlan, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created MEAL_PLAN successfully") // Remove later
            } else {
                print("MEAL_PLAN table creation failed") // Remove later
            }
        } else {
            print("Preparation for MEAL_PLAN table failed") // Remove later
        }
        
        
        let createMealConsistsOf = "CREATE TABLE IF NOT EXISTS MEAL_CONSISTS_OF (MealName   VARCHAR(15)   NOT NULL,RecipeName   VARCHAR(15)   NOT NULL,Servings   INT   NOT NULL,PRIMARY KEY (MealName, RecipeName),FOREIGN KEY (MealName) REFERENCES MEAL_PLAN(Name) ON DELETE CASCADE,FOREIGN KEY (RecipeName) REFERENCES RECIPE(RecipeName) );"
        if sqlite3_prepare_v2(self.db, createMealConsistsOf, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created MEAL_CONSISTS_OF successfully") // Remove later
            } else {
                print("MEAL_CONSISTS_OF table creation failed") // Remove later
            }
        } else {
            print("Preparation for MEAL_CONSISTS_OF table failed") // Remove later
        }
        
        
        let createOnGroceryList = "CREATE TABLE IF NOT EXISTS ON_GROCERY_LIST (ListId   INT   NOT NULL,FoodId   INT   NOT NULL,Quantity   INT   NOT  NULL,ClientID   INT   NOT NULL,PRIMARY KEY (ListID, FoodID, ClientID),FOREIGN KEY (ListID) REFERENCES GROCERY_LIST(ListID) ON DELETE CASCADE,FOREIGN KEY (FoodID) REFERENCES FOOD(FoodID) ON DELETE CASCADE,FOREIGN KEY (ClientID) REFERENCES GROCERY_LIST(ClientID) ON DELETE CASCADE);"
        if sqlite3_prepare_v2(self.db, createOnGroceryList, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created ON_GROCERY_LIST successfully") // Remove later
            } else {
                print("ON_GROCERY_LIST table creation failed") // Remove later
            }
        } else {
            print("Preparation for ON_GROCERY_LIST table failed") // Remove later
        }
        
        
        let createRecipe = "CREATE TABLE IF NOT EXISTS RECIPE (CreatorId   INT   NOT NULL,RecipeName   VARCHAR(15)   NOT NULL,Privacy   BOOLEAN,Instructions   VARCHAR(30),PrepTime   INT,TotalCalories   INT,TotalProtein   INT,TotalFat   INT,TotalCarbs   INT,PRIMARY KEY (CreatorID, RecipeName),FOREIGN KEY (CreatorID) REFERENCES USER(UserID) );"
        if sqlite3_prepare_v2(self.db, createRecipe, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created RECIPE successfully") // Remove later
            } else {
                print("RECIPE table creation failed") // Remove later
            }
        } else {
            print("Preparation for RECIPE table failed") // Remove later
        }
        
        
        let createFood = "CREATE TABLE IF NOT EXISTS FOOD (FoodID   INT   NOT NULL,Calories   INT,Price   INT,Fat   INT,Carbohydrates   INT,Protein   INT,Sugar   INT,Name   VARCHAR(15)   NOT NULL,CreatorID   INT   NOT NULL,PRIMARY KEY (FoodID, CreatorID),UNIQUE (Name),FOREIGN KEY (CreatorID) REFERENCES ADMIN(UserID) );"
        if sqlite3_prepare_v2(self.db, createFood, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created FOOD successfully") // Remove later
            } else {
                print("FOOD table creation failed") // Remove later
            }
        } else {
            print("Preparation for FOOD table failed") // Remove later
        }
        
        
        let createIncludedIn = "CREATE TABLE IF NOT EXISTS INCLUDED_IN (RecipeID   VARCHAR(15)   NOT NULL,CreatorID   INT   NOT NULL,FoodID   INT   NOT NULL,PRIMARY KEY (RecipeID, CreatorID, FoodID),FOREIGN KEY (RecipeID) REFERENCES RECIPE(RecipeName) ON DELETE CASCADE,FOREIGN KEY (CreatorID) REFERENCES RECIPE(CreatorID) ON DELETE CASCADE,FOREIGN KEY (FoodID) REFERENCES FOOD(FoodID) ON DELETE CASCADE);"
        if sqlite3_prepare_v2(self.db, createIncludedIn, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created INCLUDED_IN successfully") // Remove later
            } else {
                print("INCLUDED_IN table creation failed") // Remove later
            }
        } else {
            print("Preparation for INCLUDED_IN table failed") // Remove later
        }
    }
    
    
    
    // ---------------- REMOVING TUPLES --------------- //
        
    func delUser(id: Int){
        let query = "DELETE from USER where UserID = \(id)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("User \(id) deletion success")
            } else {
                print("Could not delete \(id)")
            }
        }
    }
    
    func delAdmin(id: Int){
        let query = "DELETE FROM ADMIN WHERE UserID = \(id)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Admin \(id) deletion success")
            } else {
                print("Could not delete admin \(id)")
            }
        }
    }

    func delClient(id: Int){
        let query = "DELETE FROM CLIENT WHERE UserID = \(id)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Client \(id) deletion success")
            } else {
                print("Could not delete client \(id)")
            }
        }
    }
    
    
    func delPerformed(id: Int, programName: String, perdate: Date){
        let stringDate = perdate.formatted(date: .numeric, time: .omitted) // Trim date
        let query = "DELETE FROM PERFORMED WHERE UserID = \(id) AND Program_Name = '\(programName)' AND PerDate = '\(stringDate)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Performed \(programName) deletion success")
            } else {
                print("Could not delete performed \(programName)")
            }
        }
    }
    
    func delExercise(exName: String, creatorId: Int){
        let query = "DELETE FROM EXERCISE WHERE Name = '\(exName)' AND CreatorID = \(creatorId)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("\(exName) deletion success")
            } else {
                print("Could not delete \(exName)")
            }
        }
    }
    
    func delMusclesWorked(exName: String, creatorId: Int, muscle: String){
        let query = "DELETE FROM MUSCLES_WORKED WHERE Name = '\(exName)' AND CreatorID = \(creatorId) AND Muscle = '\(muscle)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("\(muscle) deletion success")
            } else {
                print("Could not delete \(muscle)")
            }
        }
    }
    
    func delExerciseEquipment(exName: String, eqName: String){
        let query = "DELETE FROM EXERCISE_EQUIPMENT WHERE Name = '\(exName)' AND Equipment_Name = '\(eqName)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("\(exName) with \(eqName) deletion success")
            } else {
                print("Could not delete \(exName) with \(eqName)")
            }
        }
    }

    func delWorkoutProgram(userID: Int, programName: String){
        let query = "DELETE FROM WORKOUT_PROGRAM WHERE UserID = \(userID) AND Name = '\(programName)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("\(programName) deletion success")
            } else {
                print("Could not delete \(programName)")
            }
        }
    }
    
    func delProgramIncludesExercise(pname: String, ename: String, id: Int){
        let query = " DELETE FROM PROGRAM_INCLUDES_EXERCISE WHERE PName = '\(pname)' AND EName = '\(ename)' AND CreatorID = \(id);"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("\(ename) in \(pname) deletion success")
            } else {
                print("Could not delete \(ename) in \(pname)")
            }
        }
    }
    
    func delJournal(userID: Int, jdate: Date){
        let stringDate = jdate.formatted(date: .numeric, time: .omitted)
        let query = "DELETE FROM JOURNAL_ENTRY WHERE UserID = \(userID) AND JDate = '\(stringDate)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Journal deletion success")
            } else {
                print("Could not delete journal")
            }
        }
    }
    
    func delFeedback(adminID: Int, clientID: Int){
        let query = "DELETE FROM FEEDBACK WHERE AdminID = \(adminID) AND ClientID = \(clientID);"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Feedback deletion success")
            } else {
                print("Could not delete feedback")
            }
        }
    }

    func delGroceryList(clientID: Int, listID: Int){
        let query = "DELETE FROM GROCERY_LIST WHERE ClientID = \(clientID) and ListID = \(listID)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Grocery list deletion success")
            } else {
                print("Could not delete grocery list")
            }
        }
    }
    
    func delMealPlan(id: Int, name: String){
        let query = "DELETE FROM MEAL_PLAN WHERE UserID = \(id) AND Name = '\(name)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("\(name) deletion success")
            } else {
                print("Could not delete \(name)")
            }
        }
    }
    
    func delMealConsistsOf(mealName: String, recipeName: String){
        let query = "DELETE FROM MEAL_CONSISTS_OF WHERE MealName = '\(mealName)' AND RecipeName = '\(recipeName)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("\(mealName) from \(recipeName) deletion success")
            } else {
                print("Could not delete \(mealName) from \(recipeName)")
            }
        }
    }

    func delOnGroceryList(listID: Int, foodID: Int, clientID: Int){
        let query = "DELETE FROM ON_GROCERY_LIST WHERE ListID = \(listID) AND FoodID = \(foodID) AND ClientID = \(clientID)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Food on grocery list deletion success")
            } else {
                print("Could not delete food from grocery list")
            }
        }
    }
    
    func delRecipe(creatorID: Int, recipeName: String){
        let query = "DELETE FROM RECIPE WHERE CreatorID = \(creatorID) AND RecipeName = '\(recipeName)'"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("\(recipeName) deletion success")
            } else {
                print("Could not delete \(recipeName)")
            }
        }
    }
    
    func delFood(foodID: Int, creatorID: Int){
        let query = "DELETE FROM FOOD WHERE FoodID = \(foodID) AND CreatorID = \(creatorID)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Food deletion success")
            } else {
                print("Could not delete food")
            }
        }
    }

    func delIncludedIn(recipeID: String, creatorID: Int, foodID: Int){
        let query = "DELETE FROM INCLUDED_IN WHERE RecipeID = '\(recipeID)' AND CreatorID = \(creatorID) AND FoodID = \(foodID)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Food in \(recipeID) deletion success")
            } else {
                print("Could not delete food in \(recipeID)")
            }
        }
    }
    
    // ---------------- QUERIES --------------- //

    func getClientProfile(userID: Int) -> [String]{
        let query = "SELECT U.Birth_date, U.Gender, U.CountryOfResidence, U.Ethnicity, C.Protein, C.Carbohydrates, C.Fat, C.Weight, C.Sugar, C.Height FROM USER AS U, CLIENT AS C WHERE U.UserID = \(userID) AND U.UserID = C.UserID;" // Should return one client
        var statement : OpaquePointer? = nil
        var sShowData :Array<String>
        sShowData = []
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            while sqlite3_step(statement) == SQLITE_ROW {
                sShowData.append(String(cString: sqlite3_column_text(statement, Int32(0)))) // Birthday
                sShowData.append(String(cString: sqlite3_column_text(statement, Int32(1)))) // Gender
                sShowData.append(String(cString: sqlite3_column_text(statement, Int32(2)))) // Country
                sShowData.append(String(cString: sqlite3_column_text(statement, Int32(3)))) // Ethnicity
                sShowData.append(String(cString: sqlite3_column_text(statement, Int32(4)))) // Protein
                sShowData.append(String(cString: sqlite3_column_text(statement, Int32(5)))) // Carbohydrates
                sShowData.append(String(cString: sqlite3_column_text(statement, Int32(6)))) // Fat
                sShowData.append(String(cString: sqlite3_column_text(statement, Int32(7)))) // Weight
                sShowData.append(String(cString: sqlite3_column_text(statement, Int32(8)))) // Sugar
                sShowData.append(String(cString: sqlite3_column_text(statement, Int32(9)))) // Height
            }
        sqlite3_finalize(statement)

        } else{
            print("Query incorrect syntax")
        }
        return sShowData
    }
    
    func getJournalEntries(userID: Int) -> [[String]]{
        let query = "SELECT * FROM JOURNAL_ENTRY WHERE UserID = \(userID);"
        var statement : OpaquePointer? = nil
        var sShowData :Array<Array<String>>
        sShowData = []
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            var oneEntry:Array<String>
            while sqlite3_step(statement) == SQLITE_ROW {
                oneEntry = []
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(1)))) // Date
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(2)))) // Weight
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(3)))) // Calories
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(4)))) // Workout quality
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(5)))) // Sleep hours
                sShowData.append(oneEntry)
            }
        sqlite3_finalize(statement)

        } else{
            print("Query incorrect syntax")
        }
        return sShowData
    }
    
    func getFoodsInGroceryList(userID: Int) -> [[String]]{ // Return Food name and quantity
        let query = "SELECT F.Name, O.Quantity FROM ON_GROCERY_LIST AS O, FOOD as F WHERE O.FoodId = F.FoodID AND O.ClientID = \(userID);"
        var statement : OpaquePointer? = nil
        var sShowData :Array<Array<String>>
        sShowData = []
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            var oneEntry:Array<String>
            while sqlite3_step(statement) == SQLITE_ROW { // Since we expect one, we will just pull the first that we get
                oneEntry = []
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(0)))) // Name
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(1)))) // Quantity
                sShowData.append(oneEntry)
            }
        sqlite3_finalize(statement)

        } else{
            print("Query incorrect syntax")
        }
        return sShowData
    }
    
    func getVisibleMealPlans(userID: Int) -> [[String]]{ // Return meal plan name and creator id
        let query = "SELECT M.Name, M.UserID FROM MEAL_PLAN AS M WHERE (M.UserID = \(userID) OR M.Privacy = 0);"
        var statement : OpaquePointer? = nil
        var sShowData :Array<Array<String>>
        sShowData = []
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            var oneEntry:Array<String>
            while sqlite3_step(statement) == SQLITE_ROW { // Since we expect one, we will just pull the first that we get
                oneEntry = []
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(0)))) // Name
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(1)))) // UserID
                sShowData.append(oneEntry)
            }
        sqlite3_finalize(statement)

        } else{
            print("Query incorrect syntax")
        }
        return sShowData
    }

    // [TODO] Will have to be called when they click on a meal plan actually
    func getRecipesInMealPlan(planName: String) -> [[String]]{ // Return recipe name and quantity
        let query = "SELECT M.RecipeName, M.Servings FROM MEAL_CONSISTS_OF AS M, RECIPE AS R WHERE M.MealName = '\(planName)'"
        var statement : OpaquePointer? = nil
        var sShowData :Array<Array<String>>
        sShowData = []
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            var oneEntry:Array<String>
            while sqlite3_step(statement) == SQLITE_ROW { // Since we expect one, we will just pull the first that we get
                oneEntry = []
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(0)))) // Name
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(1)))) // Quantity
                sShowData.append(oneEntry)
            }
        sqlite3_finalize(statement)

        } else{
            print("Query incorrect syntax")
        }
        return sShowData
    }
    
    func getRecipes(userID: Int) -> [[String]]{ // Return recipe name and creator id
        let query = "SELECT R.RecipeName, R.CreatorId FROM RECIPE AS R WHERE (R.CreatorId = \(userID) OR R.Privacy = 0);"
        var statement : OpaquePointer? = nil
        var sShowData :Array<Array<String>>
        sShowData = []
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            var oneEntry:Array<String>
            while sqlite3_step(statement) == SQLITE_ROW { // Since we expect one, we will just pull the first that we get
                oneEntry = []
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(0)))) // Name
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(1)))) // UserID
                sShowData.append(oneEntry)
            }
        sqlite3_finalize(statement)

        } else{
            print("Query incorrect syntax")
        }
        return sShowData
    }
    
    // [TODO] Will have to be called when they click on a Recipe > Specific Recipe
    func getDetailsOfRecipe(recipeName: String) -> [[String]]{ // Return id, prep, cal, pro, fat, carb, instructions
        let query = "SELECT R.CreatorId, R.PrepTime, R.TotalCalories, R.TotalProtein, R.TotalFat, R.TotalCarbs, R.Instructions FROM RECIPE AS R WHERE R.RecipeName = '\(recipeName)'"
        var statement : OpaquePointer? = nil
        var sShowData :Array<Array<String>>
        sShowData = []
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            var oneEntry:Array<String>
            while sqlite3_step(statement) == SQLITE_ROW { // Since we expect one, we will just pull the first that we get
                oneEntry = []
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(0)))) // id
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(1)))) // prep
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(2)))) // cal
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(3)))) // pro
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(4)))) // fat
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(5)))) // carb
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(6)))) // instr
                sShowData.append(oneEntry)
            }
        sqlite3_finalize(statement)

        } else{
            print("Query incorrect syntax")
        }
        return sShowData
    }
    
    func getWorkoutPrograms(userID: Int) -> [[String]]{ // Return program name
        let query = "SELECT W.Name FROM WORKOUT_PROGRAM AS W WHERE (W.UserID = \(userID) OR W.Privacy = 0);"
        var statement : OpaquePointer? = nil
        var sShowData :Array<Array<String>>
        sShowData = []
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            var oneEntry:Array<String>
            while sqlite3_step(statement) == SQLITE_ROW {
                oneEntry = []
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(0)))) // Name
                sShowData.append(oneEntry)
            }
        sqlite3_finalize(statement)

        } else{
            print("Query incorrect syntax")
        }
        return sShowData
    }
    
    // [TODO] Will have to be called when they click on a a program's name
    func getProgramDetails (programName: String) -> [[String]]{ // Return an ex name, r, s, dur
        let query = "SELECT P.EName, P.Repetitions, P.Sets, P.Time FROM PROGRAM_INCLUDES_EXERCISE AS P WHERE P.PName = '\(programName)'"
        var statement : OpaquePointer? = nil
        var sShowData :Array<Array<String>>
        sShowData = []
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            var oneEntry:Array<String>
            while sqlite3_step(statement) == SQLITE_ROW { // Since we expect one, we will just pull the first that we get
                oneEntry = []
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(0)))) // Name
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(1)))) // Reps
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(2)))) // Sets
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(3)))) // Duration
                sShowData.append(oneEntry)
            }
        sqlite3_finalize(statement)

        } else{
            print("Query incorrect syntax")
        }
        return sShowData
    }
    
    // [TODO] Will have to be called when they click on an exercise's name
    func getExerciseDetails(exerciseName: String, programName: String) -> [[String]]{ // Return r, s, pr, weight, dur, dis
        let query = "SELECT P.Repetitions, P.Sets, P.PersonalRecord, P.Weight, P.Time, P.Distance FROM PROGRAM_INCLUDES_EXERCISE AS P WHERE P.PName = '\(programName)' AND P.EName = '\(exerciseName)'"
        var statement : OpaquePointer? = nil
        var sShowData :Array<Array<String>>
        sShowData = []
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            var oneEntry:Array<String>
            while sqlite3_step(statement) == SQLITE_ROW { // Since we expect one, we will just pull the first that we get
                oneEntry = []
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(0)))) // Reps
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(1)))) // Sets
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(2)))) // PR
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(3)))) // Weight
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(4)))) // Duration
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(5)))) // Distance
                sShowData.append(oneEntry)
            }
        sqlite3_finalize(statement)

        } else{
            print("Query incorrect syntax")
        }
        return sShowData
    }
    
    func getExercises(userID: Int) -> [[String]]{ // Return program name
        let query = "SELECT E.Name FROM EXERCISE AS E"
        var statement : OpaquePointer? = nil
        var sShowData :Array<Array<String>>
        sShowData = []
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            var oneEntry:Array<String>
            while sqlite3_step(statement) == SQLITE_ROW {
                oneEntry = []
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(0)))) // Name
                sShowData.append(oneEntry)
            }
        sqlite3_finalize(statement)

        } else{
            print("Query incorrect syntax")
        }
        return sShowData
    }
    
    // [TODO] Will have to be called when they click on an exercise's name to get the details
    // When getting the bool, we need to convert 1 to Yes and 0 to No
    func getExerciseDetailsWithEquip(eName: String) -> [[String]]{ // creID, MET, cardio, str, equips
        let query1 = "SELECT E.Equipment_name FROM EXERCISE_EQUIPMENT AS E WHERE E.Name = '\(eName)'"
        var statement1 : OpaquePointer? = nil
        var inner:String
        inner = ""
        if sqlite3_prepare_v2(db, query1, -1, &statement1, nil) == SQLITE_OK{
            while sqlite3_step(statement1) == SQLITE_ROW { // Since we expect one, we will just pull the first that we get
                inner.append(String(cString: sqlite3_column_text(statement1, Int32(0)))+"\n") // Equipment
            }
        }
        let query = "SELECT E.CreatorID, E.MET, E.CardioFlag, E.StrengthFlag FROM EXERCISE AS E WHERE E.Name = '\(eName)'"
        var statement : OpaquePointer? = nil
        var sShowData :Array<Array<String>>
        sShowData = []
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            var oneEntry:Array<String>
            while sqlite3_step(statement) == SQLITE_ROW { // Since we expect one, we will just pull the first that we get
                oneEntry = []
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(0)))) // cID
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(1)))) // MET
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(2)))) // Cardio
                oneEntry.append(String(cString: sqlite3_column_text(statement, Int32(3)))) // Str
                oneEntry.append(inner) // Append in the equipment used as a string
                sShowData.append(oneEntry)
            }
        sqlite3_finalize(statement)

        } else{
            print("Query incorrect syntax")
        }
        return sShowData
    }
    
    
    
} // End of scope
