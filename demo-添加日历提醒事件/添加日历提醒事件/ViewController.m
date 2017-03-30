//
//  ViewController.m
//  练习
//
//  Created by 王晓栋 on 16/8/2.
//  Copyright © 2016年 百思为科. All rights reserved.
//

#import "ViewController.h"
#import "CalendarEvent.h"

@interface ViewController ()<CalendarEventDelegate>
@property(nonatomic, strong) CalendarEvent *event;

@end

@implementation ViewController

/**
 给日历添加一个提醒事件
 */
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSTimeInterval hour = 60.f * 60.f;
    NSDate   *currentDate = [NSDate date];
    
    CalendarEvent *event = [[CalendarEvent alloc]init];
    event.eventTitle     = @"这里是北京";
    event.startDate      = [NSDate dateWithTimeInterval:hour * 1 sinceDate:currentDate];
    event.endDate        = [NSDate dateWithTimeInterval:hour * 2 sinceDate:currentDate];
    event.alarmDate      = [NSDate dateWithTimeInterval:hour * 0.5f sinceDate:currentDate];
    event.eventLocation  = @"大北京-首都";
    event.delegate = self;
    self.event = event;
    
}
- (IBAction)save:(id)sender {
    // 开始保存
    [self.event save];
    [self.event remove];
}

/*
 * 保存事件的回调
 */
- (void)calendarEvent:(CalendarEvent *)event savedStatus:(ECalendarEventStatus)status error:(NSError *)error{
    
    if (status == kCalendarEventAccessSavedSucess) {
        
        NSLog(@"保存到日历成功,请查看");
    }
    
}
/*
 *删除事件的回调
 */
- (void)calendarEvent:(CalendarEvent *)event removedStatus:(ECalendarEventStatus)status error:(NSError *)error {
    
    if (status == kCalendarEventAccessSavedFailed) {
        
        NSLog(@"保存失败");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
