//
//  feedback.swift
//  Fitness App
//
//  Created by Fardin Mahid on 2022-12-05.
//

import Foundation


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
