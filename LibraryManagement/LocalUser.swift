//
//  LocalUser.swift
//  LibraryManagement
//
//  Created by Oyoung on 15/11/29.
//  Copyright © 2015年 Oyoung. All rights reserved.
//

import UIKit

class LocalUser: NSObject {
    
    static func isLogged() ->Bool
    {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        let loginInfo:NSDictionary? = userDefaults.objectForKey("Local") as? NSDictionary
        
        return (loginInfo != nil) && ((loginInfo?.objectForKey("LOGIN")?.isEqualToString("TRUE"))!)
    }
    
    static func isAdmin() -> Bool
    {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        let loginInfo:NSDictionary? = userDefaults.objectForKey("Local") as? NSDictionary
        
        return (loginInfo != nil) && ((loginInfo?.objectForKey("Type")?.isEqualToString("ADMIN"))!)
    }
    
    static func Login(name: String?, passwd: String?, type: String?) ->Void
    {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let loginInfo:NSDictionary? = (userDefaults.objectForKey("Local") as? NSDictionary)
        let newInfo: NSMutableDictionary!
        
        if loginInfo == nil
        {
            newInfo = NSMutableDictionary(capacity: 1)
        }
        else
        {
            newInfo = NSMutableDictionary(dictionary: loginInfo!)
        }
        
        newInfo.setObject(name!, forKey: "Name")
        newInfo.setObject(passwd!, forKey: "Password")
        newInfo.setObject("TRUE", forKey: "LOGIN")
        newInfo.setObject(type!, forKey: "Type")
        
        userDefaults.setObject(newInfo, forKey: "Local")
        userDefaults.synchronize()
        
    }
    
    static func Logout() ->Void
    {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let loginInfo:NSDictionary? = userDefaults.objectForKey("Local") as? NSDictionary
        
        if loginInfo == nil
        {
            return
        }
        
        let newInfo:NSMutableDictionary! = NSMutableDictionary(dictionary: loginInfo!)
        newInfo.setObject("FALSE", forKey: "LOGIN")
        
        userDefaults.setObject(newInfo, forKey: "Local")
        userDefaults.synchronize()
    }

}
