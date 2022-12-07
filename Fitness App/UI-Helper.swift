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
    let masterAdmin = Admin(userToAdmin: User(ethnicity: "admin", countryOfResidence: "computer", gender: "machine", birthDay: formatter1.date(from: "12/7/22")!))
    // Make a client
    let Joseph = Client(userToClient: User(ethnicity: "American", countryOfResidence: "USA", gender: "Male", birthDay: formatter1.date(from: "12/08/99")!), protein: 130, carbohydrates: 50, fat: 55, weight: 145, sugar: 60, height: 170)
    let firstFeedback = feedback(adminId: masterAdmin.adminId, clientID: Joseph.clientID, comments: "I am really liking this app!")
    
    // First exercise
    let legs1 = Exercise(Name: "Squat", met: 45, creatorID: masterAdmin.adminId, cardioFlag: false, strengthFlag: true)
    // Muscles worked for the first exercise
    let legs1muscles = Muscles_Worked(Name: "Squat", creatorID: masterAdmin.adminId, muscle: "Quadriceps")
    // Equipment used for first exercise
    let legs1equip = Exercise_Equipment(name: "Squat", equipment_name: "Squat Rack and Barbell")
    
    // Second exercise
    let legs2 = Exercise(Name: "Deadlift", met: 45, creatorID: masterAdmin.adminId, cardioFlag: false, strengthFlag: true)
    // Muscles worked for second exercise
    let legs2muscles = Muscles_Worked(Name: "Deadlift", creatorID: masterAdmin.adminId, muscle: "Hamstrings")
    // Equipment used for second exercise
    let legs2equip = Exercise_Equipment(name: "Deadlift", equipment_name: "Barbell")
    
    // Third exercise
    let legs3 = Exercise(Name: "Hip Thrusts", met: 45, creatorID: masterAdmin.adminId, cardioFlag: false, strengthFlag: true)
    // Muscles worked for third exercise
    let legs3muscles = Muscles_Worked(Name: "Hip Thrusts", creatorID: masterAdmin.adminId, muscle: "Glutes")
    // Equipment used for third exercise
    let legs3equip = Exercise_Equipment(name: "Hip Thrusts", equipment_name: "Barbell")
    
    let legDay = Workout_program(userID: Joseph.clientID, name: "Leg day", privacy: false)
//    let legDayHas = legDay.exercisesInProgramInDB(db: db, exercise: "Deadlift", pr: 225, weight: 135, reps: 12, sets: 3, time: 0, distance: 0, creatorID: <#T##Int#>)
}
