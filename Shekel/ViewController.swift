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

    @IBOutlet weak var BG: UIView!
    @IBOutlet weak var ring: Ring!
    //BG Gradient set UP
    let gradient = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let color1 = RGBtoUIColor(red: 215, green: 217, blue: 202)
        let color2 = RGBtoUIColor(red: 219, green: 216, blue: 196)
        gradient.frame = BG.bounds
        gradient.colors = [color1.cgColor, color2.cgColor]
        BG.layer.insertSublayer(gradient, at: 0)
        ring.animateInitial()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
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
func RGBtoUIColor (red: Int, green: Int, blue: Int) -> UIColor {
    let redFloat = Float(red)/255.0
    let greenFloat = Float(green)/255.0
    let blueFloat = Float(blue)/255.0
    let output = UIColor(red: CGFloat(redFloat), green: CGFloat(greenFloat), blue: CGFloat(blueFloat), alpha: 1.0)
    return output
}

