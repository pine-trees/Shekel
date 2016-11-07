//
//  Interface_elements.swift
//  Shekel
//
//  Created by Evgeny Shmeerov on 06/11/2016.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit

class centralMoneyLabel: UILabel {
    var timer = Timer()
    var counter = 0.0
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    func displayMoney () {
        timer = Timer.scheduledTimer(timeInterval: 0.015, target: self, selector: #selector(randMoney), userInfo: nil, repeats: true)
    }
    
    func randMoney (sender: Timer!) {
        self.text = String(arc4random_uniform(UInt32(5000))) + "." + String(arc4random_uniform(UInt32(100)))
        
        
    }
    
    func stop(money: Double) {
        timer.invalidate()
        self.text = String(format: "%.2f", money) + " ₽"
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
