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
        _normalOrigin = CGPoint(x: 0, y: 0)
    }
    private var _normalOrigin:CGPoint
    var normalOrigin: CGPoint
    {
        get
        {
            return self._normalOrigin
        }
        set(newOrigin)
        {
            self._normalOrigin = newOrigin
        }
    }
    
    func baseUrl() ->String
    {
        return "http://120.55.189.165:8081/chaofan/login/doLogin"
    }

}
