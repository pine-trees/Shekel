//
//  UserBalance.swift
//  Shekel
//
//  Created by Evgeny Shmeerov on 22/10/2016.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import Foundation

class DailyBalance {
    let date = Date()
    let calendar = Calendar.current
    var today: Int
    
    var daysLeft: Int {
        get {
            return ((calendar.range(of: .day, in: .month, for: date))?.count)! - today
        }
    }
    
    
    var baseIncome: Double
    var baseExpenses: Double
    
    var runningIncome: Double
    var runningExpenses: Double
    
    var balance: Double {
        get {
            return runningIncome - runningExpenses
        }
    }
    var dailyBudget: Double {
        get {
            return balance/Double(daysLeft)
        }
    }
    var todayBalance: Double?
    
    var todaysExpenses = 0.0
    
    var plannedBudget: [Double] {
        get {
            var surplus = todayBalance
            var planned = [todayBalance]
            for _ in 2...daysLeft {
                let leftover = dailyBudget + surplus!
                surplus = leftover
                planned.append(surplus!)
            }
            
            return planned as! [Double]
        }
        
    }
    
    
    init(income: Double, expenses: Double, today: Int) {
        self.baseIncome = income
        self.baseExpenses = expenses
        self.runningIncome = income
        self.runningExpenses = expenses
        self.today = today
        initializeTodayBalance()
    }
    
    
    // Пиздец костыль
    func initializeTodayBalance () {
        todayBalance = dailyBudget
    }
    
    
    
    func spend (money: Double) {
        if money <= dailyBudget {
            todaysExpenses = money
            todayBalance = todayBalance! - money
        } else {
            runningExpenses = runningExpenses + money
            todaysExpenses += money
            todayBalance = dailyBudget
        }
        
    }
    
    func dailyPercentage ()-> Int {
        let percent = 100*(todaysExpenses/todayBalance!)
        return Int(percent)
        
    }
}
