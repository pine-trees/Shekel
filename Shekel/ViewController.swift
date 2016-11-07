//
//  ViewController.swift
//  Shekel
//
//  Created by Evgeny Shmeerov on 11/10/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userBalance = DailyBalance(income: 50000.0, expenses: 0.0, today: 1)
//    var operationHistoryInPeriod = [
    @IBOutlet weak var BG: UIView!
    @IBOutlet weak var ring: Ring!
    @IBOutlet weak var moneyLabel: centralMoneyLabel!
    //BG Gradient set UP
    let gradient = CAGradientLayer()
    
    
    
    override func viewDidLoad() {
        let timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(displayMoney), userInfo: nil, repeats: false)
        super.viewDidLoad()
        
        let color1 = RGBtoUIColor(red: 215, green: 217, blue: 202)
        let color2 = RGBtoUIColor(red: 219, green: 216, blue: 196)
        gradient.frame = BG.bounds
        gradient.colors = [color1.cgColor, color2.cgColor]
        BG.layer.insertSublayer(gradient, at: 0)
        
        userBalance.spend(money: 200)
        
        ring.animateInitial()
//        timer.fire()
        moneyLabel.displayMoney()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(goToSubtract))
        swipeLeft.direction = .left
        ring.isUserInteractionEnabled = true
        ring.addGestureRecognizer(swipeLeft)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func displayMoney() {
        ring.animateToBalance(endFrame: userBalance.dailyPercentage())
        moneyLabel.stop(money: userBalance.todayBalance!)
        print(userBalance.todayBalance)
    }
    func console () {
        print(userBalance.today)
        print(userBalance.daysLeft)
        print("total expenses:\(userBalance.runningExpenses)")
        print("daily budget: \(userBalance.dailyBudget)")
        print("balance: \(userBalance.balance)")
        print(userBalance.plannedBudget)
    }

    func RGBtoUIColor (red: Int, green: Int, blue: Int) -> UIColor {
        let redFloat = Float(red)/255.0
        let greenFloat = Float(green)/255.0
        let blueFloat = Float(blue)/255.0
        let output = UIColor(red: CGFloat(redFloat), green: CGFloat(greenFloat), blue: CGFloat(blueFloat), alpha: 1.0)
        return output
    }
    
    func goToSubtract (sender: UISwipeGestureRecognizer) {
        performSegue(withIdentifier: "goToSubtract", sender: userBalance)
        print("ok")
    }

    
}

