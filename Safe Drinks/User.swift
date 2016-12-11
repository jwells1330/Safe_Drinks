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
    
//    init(_ name:String, _ weight:Int, _ female:Bool, _ history:[DateObject]){
//        self.name = name
//        self.weight = weight
//        self.female = female
//        self.history = history
//    }
    init(_ name:String, _ weight:Int, _ female:Bool){
        self.name = name
        self.weight = weight
        self.female = female
    }
    
    func getName() -> String{
        return name
    }
//    func addToHistory(_ date: DateObject){
//        history.append(date)
//    }
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
//        print()
//        print("BEFORE ARRAY DECODE")
//        print()
//        let historyArchive = aDecoder.decodeObject(forKey: "history") as? NSData
//        let history = NSKeyedUnarchiver.unarchiveObject(with: (historyArchive as? Data)!) as? [DateObject]
//        print()
//        print("AFTER ARRAY DECODE")
//        print()
//        self.init(name, weight, female, history!)
        self.init(name, weight, female)
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(weight, forKey: "weight")
        aCoder.encode(female, forKey: "female")
//        print()
//        print("BEFORE ARRAY ENCODE")
//        print()
//        aCoder.encode(archiveHistory(), forKey: "history")
//        print()
//        print("AFTER ARRAY ENCODE")
//        print()
    }
//    func archiveHistory() -> NSData{
//        let archivedArray = NSKeyedArchiver.archivedData(withRootObject: history as NSArray)
//        return archivedArray as NSData
//    }
//    func testArchive(){
//        print("historyCount \(history.count)")
//        let archived = archiveHistory()
//        print("archived")
//        NSKeyedUnarchiver.unarchiveObject(with: archived as Data)
//        history[0].addDrink()
//        print(history[0].getDrink())
//    }
    
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
        
    }
    func getBAC() -> Double{
        return BAC
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        
        let drinks = aDecoder.decodeInteger(forKey: "drinks")
        let BAC = aDecoder.decodeDouble(forKey: "BAC")
        let date = aDecoder.decodeObject(forKey: "date")
        
        print("Drinks \(drinks)")
        print("BAC \(BAC)")
        print("Date \(date!)")
        
        self.init(drinks, BAC, date as! NSDate)
    }
    func encode(with aCoder: NSCoder) {
        print()
        print("BEFORE DRINKS ENCODE")
        print()
        aCoder.encode(drinks, forKey: "drinks")
        print()
        print("AFTER DRINKS ENCODE")
        print()
        print()
        print("BEFORE BAC ENCODE")
        print()
        aCoder.encode(BAC, forKey: "BAC")
        print()
        print("AFTER BAC ENCODE")
        print()
        print()
        print("BEFORE DATE ENCODE")
        print()
        aCoder.encode(date, forKey: "date")
        print()
        print("AFTER DATE ENCODE")
        print()
    }
    
}
