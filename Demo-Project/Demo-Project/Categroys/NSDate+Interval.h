//
//  NSDate+Interval.h
//  日期处理
//
//  Created by xmg on 16/1/30.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef enum {
//    /** 天 */
//    XMGIntervalIndexDay = 0,
//    /** 小时 */
//    XMGIntervalIndexHour = 1,
//    /** 分钟 */
//    XMGIntervalIndexMinute = 2,
//    /** 秒 */
//    XMGIntervalIndexSecond = 3,
//} XMGIntervalIndex;

///** 天 */
//extern NSString * const XMGIntervalDayKey;
///** 小时 */
//extern NSString * const XMGIntervalHourKey;
///** 分钟 */
//extern NSString * const XMGIntervalMinuteKey;
///** 秒 */
//extern NSString * const XMGIntervalSecondKey;

//typedef struct {
//    /** 天 */
//    NSInteger day;
//    /** 小时 */
//    NSInteger hour;
//    /** 分钟 */
//    NSInteger minute;
//    /** 秒 */
//    NSInteger second;
//} XMGInterval;

@interface XMGInterval : NSObject
@property (nonatomic, assign) NSInteger xmg_day NS_AVAILABLE_IOS(6_0);
/** 天 */
@property (nonatomic, assign) NSInteger day NS_DEPRECATED_IOS(2_0, 7_0, "Use xmg_day");
/** 小时 */
@property (nonatomic, assign) NSInteger hour;
/** 分钟 */
@property (nonatomic, assign) NSInteger minute;
/** 秒 */
@property (nonatomic, assign) NSInteger second;
@end

@interface NSDate (Interval)

- (XMGInterval *)xmg_intervalSinceDate:(NSDate *)date;

//- (XMGInterval)xmg_intervalSinceDate:(NSDate *)date;

///**
// *  天 XMGIntervalDayKey
// *  小时 XMGIntervalHourKey
// *  分钟 XMGIntervalMinuteKey
// *  秒 XMGIntervalSecondKey
// */
//- (NSDictionary *)xmg_intervalSinceDate:(NSDate *)date;

///**
// *  0 ： 天 XMGIntervalIndexDay
// *  1 ： 小时 XMGIntervalIndexHour
// *  2 ： 分钟 XMGIntervalIndexMinute
// *  3 ： 秒 XMGIntervalIndexSecond
// */
//- (NSArray *)xmg_intervalSinceDate:(NSDate *)date;

- (void)xmg_intervalSinceDate:(NSDate *)date day:(NSInteger *)dayP hour:(NSInteger *)hourP minute:(NSInteger *)minuteP second:(NSInteger *)secondP;
/**
 * 是否为今天
 */
- (BOOL)xmg_isInToday;

/**
 * 是否为昨天
 */
- (BOOL)xmg_isInYesterday;

/**
 * 是否为明天
 */
- (BOOL)xmg_isInTomorrow;

/**
 * 是否为今年
 */
- (BOOL)xmg_isInThisYear;
@end
