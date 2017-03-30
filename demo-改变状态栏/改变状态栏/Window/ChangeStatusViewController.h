//
//  ChangeStatusViewController.h
//  改变状态栏
//
//  Created by 王晓栋 on 16/6/17.
//  Copyright © 2016年 百思为科. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeStatusViewController : UIViewController
+ (instancetype)shareInstance;
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;
@property (nonatomic, assign) BOOL statusBarHidden;
@end
