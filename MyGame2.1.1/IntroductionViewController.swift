//
//  IntroductionViewController.swift
//  MyGame2.1.1
//
//  Created by Karol on 28/11/2016.
//  Copyright © 2016 Karol Bukowski. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    let pages = ["HiViewController", "InstructionViewController", "RulesViewController", "DemoGame"]
    var pageViewController: UIPageViewController!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        pageViewController = UIPageViewController()
        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.setViewControllers([viewControllerAtIndex(index: 0)!], direction: .forward, animated: true, completion: nil) //setting very first view controller to display up

        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
    }

    func viewControllerAtIndex(index: Int) -> UIViewController? {
        return storyboard?.instantiateViewController(withIdentifier: pages[index])
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let index = pages.index(of: viewController.restorationIdentifier!) {
            if index > 0 {
                return viewControllerAtIndex(index: index - 1)
            }
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let index = pages.index(of: viewController.restorationIdentifier!) {
            if index < pages.count - 1 {
                return viewControllerAtIndex(index: index + 1)
            }
        }
        
        return nil
    }

}
