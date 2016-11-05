//
//  PageViewController.swift
//  Shekel
//
//  Created by Evgeny Shmeerov on 05/11/2016.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit

class CentralPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        //append viewcontrollers to array here
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "BalanceRingVC")
        pages.append(vc1!)
        
        //set initial view
        setViewControllers([vc1!], direction: .forward, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // DataSource protocol conform methods
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
        func getVC (name: String) -> UIViewController {
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
