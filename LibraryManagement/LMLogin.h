//
//  LMLogin.h
//  LibraryManagement
//
//  Created by Oyoung on 15/11/29.
//  Copyright © 2015年 Oyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

enum LoginResult;

@interface LMLogin : NSObject

+ (void)loginWithName:(NSString *)name password:(NSString *)passwd success:(void (^)(NSData *data, NSURLResponse * response))success failure:(void (^)(enum LoginResult result, NSString *msg))failure;

@end
