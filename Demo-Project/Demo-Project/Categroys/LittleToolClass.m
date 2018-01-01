//
//  LittleToolClass.m
//  personMerchants
//
//  Created by 百思为科 on 16/4/7.
//  Copyright © 2016年 海尔金融. All rights reserved.
//

#import "LittleToolClass.h"
#import <CommonCrypto/CommonDigest.h>

@implementation LittleToolClass
+ (NSString *)changeTelNumToStart:(NSString *)tel {
    if (tel == nil || [tel isEqualToString:@""]) {
        return @"";
    }else if (tel.length == 11){
        return [tel stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    }else {
        return tel;
    }
}

+ (BOOL)isValidateMobileNumbel:(NSString *)mobileNumbel{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189,181(增加)
     */
    NSString * MOBIL = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189,181(增加)
     22         */
    NSString * CT = @"^1((33|53|8[019])[0-9]|349)\\d{7}$";
    
    /**
     
     25         * 大陆地区固话及小灵通
     
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     
     27         * 号码：七位或八位
     
     28         */
    
    NSString *PHS = @"^0(10|2[0-5789]|\\d{2,3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBIL];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    if (([regextestmobile evaluateWithObject:mobileNumbel]
         || [regextestcm evaluateWithObject:mobileNumbel]
         || [regextestct evaluateWithObject:mobileNumbel]
         || [regextestcu evaluateWithObject:mobileNumbel]
         || [regextestphs evaluateWithObject:mobileNumbel])) {
        return YES;
    }
    
    return NO;
}


+ (NSString *)changeBankNoNumToStart:(NSString *)bankNo {
    if (bankNo == nil || [bankNo isEqualToString:@""]) {
        return @"";
    }else if (bankNo.length > 15){
        return [bankNo stringByReplacingCharactersInRange:NSMakeRange(0, bankNo.length - 4) withString:@"**** **** **** "];
    }else {
        return bankNo;
    }
}
//身份证
+ (NSString *)changeIdCardNumToStart:(NSString *)IdCard {
    if (IdCard == nil || [IdCard isEqualToString:@""]) {
        return @"";
    }else if (IdCard.length > 15){
        return [IdCard stringByReplacingCharactersInRange:NSMakeRange(3, IdCard.length - 7) withString:@"*** **** **** "];
    }else {
        return IdCard;
    }
}


+(UIColor *)colorWithHexColorString:(NSString *)hexColorString{
    if ([hexColorString length] <6){//长度不合法
        return [UIColor blackColor];
    }
    NSString *tempString=[hexColorString lowercaseString];
    if ([tempString hasPrefix:@"0x"]){//检查开头是0x
        tempString = [tempString substringFromIndex:2];
    }else if ([tempString hasPrefix:@"#"]){//检查开头是#
        tempString = [tempString substringFromIndex:1];
    }
    if ([tempString length] !=6){
        return [UIColor blackColor];
    }
    //分解三种颜色的值
    NSRange range;
    range.location =0;
    range.length =2;
    NSString *rString = [tempString substringWithRange:range];
    range.location =2;
    NSString *gString = [tempString substringWithRange:range];
    range.location =4;
    NSString *bString = [tempString substringWithRange:range];
    //取三种颜色值
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString]scanHexInt:&r];
    [[NSScanner scannerWithString:gString]scanHexInt:&g];
    [[NSScanner scannerWithString:bString]scanHexInt:&b];
    return [UIColor colorWithRed:((float) r /255.0f)
                           green:((float) g /255.0f)
                            blue:((float) b /255.0f)
                           alpha:1.0f];
}

+ (UIColor *)dotColor {
    UIColor *color = [UIColor colorWithRed:33.0 / 225.0 green:152.0 / 255.0 blue:228.0 / 255.0 alpha:1.0];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ChangeSkin" ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    if (dictionary && dictionary.count != 0) {
        NSString *strDot = [dictionary objectForKey:@"DotColor"];
        if (strDot) {
            UIColor *colorCon = [LittleToolClass colorWithHexColorString:strDot];
            if (colorCon) {
                color = colorCon;
            }
        }
    }
    return color;
}

+ (UIColor *)sepColorSkin {
    UIColor *color = [UIColor colorWithRed:33.0 / 225.0 green:152.0 / 255.0 blue:228.0 / 255.0 alpha:1.0];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ChangeSkin" ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    if (dictionary && dictionary.count != 0) {
        NSString *strDot = [dictionary objectForKey:@"SepColor"];
        if (strDot) {
            UIColor *colorCon = [LittleToolClass colorWithHexColorString:strDot];
            if (colorCon) {
                color = colorCon;
            }
        }
    }
    return color;
}

+ (UIColor *)naviColor {
    UIColor *color = [UIColor colorWithRed:2.0 / 225.0 green:140.0 / 255.0 blue:229.0 / 255.0 alpha:1.0];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ChangeSkin" ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    if (dictionary && dictionary.count != 0) {
        NSString *strDot = [dictionary objectForKey:@"NaviColor"];
        if (strDot) {
            UIColor *colorCon = [LittleToolClass colorWithHexColorString:strDot];
            if (colorCon) {
                color = colorCon;
            }
        }
    }
    return color;
}

+ (UIColor *)tabBarColor {
    UIColor *color = [UIColor colorWithRed:2.0 / 225.0 green:140.0 / 255.0 blue:229.0 / 255.0 alpha:1.0];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ChangeSkin" ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    if (dictionary && dictionary.count != 0) {
        NSString *strDot = [dictionary objectForKey:@"TabBarColor"];
        if (strDot) {
            UIColor *colorCon = [LittleToolClass colorWithHexColorString:strDot];
            if (colorCon) {
                color = colorCon;
            }
        }
    }
    return color;
}



//判断输入的字符串是否只含有字母和数字并且长度在6-20以内
+(BOOL)creatJudgeString:(NSString *)string{
    
    if (string.length == 0|| string == nil) {
        
        return NO;
        
        
    }else if (string.length < 6||string.length > 20){
        
        return NO;
        
    }else{
        
        NSInteger number = 0;//判断是否含有数字
        
        NSInteger alpha = 0;//判断是否含有字母
        
        NSInteger punct = 0;//判断是否含有标点符号
        
        for (int i=0; i<string.length; i++) {
            
            unichar num = [string characterAtIndex:i];
            
            if (isnumber(num)) {
                
                number++;
            }
            
            if (isalpha(num)) {
                
                alpha++;
                
            }
            
            if (ispunct(num)) {
                
                punct++;
                
            }
            
        }
        
        if (alpha>0 && number>0) {
            
            if (punct == 0) {
                
                return YES;
            }
            
        }
        
        
    }
    
    return NO;
}


+ (BOOL)isValidateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


+ (BOOL)isValidateIdentificationCard:(NSString *)cardNo {
    if ([cardNo stringByReplacingOccurrencesOfString:@" " withString:@""].length == 15) {
        NSString *emailRegex = @"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        return [emailTest evaluateWithObject:cardNo];
    }else if ([cardNo stringByReplacingOccurrencesOfString:@" " withString:@""].length == 18) {
        NSString *emailRegex = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        return [emailTest evaluateWithObject:cardNo];
    }else {
        return FALSE;
    }
    
}
//银行卡19位校验
+ (BOOL)isValidateBankCardNumber:(NSString *)cardNumber{
   
    if (cardNumber.length == 19 ) {
        
        return YES;
    
    }else{
    
        return NO;
    
    }
}
//手机号码格式验证
+ (BOOL)isRightTelNumber:(NSString *)telNumber{

    if (telNumber.length == 11) {
        
        return YES;
    }
    else{
    
        return NO;
    }

}
//姓名检测
+(BOOL)isValidateName:(NSString *)name{
    
    NSString *NAME=@"[\u4E00-\u9FA5]{2,10}(?:(·|•)[\u4E00-\u9FA5]{2,10})*$";
    
    NSPredicate *nameText=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",NAME];
    
    return [nameText evaluateWithObject:name];
}
//姓名验证
+  (BOOL)isRightName:(NSString *)nicName{
    
    int n = 0;
    
    for (int i=0; i<nicName.length; i++) {
        NSRange range=NSMakeRange(i,1);
        NSString *subString=[nicName substringWithRange:range];
        const char *cString=[subString UTF8String];
        if (strlen(cString)==3 ){
        
            n = n + 1;
      }

    }
    if (n == nicName.length && nicName.length>=2 && nicName.length <=8) {
        
    }else{
        return NO;
    }
   return YES;
}
//固话号码验证
//固话验证
+ (BOOL)checkNumber:(NSString *)number{
    if ( number == nil || [number isEqualToString:@"null"]|| [number isEqualToString:@""]) {
        return YES;
    }
    
    //验证输入的固话中不带 "-"符号
    
    NSString * strNum = @"^(0[0-9]{2,3})?([2-9][0-9]{6,7})+(-[0-9]{1,4})?$|(^(13[0-9]|15[0|3|6|7|8|9]|18[8|9])\\d{8}$)";
    
    //验证输入的固话中带 "-"符号
    
    NSString * strNumTel = @"^(0[0-9]{2,3}-)?([2-9][0-9]{6,7})+(-[0-9]{1,4})?$|(^(13[0-9]|15[0|3|6|7|8|9]|18[8|9])\\d{8}$)";
    
    NSPredicate *checktest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", strNum];
    NSPredicate *checktel = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", strNumTel];

    return ([checktest evaluateWithObject:number]);
    
}

//手机号码验证
+ (BOOL )valiMobile:(NSString *)mobile{
    if (mobile.length < 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
    return YES;
}

/*
                                md5
 */


/**
 *  get data's md5 string
 *
 *  @param data source data
 *
 *  @return md5 string
 */

+(NSString *)md5StringWithData:(NSData *)data{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(data.bytes, (CC_LONG)data.length, result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (NSString*)getMD5WithData:(NSData *)data{
    
    CC_MD5_CTX md5;
    
    CC_MD5_Init(&md5);
    CC_MD5_Update(&md5, [data bytes], (CC_LONG)[data length]);
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    NSString* s = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                   digest[0], digest[1],
                   digest[2], digest[3],
                   digest[4], digest[5],
                   digest[6], digest[7],
                   digest[8], digest[9],
                   digest[10], digest[11],
                   digest[12], digest[13],
                   digest[14], digest[15]];
    return s;
    
}



/**
 *  get data's md5 data
 *
 *  @param data source data
 *
 *  @return md5 data
 */
+(NSData *)md5DataWithData:(NSData *)data{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(data.bytes, (CC_LONG)data.length, result);
    return [NSData dataWithBytes:result length:CC_MD5_DIGEST_LENGTH];
}


/**
 *  get string's md5 string
 *
 *  @param str source string
 *
 *  @return md5 string
 */
+(NSString *)md5StringWithString:(NSString *)str{
    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [self md5StringWithData:data];
}
+ (BOOL)addressIsLimited:(nonnull NSString *)address{
    if (address == nil || [address isEqualToString:@""]||[address isEqualToString:@"null"]) {
        return YES;
    }
    if (address.length < 50 || address.length == 50) {
        
        return YES;
        
    }else{
        
        return NO;
        
    }
}
+ (BOOL)companyIsLimited:(nonnull NSString *)company{
    if (company == nil || [company isEqualToString:@""] || [company isEqualToString:@"null"]) {
        return YES;
    }
    if (company.length < 30 || company.length == 30) {
        
        return YES;
        
    }else{
        
        return NO;
        
    }
}
//判断空格
+ (BOOL)isSpace:(NSString *)string{
    
    if ([string isEqualToString:@""]|| [string isEqualToString:@"null"]|| string == nil) {
        return NO;
    }
    BOOL  isStringtoSpace=YES;//是否是空格
     NSString *strSpace =@" ";
    //工作单位
    for(int i =0;i<string.length;i++)    {
        NSString *str = [string substringWithRange:NSMakeRange(i, 1)];//抽取子字符
        if(![str isEqualToString:strSpace]){//判断是否为空格
            isStringtoSpace=NO; //如果是则改变 状态
            break;//结束循环
        }
    }
    
    return isStringtoSpace;
    
//   NSString * s = @" ";
//    if (string.length > 0 && string.length < 50) {
//        for (int i = 0; i < string.length; i++) {
//        NSString *str = [string substringWithRange:NSMakeRange(i, 1)];
//        if ([s isEqualToString: str]) {
//            
//            break;
//            
//        }else{
//        
//            return NO;
//        
//        }
//    
//    }
//    }
//    return YES;
//
}
//判断月收入

+ (BOOL)mthIncLenthWithInc:(NSString *)mthIn{
    if (mthIn == nil || [mthIn isEqualToString:@""] || [mthIn isEqualToString:@"null"]) {
        return YES;
    }
    if ( mthIn.length > 0 && mthIn.length < 12  ) {
        
        return YES;
    }else{
    
        return NO;
    }
}
//***关键方法

+ (BOOL)isIncludeSpecialCharact: (NSString *)str {
    if ([str isEqualToString:@""] || [str isEqualToString:@"null"] || str == nil) {
        
        return NO;
        
    }
    //***需要过滤的特殊字符：~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€。
    NSRange urgentRange = [str rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @"~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€"]];
    if (urgentRange.location == NSNotFound)
    {
        return NO;
    }
    return YES;
}

//***获取字符串
+(BOOL)isIncludeSpecialChar:(NSString *)string{
    //***调用关键方法，获得bool值，yes或者no：
    BOOL ok= [self isIncludeSpecialCharact:string];
    BOOL eMojiOk = [self stringContainsEmoji:string];
    if (ok || (eMojiOk)) {
        return YES;//包含特殊字符串
    }else{
        return NO;//不包含
    }
}
+ (BOOL)stringContainsEmoji:(NSString *)string
{
    if ([string isEqualToString:@"" ]|| string == nil || [string isEqualToString:@"null"]) {
        return NO;
    }
    
__block BOOL returnValue = NO;

[string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                           options:NSStringEnumerationByComposedCharacterSequences
                        usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                            const unichar hs = [substring characterAtIndex:0];
                            if (0xd800 <= hs && hs <= 0xdbff) {
                                if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                    if (0x1d000 <= uc && uc <= 0x1f77f) {
                                        returnValue = YES;
                                    }
                                }
                            } else if (substring.length > 1) {
                                const unichar ls = [substring characterAtIndex:1];
                                if (ls == 0x20e3) {
                                    returnValue = YES;
                                }
                            } else {
                                if (0x2100 <= hs && hs <= 0x27ff) {
                                    returnValue = YES;
                                } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                    returnValue = YES;
                                } else if (0x2934 <= hs && hs <= 0x2935) {
                                    returnValue = YES;
                                } else if (0x3297 <= hs && hs <= 0x3299) {
                                    returnValue = YES;
                                } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                    returnValue = YES;
                                }
                            }
                        }];

return returnValue;
}
@end
