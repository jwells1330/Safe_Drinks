//
//  User.swift
//  Safe Drinks
//
//  Created by Jake Wells on 11/27/16.
//  Copyright © 2016 Allen, Ashwell, and Wells. All rights reserved.
//

import Foundation

class User{
    var name: String
    
    init(_ name:String){
        self.name = name
    }
    
    func getName() -> String{
        return name
    }
    
}

class Users{
    var users: [User] = []
    
    func addUser(_ user:User){
        users.append(user)
    }
    
    func getUsers() -> [User]{
        return users
    }
}
