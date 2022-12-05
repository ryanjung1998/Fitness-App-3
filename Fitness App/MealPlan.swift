//
//  File.swift
//  Fitness App
//
//  Created by Fardin Mahid on 2022-12-05.
//

import Foundation


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
