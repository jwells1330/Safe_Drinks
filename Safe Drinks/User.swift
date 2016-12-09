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
    var weight: Int
    var history: [Date] = []
    
    init(_ name:String, _ weight:Int){
        self.name = name
        self.weight = weight
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

class Date{
    var drinks: Int
    var BAC: Double
    
    init(_ drinks:Int, _ BAC:Double){
        self.drinks = drinks
        self.BAC = BAC
    }
    
}
