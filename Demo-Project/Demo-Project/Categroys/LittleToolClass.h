//
//  LittleToolClass.h
//  personMerchants
//
//  Created by 百思为科 on 16/4/7.
//  Copyright © 2016年 海尔金融. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import "ToolMacro.h"

@interface LittleToolClass : NSObject

+ (NSString *)changeTelNumToStart:(NSString *)tel;

+ (NSString *)changeIdCardNumToStart:(NSString *)IdCard ;

+ (NSString *)changeBankNoNumToStart:(NSString *)bankNo;

+(UIColor *)colorWithHexColorString:(NSString *)hexColorString;

//手机号合法性
+ (BOOL)isValidateMobileNumbel:(NSString *)mobileNumbel;
//姓名检测
+(BOOL)isValidateName:(NSString *)name;

+ (UIColor *)dotColor;

+ (UIColor *)sepColorSkin;

+ (UIColor *)naviColor;

+ (UIColor *)tabBarColor;

+(BOOL)creatJudgeString:(NSString *)string;
//手机号码格式验证
+ (BOOL )valiMobile:(NSString *)mobile;

//邮箱检测
+ (BOOL)isValidateEmail:(NSString *)email;

//判断月收入是否超出限制
+ (BOOL)mthIncLenthWithInc:(NSString *)mthIn;

//判断是否含有特殊字符
+(BOOL)isIncludeSpecialChar:(NSString *)string;

//身份证合法性
+ (BOOL)isValidateIdentificationCard:(NSString *)cardNo;

//银行卡合法性
+ (BOOL)isValidateBankCardNumber:(NSString *)cardNumber;

//手机号长度判断
+ (BOOL)isRightTelNumber:(NSString *)telNumber;

//判断姓名为汉字2-8位
+  (BOOL)isRightName:(NSString *)nicName;

+ (BOOL)isSpace:(NSString *) string;
//工作单位
+ (BOOL)companyIsLimited:(nonnull NSString *)company;

+(NSString *)md5StringWithData:(NSData *)data;

+ (NSString *)getMD5WithData:(NSData *)data;

+(NSData *)md5DataWithData:(NSData *)data;

+(NSString *)md5StringWithString:(NSString *)str;
//判断地址是否超出限制
+(BOOL)addressIsLimited:(NSString *)address;
//判断固话电话
+ (BOOL)checkNumber:(NSString *)number;
@end
