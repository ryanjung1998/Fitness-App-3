//
//  UserClass.swift
//  Fitness App
//
//  Created by Fardin Mahid on 2022-12-02.
//
/*
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
    init(Usr : User){
        self.ethnicity = Usr.ethnicity
        self.countryOfResidence = Usr.countryOfResidence
        self.gender = Usr.gender
        self.birthDay = Usr.birthDay
        self.userID = User.counter
        User.counter += 1 // for now
    }
    
    public func insert(usr:User) -> Bool{
        //Implimentation
        /*takes userstuffs and imports it to
         the database
         */
        return true //for now
    }
    
    public func delete(usr:User)-> Bool{
        //Implementation
        /*
         deletes user and all items close to it
         */
        return true // for now
    }
    
    public func Retrive(UserID: Int){ // -> User
        //Retrive from database if in the database if not then return error
        //
    }
    
    public func inDB (UserID: Int ) -> Bool{
        
    }
    
    public func edit(usr:User,change:String) -> Bool{
        //switch cases? to show that an edit has been made and where
        let S:String = change.lowercased()
        if S == "ethnicity"{
            //do someting
        }
        else if S == "countryofresidence"{
          //do something
        }
        else if S == "gender"{
            //do something
        }
        else if S == "Date"{
            //do something
        }
        return true
    }
    
    
    
}

class Client: User {
    //Since User ID already in the User class, we don't need to worry about it
    var listID : Int = 0
    var protien : Double
    var carbohydrates : Double
    var fat: Double
    var weight : Double
    var sugar : Double
    var height : Double
    
    init(listID: Int, protien: Double, carbohydrates: Double, fat: Double, weight: Double, sugar: Double, height: Double) {
        super.init(ethnicity: <#T##String#>, countryOfResidence: <#T##String#>, gender: <#T##String#>, birthDay: <#T##Date#>)
        self.listID = listID
        self.protien = protien
        self.carbohydrates = carbohydrates
        self.fat = fat
        self.weight = weight
        self.sugar = sugar
        self.height = height
    }
    
    public func setList(LID: OnList){
        // Retrive 
    }
    
    public func insert(cli:Client) -> Bool{
        //Implimentation
        /*takes userstuffs and imports it to
         the database
         */
        return true //for now
    }
    
    public func delete(cli:Client)-> Bool{
        //Implementation
        /*
         deletes user and all items close to it
         */
        return true // for now
    }
    
    override public func Retrive(UserID: Int){ // -> User
        //Retrive from database if in the database if not then return error
        //
    }
    
    override public func inDB (UserID: Int ) -> Bool{
        return true //for now
        // will check if there is an isntance of it in
        //db
    }
    
    public func edit(usr:Client, change:String) -> Bool{
        //switch cases? to show that an edit has been made and where
        let S:String = change.lowercased()
        if S == "ethnicity"{
            //do someting
        }
        else if S == "countryofresidence"{
          //do something
        }
        else if S == "gender"{
            //do something
        }
        else if S == "Date"{
            //do something
        }
        return true
    }
    
}

class Admin : User{
    init(){
        super.init(ethnicity: <#T##String#>, countryOfResidence: <#T##String#>, gender: <#T##String#>, birthDay: <#T##Date#>)
    }
}



class feedback{
    var adminId: Int
    var clientID: Int
    var comments:String
    
    init(adminId: Admin, clientID: Client, comments: String) {
        self.adminId = adminId.userID
        self.clientID = clientID.userID
        self.comments = comments
    }
    
    //should show the feedback in UI if time allows
}


class GroceryList{
    var clientID: Int
    var listID: Int
    
    init(client:Client) {
        self.clientID = client.userID
        self.listID = client.listID
        <#statements#>
    }
    
    public func insert(gL: GroceryList) ->Bool{
        //inserts into DB
        return true
    }
    
    public func edit(cliID:Client, change:String) -> Bool{
        //change the DB
        
        return true
    }
    
    public func delete(cliID:Client){
        
    }
    
}


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



class MealPlan{
    var userID: Int
    var name: String
    var privacy: Bool = false
    
    init(usrID: Client, name: Recipe, privacy: Bool) {
        self.userID = usrID.userID
        self.name = name.recipeName
        self.privacy = privacy
    }
    //insert edit, delete like all of them
}



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


*/
