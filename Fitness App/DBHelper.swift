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
        self.createTable()
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
    
    func createTable(){
        let query = "CREATE TABLE IF NOT EXISTS users(id INTEGER PRIMARY KEY AUTOINCREMENT)"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Table creation success")
            } else {
                print("Table creation failed")
            }
        } else {
            print("Preparation failed")
        }
    }
}
