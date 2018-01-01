//
//  NSObject+BlockTimer.h
//  Cellbg
//
//  Created by ztf on 15/12/2.
//  Copyright © 2015年 ztf. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TimerBlock)(NSTimer *timer);


@interface NSObject (BlockTimer)

@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)NSNumber *timerIntervalNum;
@property (nonatomic,strong)NSNumber *timerRepeatNum;
@property (nonatomic,assign)TimerBlock timerBlock;


-(void)runTimerWithTimeInterval:(NSTimeInterval)interval repeat:(BOOL)repeat timerBlock:(TimerBlock)timerBlock;
-(void)stopTimer;

@end
