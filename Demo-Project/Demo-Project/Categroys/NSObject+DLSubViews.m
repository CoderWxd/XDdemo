//
//  NSObject+DLSubViews.m
//  Demo-Project
//
//  Created by 王晓栋 on 2018/8/10.
//  Copyright © 2018年 王晓栋. All rights reserved.
//

#import "NSObject+DLSubViews.h"

@implementation NSObject (DLSubViews)
// 获取子视图
- (void)getSub:(UIView *)view andLevel:(int)level {
    NSArray *subviews = [view subviews];
    if ([subviews count] == 0) return;
    for (UIView *subview in subviews) {
        
        NSString *blank = @"";
        
        for (int i = 1; i < level; i++) {
            blank = [NSString stringWithFormat:@"  %@", blank];
        }
        NSLog(@"%@%d: %@", blank, level, subview.class);
        [self getSub:subview andLevel:(level+1)];
    }
}

@end
