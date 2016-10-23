//
//  UserBalance.swift
//  Shekel
//
//  Created by Evgeny Shmeerov on 22/10/2016.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import Foundation

class BalanceInPeriod {
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
    
    var plannedBudget: [Double] {
        get {
            var surplus = 0.0
            var planned = [Double]()
            for _ in 1...daysLeft {
                let leftover = dailyBudget + surplus
                surplus = leftover
                planned.append(surplus)
            }
            return planned
        }
    }
    
    init(income: Double, expenses: Double, today: Int) {
        self.baseIncome = income
        self.baseExpenses = expenses
        self.runningIncome = income
        self.runningExpenses = expenses
        self.today = today
    }
    
    func spend (money: Double) {
       runningExpenses = runningExpenses + money
    }
}
