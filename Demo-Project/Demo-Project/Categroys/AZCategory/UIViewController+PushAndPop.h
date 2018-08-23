//
//  UIViewController+PushAndPop.h
//  AZCategoryDemo
//
//  Created by Alfred Zhang on 2017/7/30.
//  Copyright © 2017年 Alfred Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (PushAndPop)
/**
 ///多次push同一控制器,返回跳转,手动设置跳转到第几个控制器
 */
+ (NSUInteger)cyclePushLimitNumber;

@end
