//
//  LMUser.swift
//  LibraryManagement
//
//  Created by Oyoung on 15/11/29.
//  Copyright © 2015年 Oyoung. All rights reserved.
//

import UIKit

class LMUser: NSObject {
    
    init(dictionary: NSDictionary)
    {
        super.init()
        self.login_name = dictionary["login_name"] as? String
        self.user_id =  dictionary["user_id"] as? String
        self.mobile = dictionary["mobile"] as? String
        self.email = dictionary["email"] as? String
        self.password = dictionary["password"] as? String
        self.salt = dictionary["salt"] as? String
        self.status = dictionary["status"] as? NSNumber
        self.user_type = dictionary["user_type"] as? NSNumber
        self.del_flag = dictionary["del_flag"] as? NSNumber
        self.has_real = dictionary["has_real"] as? NSNumber
        self.nick = dictionary["nick"] as? String
        self.pay_pass = dictionary["pay_pass"] as? String
        self.sessionid = dictionary["sessionid"] as? String
        self.createBy = dictionary["createBy"] as? String
        self.createDate = dictionary["createDate"] as? String
        self.updatedBy = dictionary["updatedBy"] as? String
    }

//    
//    {"user_id":"1","login_name":"liming","mobile":"","email":"","passwor d":"2026f90a089b6d4ad4e013549e7b8df7257e0dc1","salt":"00ffaa9636b7ef3f","stat us":2,"user_type":9,"del_flag":0,"has_real":0,"nick":"李明 ","pay_pass":"","sessionid":"2be232a694f6edd26462e13fc8d785a4","createdBy":"" ,"createdDate":"Nov 20, 2015 10:39:19 PM","updatedBy":""}}
    private var pay_pass:String?
    var PayPass:String {
        get {
            return self.pay_pass!
        }
        set(newString) {
            self.pay_pass = newString
        }
    }
    
    private var user_type:NSNumber?
    var UserType:Int {
        get {
            return (self.user_type?.integerValue)!
        }
        set(newInt) {
            self.user_type = newInt
        }
    }
    
    private var status:NSNumber?
    var Status:Int {
        get {
            return (self.status?.integerValue)!
        }
        set(newInt) {
            self.status = newInt
        }
    }
    
    private var salt:String?
    var Salt:String {
        get {
            return self.salt!
        }
        set(newString) {
            self.salt = newString
        }
    }
    
    private var del_flag:NSNumber?
    var isDeleted:Bool {
        get {
            return self.del_flag?.integerValue == 1
        }
        set(newBool) {
            self.del_flag = newBool ? 1 : 0
        }
    }
    
    private var password:String?
    var Password:String {
        get {
            return self.password!
        }
        set(newString) {
            self.password = newString
        }
    }
    
    private var email:String?
    var Email:String {
        get {
            return self.email!
        }
        set(newString) {
            self.email = newString
        }
    }
    
    private var mobile:String?
    var Mobile:String {
        get {
            return self.mobile!
        }
        set(newString) {
            self.mobile = newString
        }
    }
    
    private var has_real:NSNumber?
    var hasReal:Int {
        get {
            return self.has_real!.integerValue
        }
        set(newInt){
            self.has_real = newInt
        }
    }
    
    
    private var nick:String?
    var nickName:String{
        get{
            return self.nick!
        }
        set(newString){
            self.nick = newString
        }
    }
    
    private var createDate:String?
    var CreateDate:String
    {
        get
        {
            return self.createDate!
        }
        set(newString)
        {
            self.createDate = newString
        }
    }
    
    private var sessionid:String?
    var sessionID:String
    {
        get{
            return self.sessionid!
        }
        set(newString)
        {
            self.sessionid = newString
        }
    }
    
    private var updatedBy: String?
    var UpdatedBy:String
    {
        get
        {
            return self.updatedBy!
        }
        set(newString)
        {
            self.updatedBy = newString
        }
    }
    
    private var createBy:String?
    var CreateBy: String
    {
        get
        {
            return self.createBy!
        }
        set(newString)
        {
            self.createBy = newString
        }
    }
    
    
    
    private var login_name:String?
    var loginName:String
    {
        get
        {
            return self.login_name!
        }
        set(newName)
        {
            self.login_name = newName
        }
    }
    
    private var user_id:String?
    
    var userID:Int
    {
        get
        {
            return Int(self.user_id!)!
        }
        set(newInt)
        {
            self.user_id = String(newInt)
        }
    }
}
