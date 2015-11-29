//
//  ViewController.swift
//  LibraryManagement
//
//  Created by Oyoung on 15/11/29.
//  Copyright © 2015年 Oyoung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor  = UIColor.cyanColor()
        
        if !LocalUser.isLogged()
        {
            let loginView:LoginViewController = LoginViewController()
            
            self.addChildViewController(loginView)
            
            self.view.addSubview((loginView.view)!)
        }
        else
        {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

