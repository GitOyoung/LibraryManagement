//
//  LMLogin.swift
//  LibraryManagement
//
//  Created by Oyoung on 15/11/29.
//  Copyright © 2015年 Oyoung. All rights reserved.
//

import UIKit

class LMLogin: NSObject {
    enum LoginResult : Int
    {
        case OK
        case UserNameEmpty
        case PasswordEmpty
        case UserNameTooShort
        case UserNameTooLong
        case PasswordTooshort
        case PassWordTooLong
    }
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

}
