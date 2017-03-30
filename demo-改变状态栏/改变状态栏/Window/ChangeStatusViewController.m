//
//  ChangeStatusViewController.m
//  改变状态栏
//
//  Created by 王晓栋 on 16/6/17.
//  Copyright © 2016年 百思为科. All rights reserved.
//

#import "ChangeStatusViewController.h"

@interface ChangeStatusViewController ()

@end

@implementation ChangeStatusViewController


#pragma mark - 单例
static id instance_;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance_ = [[self alloc] init];
    });
    return instance_;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance_ = [super allocWithZone:zone];
    });
    return instance_;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
        
}


#pragma mark - 状态栏控制
- (BOOL)prefersStatusBarHidden
{
    return self.statusBarHidden;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return self.statusBarStyle;
    
}

#pragma mark - setter
- (void)setStatusBarHidden:(BOOL)statusBarHidden
{
     _statusBarHidden = statusBarHidden;
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    
}

- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle
{
    _statusBarStyle = statusBarStyle;
    
    [self setNeedsStatusBarAppearanceUpdate];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
