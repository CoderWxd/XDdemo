//
//  NSObject+BlockTimer.m
//  Cellbg
//
//  Created by ztf on 15/12/2.
//  Copyright © 2015年 ztf. All rights reserved.
//

#import "NSObject+BlockTimer.h"

#import "objc/runtime.h"



@implementation NSObject (BlockTimer)


static char timer_Key;
static char timerIntervalNum_Key;
static char timerRepeatNum_Key;
static char timerBlock_Key;



-(void)runTimerWithTimeInterval:(NSTimeInterval)interval repeat:(BOOL)repeat timerBlock:(TimerBlock)timerBlock
{
    self.timerIntervalNum = [NSNumber numberWithDouble:interval];
    self.timerRepeatNum = [NSNumber numberWithBool:repeat];
    self.timerBlock = timerBlock;
    
    
    [self runTimer:YES];
}


-(void)stopTimer
{
    [self runTimer:NO];
}

-(void)runTimer:(BOOL)run
{
    if (self.timer !=nil && [self.timer isKindOfClass:[NSTimer class]]) {
        if ([self.timer isValid]) {
            [self.timer invalidate];
        }
    }
    if (run) {
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:[self.timerIntervalNum doubleValue]
                                                  target:self
                                                selector:@selector(timerRun:)
                                                userInfo:nil
                                                 repeats:[self.timerRepeatNum boolValue]];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
        if ([self.timer isValid]) {
            [self.timer fire];
        }
    }
}

-(void)timerRun:(NSTimer *)timer
{
    if (self.timerBlock) {
        self.timerBlock(timer);
    }
}





-(NSTimer *)timer
{
    return objc_getAssociatedObject(self, &timer_Key);
}

-(NSNumber *)timerIntervalNum
{
    return objc_getAssociatedObject(self, &timerIntervalNum_Key);
}

-(NSNumber *)timerRepeatNum
{
    return objc_getAssociatedObject(self, &timerRepeatNum_Key);
}

-(TimerBlock)timerBlock
{
    return objc_getAssociatedObject(self, &timerBlock_Key);

}

-(void)setTimer:(NSTimer *)timer
{
    objc_setAssociatedObject(self, &timer_Key, timer, OBJC_ASSOCIATION_RETAIN);
}

-(void)setTimerBlock:(TimerBlock)timerBlock
{
    objc_setAssociatedObject(self, &timerBlock_Key, timerBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void)setTimerIntervalNum:(NSNumber *)timerIntervalNum
{
    objc_setAssociatedObject(self, &timerIntervalNum_Key, timerIntervalNum, OBJC_ASSOCIATION_RETAIN);
}
-(void)setTimerRepeatNum:(NSNumber *)timerRepeatNum
{
    objc_setAssociatedObject(self, &timerRepeatNum_Key, timerRepeatNum, OBJC_ASSOCIATION_RETAIN);
}


@end
