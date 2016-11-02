//
//  Ring.swift
//  Shekel
//
//  Created by Evgeny Shmeerov on 23/10/2016.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit

class Ring: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func animateInitial () {
        self.image = UIImage(named: "Ring_Intro_99.png")
        var imgArray = [UIImage]()
        for x in 0...99 {
            imgArray.append(UIImage(named: "Ring_Intro_\(x).png")!)
        }
        self.animationImages = imgArray
        self.animationDuration = 2
        self.animationRepeatCount = 1
        self.startAnimating()
    }
    
    func animateToBalance(endFrame: Int) {
        let imgNum = NSString(format: "%05i", endFrame)
        self.image = UIImage(named: "Ring_\(imgNum).png")
        var imgArray = [UIImage]()
        for x in 0...endFrame {
            let string = NSString(format: "%05i", x)
            imgArray.append(UIImage(named: "Ring_\(string).img")!)
        }
        self.animationImages = imgArray
        self.animationDuration = 3*(Double(endFrame)/100)
        self.animationRepeatCount = 1
        self.startAnimating()
        
    }
    
}
