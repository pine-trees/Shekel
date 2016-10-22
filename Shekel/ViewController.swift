//
//  ViewController.swift
//  Shekel
//
//  Created by Evgeny Shmeerov on 11/10/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userBalance = BalanceInPeriod(income: 50000.0, expenses: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(userBalance.monthlyBalance)
        print(userBalance.dailyBalance)
        print(userBalance.calcNextSurplus())
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}

