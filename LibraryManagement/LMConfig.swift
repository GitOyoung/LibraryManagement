//
//  LMConfig.swift
//  LibraryManagement
//
//  Created by Oyoung on 15/11/29.
//  Copyright © 2015年 Oyoung. All rights reserved.
//

import UIKit

class LMConfig: NSObject {
    
    static var config:LMConfig? = nil
    static func defaultConfig() -> LMConfig
    {
        if config == nil
        {
            config = LMConfig()
        }
        return config!
    }
  
    
    private override init()
    {
        configDict = [String: Any]()
    }
    private var configDict:[String: Any]?
    
    var normalOrigin: CGPoint
    {
        get
        {
            return configDict!["normalOrigin"] as! CGPoint
        }
        set(newOrigin)
        {
            configDict!["normalOrigin"] = newOrigin
        }
    }
    
    func baseUrl() ->String
    {
        return "http://120.55.189.165:8081/chaofan/login/doLogin"
    }
    
    func dataBasePath() ->String
    {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let path = paths[0]
        return "\(path)/BookInfo.sqlite"
    }
    
    var defaultUser:LMUser? {
        get {
            return configDict!["defaultUser"] as? LMUser
        }
        set(newUser) {
            configDict!["defaultUser"] = newUser
        }
    }

}
