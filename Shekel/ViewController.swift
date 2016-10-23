//
//  ViewController.swift
//  Shekel
//
//  Created by Evgeny Shmeerov on 11/10/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userBalance = BalanceInPeriod(income: 50000.0, expenses: 0.0, today: 1)
    
    @IBOutlet weak var spendFiled: UITextField!
    @IBAction func spendMoney(_ sender: AnyObject) {
        userBalance.spend(money: Double(spendFiled.text!)!)
        console()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       console()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func console () {
        print(userBalance.today)
        print(userBalance.daysLeft)
        print("total expenses:\(userBalance.runningExpenses)")
        print("daily budget: \(userBalance.dailyBudget)")
        print("balance: \(userBalance.balance)")
        print(userBalance.plannedBudget)
    }
}

