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
    var female: Bool
    
    init(_ name:String, _ weight:Int, _ female:Bool){
        self.name = name
        self.weight = weight
        self.female = female
    }
    
    func getName() -> String{
        return name
    }

    func getWeight() -> Int{
        return weight
    }
    func getFemale() -> Bool{
        return female
    }
    required convenience init(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let weight = aDecoder.decodeInteger(forKey: "weight")
        let female = aDecoder.decodeBool(forKey: "female")

        self.init(name, weight, female)
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(weight, forKey: "weight")
        aCoder.encode(female, forKey: "female")
    }
}


class DateObject: NSObject, NSCoding{
    var drinks: Int
    var BAC: Double
    var date: NSDate
    
    init(_ drinks:Int, _ BAC:Double, _ date:NSDate){
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
    func setBAC(_ weight:Int, _ female:Bool){
        var r: Double = 0
        if female{
            r = 0.66
        }else{
            r = 0.73
        }
        let drinkOunces = Double(drinks)*0.6*5.14
        let rawBAC = drinkOunces/Double(weight)*r
        
        let hoursElapsed = Calendar.current.component(.hour, from: Date()) - Calendar.current.component(.hour, from: date as Date)
        
        BAC = rawBAC - (Double(hoursElapsed) * 0.015)
        BAC = round(BAC * 100) / 100
        
    }
    func getBAC() -> Double{
        
        return BAC
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        
        let drinks = aDecoder.decodeInteger(forKey: "drinks")
        let BAC = aDecoder.decodeDouble(forKey: "BAC")
        let date = aDecoder.decodeObject(forKey: "date")
        
        self.init(drinks, BAC, date as! NSDate)
    }
    func encode(with aCoder: NSCoder) {

        aCoder.encode(drinks, forKey: "drinks")
        aCoder.encode(BAC, forKey: "BAC")
        aCoder.encode(date, forKey: "date")
    }
    
}
