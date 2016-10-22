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
    var daysInMonth: Int {
        get {
            return (calendar.range(of: .day, in: .month, for: date))!.count
        }
    }
    var today: Int
    var daysLeftInMonth: Int {
        get {
            return daysInMonth - today
        }
    }
    
    var monthlyIncome: Double
    var monthlyExpenses: Double
    var monthlyBalance: Double {
        get {
            return monthlyIncome - monthlyExpenses
        }
    }
    
    var dailyBalance: Double {
        get {
            return monthlyBalance/Double(daysInMonth)
        }
    }
    var surplus: Double {
        get {
            return dailyBalance
        }
    }
    
    init (income: Double, expenses: Double) {
        self.monthlyIncome = income
        self.monthlyExpenses = expenses
        
        self.today = calendar.component(.day, from: date)
    }
    
    func calcNextSurplus () -> [Double] {
        var _surplus = self.surplus
        var surplusArray = [self.surplus]
        for _ in 2...31 {
            _surplus = dailyBalance + _surplus
            surplusArray.append(_surplus)
        }
        return surplusArray
    }

}
