//
//  NSObject+DLSubViews.h
//  Demo-Project
//
//  Created by 王晓栋 on 2018/8/10.
//  Copyright © 2018年 王晓栋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DLSubViews)

/**
 *  打印子视图
 *
 *  @param view    需要打印的对象
 *  @param level   打印的索引
 *
 */
- (void)getSub:(UIView *)view andLevel:(int)level;

@end
