//
//  LMLogin.swift
//  LibraryManagement
//
//  Created by Oyoung on 15/11/29.
//  Copyright © 2015年 Oyoung. All rights reserved.
//

import UIKit
enum LoginResult : Int
{
    case OK
    case UnKown
    case UserNameEmpty
    case PasswordEmpty
    case UserNameTooShort
    case UserNameTooLong
    case PasswordTooshort
    case PassWordTooLong
    case ErrorUserNameOrPassword
}

class LMLogin: NSObject
{

    static var minLengthOfUserName = 3
    static var minLengthOfPassword = 6
    static func loginValid(name: String?, passwd: String?) -> LoginResult
    {
        if (name == nil || name == "")
        {
            return LoginResult.UserNameEmpty
        }
        if passwd == nil || passwd == ""
        {
            return LoginResult.PasswordEmpty
        }
        
        
        return LoginResult.OK
    }
    
    static func login(name: String!, passwd: String!, success:(data: NSData, response: NSURLResponse) -> Void, failure: (LoginResult, msg: String) ->Void)
    {
        let urlString = String(format:"%@?login_name=%@&&password=%@", LMConfig.defaultConfig().baseUrl(), name, passwd)
        
        let url:NSURL = NSURL(string: urlString)!
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        config.timeoutIntervalForRequest = 15
        let session = NSURLSession(configuration: config, delegate: nil, delegateQueue: nil)
        
        do {
        let task =  session.dataTaskWithURL(url)
            { (data, response, error) -> Void in
            
            if error == nil
            {

                let dict =  NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                let code = dict["code"] as! String
                let msg = dict["msg"] as! String
                
                if code == "0"
                {
                    success(data: data!, response: response!)
                }
                else
                {
                    failure(LoginResult.ErrorUserNameOrPassword, msg: msg)
                }
                
             
            }
            else
            {
                failure(LoginResult.UnKown, msg: (error?.description)!)
            }
            
            
        }
        
        task.resume()
        }
        catch
        {
            
        }
    }
        
}


