//
//  LoginTableViewController.swift
//  LibraryManagement
//
//  Created by Oyoung on 15/11/29.
//  Copyright © 2015年 Oyoung. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var imageView: UIImageView?
    var loginUserName: UITextField?
    var loginPassword: UITextField?
    var loginButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 1, green: 0, blue: 0.7, alpha: 0.5)

        imageView = UIImageView(image: nil)
        loginUserName = UITextField()
        loginPassword = UITextField()
        loginButton = UIButton()
        
        
        loginUserName?.placeholder = "UserName"
        loginPassword?.placeholder = "Password"
        
        loginUserName?.textAlignment = NSTextAlignment.Center
        loginPassword?.textAlignment = NSTextAlignment.Center
        
        imageView?.backgroundColor = UIColor.greenColor()
        loginUserName?.backgroundColor = UIColor.lightGrayColor()
        loginPassword?.backgroundColor = UIColor.lightGrayColor()
        
        
        loginUserName?.addTarget(self, action: Selector("OnTextEditingDidEndOnExit:"), forControlEvents: UIControlEvents.EditingDidEndOnExit)
        loginPassword?.addTarget(self, action: Selector("OnTextEditingDidEndOnExit:"), forControlEvents: UIControlEvents.EditingDidEndOnExit)
        
        loginButton?.setTitle("Login", forState: UIControlState.Normal)
        loginButton?.backgroundColor = UIColor(red: 0, green: 0.5, blue: 0.9, alpha: 0.8)
        loginButton?.addTarget(self, action: Selector("OnLoginTouchUpInside:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        self.view.addSubview(imageView!)
        self.view.addSubview(loginUserName!)
        
        self.view.addSubview(loginPassword!)
        self.view.addSubview(loginButton!)
        
        var center = UIView.CGRectGetCenter(self.view.frame)
        var size = self.view.frame.size
        center.y /= 2
        size.width /= 2
        size.height /= 4
        imageView?.makeConstriantCenter(center)
        imageView?.makeConstraintSize(size)
        
        
        center = UIView.CGRectGetCenter(self.view.frame)
        center.y += 50
        
        size = self.view.frame.size
        size.width /= 2
        size.height = 40
        
        loginUserName?.makeConstriantCenter(center)
        loginUserName?.makeConstraintSize(size)

        
        center.y += 50
        loginPassword?.makeConstriantCenter(center)
        loginPassword?.makeConstraintSize(size)
        
        center.y += 80
        loginButton?.makeConstriantCenter(center)
        loginButton?.makeConstraintSize(size)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("OnKeyboardDidShow:"), name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("OnKeyboardDidHide"), name: UIKeyboardDidHideNotification, object: nil)
        self.view.moveBegin()
        
    }
    
    func OnKeyboardDidShow(notif: NSNotification)
    {
        let info: NSDictionary = notif.userInfo!
        
        let value:NSValue = info.objectForKey(UIKeyboardFrameBeginUserInfoKey) as! NSValue
        
        let size: CGSize = value.CGRectValue().size
        
        self.view.moveForKeyBoardShow(size)
    }
    
    func OnKeyboardDidHide(notif: NSNotification)
    {
        let info: NSDictionary = notif.userInfo!
        
        let value:NSValue = info.objectForKey(UIKeyboardFrameBeginUserInfoKey) as! NSValue
        
        let size: CGSize = value.CGRectValue().size
        
        self.view.moveForKeyBoardHide(size)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func OnTextEditingDidEndOnExit(sender: UITextField)
    {
        self.cancelInput()
        if sender.isEqual(loginUserName)
        {
            loginPassword?.becomeFirstResponder()
        }
    }

    @IBAction func OnLoginTouchUpInside(sender: UIButton)
    {
//        let name = loginUserName?.text!
//        let passwd = loginPassword?.text!
        
        
    }
    
    func cancelInput()
    {
        
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
