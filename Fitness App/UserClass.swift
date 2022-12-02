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
    
    public func instert(usr:User) -> Bool{
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

