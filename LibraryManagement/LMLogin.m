//
//  LMLogin.m
//  LibraryManagement
//
//  Created by Oyoung on 15/11/29.
//  Copyright © 2015年 Oyoung. All rights reserved.
//

#import "LMLogin.h"

@implementation LMLogin

+ (void)loginWithName:(NSString *)name password:(NSString *)passwd success:(void (^)(NSData *, NSURLResponse *))success failure:(void (^)(enum LoginResult, NSString *))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@?login_name=%@&&password=%@", @"http://120.55.189.165:8081/chaofan/login/doLogin",name, passwd];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    config.timeoutIntervalForRequest = 15;
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if( error == nil){
            NSError *perror = nil;
            NSDictionary  *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&perror];
            
            NSString *code = dict[@"code"];
            NSString *msg = dict[@"msg"];
            
            
        }
        else
        {
            
        }
        
        
    }];
    [task resume];
    
}

@end
