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
            print("Database has been created with \(path)")
            return db
        }
    }
    // ------------ INSERTING FUNCTIONS --------------- //
    func insertDefaults(){
        // Just passing in today's date until we find a way to give it a real date
        //insertUser(Birth_date: Date(), Gender: "Male", CountryOfResidence: "Canada", Ethnicity: "Asian")
        insertClient(UserID: 1, Protein: 2, Carbohydrates: 3, Fat: 4, Weight: 5, Sugar: 6, Height: 7, ListID: 8)
    }
    
    func insertUser(Birth_date: Date, Gender: String, CountryOfResidence: String, Ethnicity: String){
        let query = "INSERT INTO USER (Birth_date, Gender, CountryOfResidence, Ethnicity) VALUES (?, ?, ?, ?)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            let formatter1 = DateFormatter() // Format date as string
            formatter1.dateStyle = .short    // Formatting
            sqlite3_bind_text(statement, 1, ((formatter1.string(from: Birth_date)) as NSString).utf8String, -1, nil) // Pass in date as a string
            sqlite3_bind_text(statement, 2, (Gender as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 3, (CountryOfResidence as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 4, (Ethnicity as NSString).utf8String, -1, nil)
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("User inserted successfully")
            } else {
                print("User data unable to be inserted")
            }
        } else {
            print("User query is not as per requirement")
        }
    }
    // [TODO] Make admin promotion function
    //Protein INT, Carbohydrates INT,Fat INT,Weight INT,Sugar INT,Height INT,ListID INT,
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
    
    
    //----- Deleting Functions -------- //
    
    //-------Editing fucntions ------//
    
    func editClient()
    
    
    // ---------------- CREATING TABLES --------------- //
    func createDefaults(){
        let createUser = "CREATE TABLE IF NOT EXISTS USER(UserID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, Birth_date DATE NOT NULL, Gender VARCHAR(10), CountryOfResidence VARCHAR(10), Ethnicity VARCHAR(10));"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, createUser, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
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
        
        let createPerformed = "CREATE TABLE IF NOT EXISTS PERFORMED (UserID   INT   NOT NULL,Program_Name   VARCHAR(15)   NOT NULL,PerDate   DATE   NOT NULL,PRIMARY KEY (UserID, Program_Name, PerDate),FOREIGN KEY (UserID) REFERENCES CLIENT(UserID),FOREIGN KEY (Program_Name) REFERENCES WORKOUT_PROGRAM(Name),FOREIGN KEY (Date) REFERENCES JOURNAL_ENTRY(Date));"
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
        
        
        let createJournalEntry = "CREATE TABLE IF NOT EXISTS JOURNAL_ENTRY (UserID   INT   NOT NULL,Date   DATE   NOT NULL,Weight   INT,CaloriesBurned   INT,Quality   VARCHAR(5),Hours   INT,PRIMARY KEY (UserID, Date),FOREIGN KEY (UserID) REFERENCES CLIENT(UserID));"
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
        
        
        let createGroceryList = "CREATE TABLE IF NOT EXISTS GROCERY_LIST (ClientID   INT   NOT NULL,ListID   INT   NOT NULL,PRIMARY KEY (ClientID, ListID),FOREIGN KEY  (ClientID) REFERENCES CLIENT(UserID),FOREIGN KEY (ListID) REFERENCES CLIENT(ListID) );"
        if sqlite3_prepare_v2(self.db, createGroceryList, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created GROCERY_LIST successfully") // Remove later
            } else {
                print("GROCERY_LIST table creation failed") // Remove later
            }
        } else {
            print("Preparation for GROCERY_LIST table failed") // Remove later
        }
        
        
        let createMealPlan = "CREATE TABLE IF NOT EXISTS MEAL_PLAN (UserID   INT   NOT NULL,Name   VARCHAR(15),Privacy   BOOLEAN,PRIMARY KEY (UserID, Name),FOREIGN KEY (UserID) REFERENCES USER(UserID) );"
        if sqlite3_prepare_v2(self.db, createMealPlan, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created MEAL_PLAN successfully") // Remove later
            } else {
                print("MEAL_PLAN table creation failed") // Remove later
            }
        } else {
            print("Preparation for MEAL_PLAN table failed") // Remove later
        }
        
        
        let createMealConsistsOf = "CREATE TABLE IF NOT EXISTS MEAL_CONSISTS_OF (MealName   VARCHAR(15)   NOT NULL,RecipeName   VARCHAR(15)   NOT NULL,Servings   INT   NOT NULL,PRIMARY KEY (MealName, RecipeName),FOREIGN KEY (MealName) REFERENCES MEAL_PLAN(Name),FOREIGN KEY (RecipeName) REFERENCES RECIPE(RecipeName) );"
        if sqlite3_prepare_v2(self.db, createMealConsistsOf, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Created MEAL_CONSISTS_OF successfully") // Remove later
            } else {
                print("MEAL_CONSISTS_OF table creation failed") // Remove later
            }
        } else {
            print("Preparation for MEAL_CONSISTS_OF table failed") // Remove later
        }
        
        
        let createOnGroceryList = "CREATE TABLE IF NOT EXISTS ON_GROCERY_LIST (ListId   INT   NOT NULL,FoodId   INT   NOT NULL,Quantity   INT   NOT  NULL,ClientID   INT   NOT NULL,PRIMARY KEY (ListID, FoodID, ClientID),FOREIGN KEY (ListID) REFERENCES GROCERY_LIST(ListID),FOREIGN KEY (FoodID) REFERENCES FOOD(FoodID),FOREIGN KEY (ClientID) REFERENCES GROCERY_LIST(ClientID) );"
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
        
        
        let createIncludedIn = "CREATE TABLE IF NOT EXISTS INCLUDED_IN (RecipeID   VARCHAR(15)   NOT NULL,CreatorID   INT   NOT NULL,FoodID   INT   NOT NULL,PRIMARY KEY (RecipeID, CreatorID, FoodID),FOREIGN KEY (RecipeID) REFERENCES RECIPE(RecipeName),FOREIGN KEY (CreatorID) REFERENCES RECIPE(CreatorID),FOREIGN KEY (FoodID) REFERENCES FOOD(FoodID) );"
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
}
