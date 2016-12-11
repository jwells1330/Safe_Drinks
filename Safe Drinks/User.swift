//
//  User.swift
//  Safe Drinks
//
//  Created by Jake Wells on 11/27/16.
//  Copyright © 2016 Allen, Ashwell, and Wells. All rights reserved.
//

import Foundation

class User: NSObject, NSCoding{
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
    func addToHistory(_ date: DateObject){
        history.append(date)
    }
    required convenience init(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let weight = aDecoder.decodeInteger(forKey: "weight")
        self.init(name, weight)
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(weight, forKey: "weight")
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

class DateObject{
    var drinks: Int
    var BAC: Double
    var date: Date
    
    init(_ drinks:Int, _ BAC:Double, _ date:Date){
        self.drinks = drinks
        self.BAC = BAC
        self.date = date
    }
    func addDrink(){
        drinks+=1
    }
    func getDrink() -> Int{
        return drinks
    }
    func setBAC(){
        BAC = 0
    }
    func getBAC() -> Double{
        return BAC
    }
    
}
