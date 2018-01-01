//
//  keyChain.h
//  ceshi
//
//  Created by 王晓栋 on 16/6/7.
//  Copyright © 2016年 百思为科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>
#define KEY_PASSWORD  @"com.rry.app.password"
#define KEY_USERNAME_PASSWORD  @"com.rry.app.usernamepassword"
@interface keyChain : NSObject
+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;
@end