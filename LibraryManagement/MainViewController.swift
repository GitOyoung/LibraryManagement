//
//  ViewController.swift
//  LibraryManagement
//
//  Created by Oyoung on 15/11/29.
//  Copyright © 2015年 Oyoung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var currentViewController: UIViewController?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor  = UIColor.cyanColor()
        
        currentViewController = UIViewController()
        self.addChildViewController(currentViewController!)
        self.view.addSubview((currentViewController?.view)!)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("thingsDidLogout:"), name: "LOGOUT", object: nil)
        
        if !LocalUser.isLogged()
        {
            self.showLogin()
        }
        else
        {
            if  LocalUser.isAdmin()
            {
                self.showAdminHome()
            }
            else
            {
                self.showStudentHome()
            }
        }
        
    }
    
    func showStudentHome()
    {
        let studentView: StudentViewController = StudentViewController()
        let studentNavView: UINavigationController = UINavigationController(rootViewController: studentView)
        
        self.addChildViewController(studentNavView)
        self.view.addSubview(studentNavView.view)
    }
    
    func showAdminHome()
    {
        
    }
    
    func showLogin()
    {
        let loginView:LoginViewController = LoginViewController()
        self.addChildViewController(loginView)
        
        self.transitionFromViewController(currentViewController!, toViewController: loginView, duration: 1, options: UIViewAnimationOptions.TransitionCurlUp, animations: nil) { (finish: Bool) -> Void in
            if finish
            {
                self.currentViewController = loginView
            }
        }
    }
    
    @IBAction func thingsDidLogout(notif: NSNotification)
    {
        
        for viewController in self.childViewControllers
        {
            if viewController != currentViewController
            {
                viewController.view.removeFromSuperview()
                viewController.removeFromParentViewController()
            }
        }
        LocalUser.Logout()
        showLogin()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

