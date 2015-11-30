//
//  SCenterViewController.swift
//  LibraryManagement
//
//  Created by oyoung on 15/11/30.
//  Copyright © 2015年 Oyoung. All rights reserved.
//

import UIKit

class SCenterViewController: UIViewController {
    
    var logoutButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.parentViewController?.navigationItem.title = "个人中心"
        self.setButton()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setButton() {
        
        let center = UIView.CGRectGetCenter(self.view.frame)
        var size = self.view.frame.size
        size.height = 40
        logoutButton = UIButton(type: UIButtonType.RoundedRect)
        logoutButton?.backgroundColor = UIColor.purpleColor()
        logoutButton?.titleLabel?.textColor = UIColor.whiteColor()
        logoutButton?.setTitle("退出登录", forState: UIControlState.Normal)
        logoutButton?.addTarget(self, action: Selector("OnLogout:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(logoutButton!)
        logoutButton?.makeConstriantCenter(center)
        logoutButton?.makeConstraintSize(size)
        
        
        
    }
    
    @IBAction func OnLogout(sender: UIButton)
    {
        NSNotificationCenter.defaultCenter().postNotificationName("LOGOUT", object: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
