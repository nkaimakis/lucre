//
//  Budget.swift
//  Sanity
//
//  Created by Jordan Coppert on 10/8/17.
//  Copyright © 2017 CSC310Team22. All rights reserved.
//

import Foundation

//Made this a struct instead of a class to leverage convenience intializer
//Can change - Jordan
struct Budget {
    private var name:String
    private var resetDate:Date
    private var lastReset:Date
    private var resetInterval:Int
    //I don't think we need categories TBH, will just query Firebase
    var totalBudget:Double
    var budgetRemaining:Double
    
    var dictionary:[String:Any] {
        return [
            "name":name,
            "budgetRemaining":budgetRemaining,
            "totalBudget":totalBudget,
            "lastReset":lastReset,
            "resetDate":resetDate,
            "resetInterval":resetInterval
        ]
    }
    
    func getName() -> String {
        return name
    }
    
    func getResetDate() -> Date {
        return resetDate
    }
    
    func getLastReset() -> Date {
        return lastReset
    }
    
    func getResetInterval() -> Int {
        return resetInterval
    }
    
    func getTotalBudget() -> Double {
        return totalBudget
    }
    
    func getBudgetRemaining() -> Double {
        return budgetRemaining
    }
    
}

extension Budget : FirestoreSerializable {
    init?(dictionary: [String:Any]){
        guard let name = dictionary["name"] as? String,
            let budgetRemaining = dictionary["budgetRemaining"] as? Double,
            let totalBudget = dictionary["totalBudget"] as? Double,
            let lastReset = dictionary["lastReset"]  as? Date,
            let resetDate = dictionary["resetDate"]  as? Date,
            let resetInterval = dictionary["resetInterval"] as? Int else {return nil}
        
        self.init(name: name, resetDate: resetDate, lastReset: lastReset,
                  resetInterval: resetInterval,
                  totalBudget: totalBudget, budgetRemaining: budgetRemaining)
    }
}
