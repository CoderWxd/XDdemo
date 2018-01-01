//
//  UITextField+Placeholder.m
//  01-BuDeJie
//
//  Created by xmg on 16/1/22.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "UITextField+Placeholder.h"
#import <objc/message.h>
// runtime:主要目的操作系统的类

// OC系统自带控件中,所有的子控件都是懒加载
@implementation UITextField (Placeholder)

+ (void)load
{
    Method setPlaceholderMethod = class_getInstanceMethod(self, @selector(setPlaceholder:));
     Method xmg_setPlaceholderMethod = class_getInstanceMethod(self, @selector(xmg_setPlaceholder:));
    
    // 交互方法
    method_exchangeImplementations(setPlaceholderMethod, xmg_setPlaceholderMethod);
    
}

// 设置占位文字颜色
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    // 1.保存占位文字颜色到系统的类,关联
    // object:保存到哪个对象中
    // key:属性名
    // value:属性值
    // policy:策略
    objc_setAssociatedObject(self, @"placeholderColor", placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    UILabel *placeholderLabel = [self valueForKeyPath:@"placeholderLabel"];
    placeholderLabel.textColor = placeholderColor;
}

- (UIColor *)placeholderColor
{
    return objc_getAssociatedObject(self, @"placeholderColor");
}


- (void)xmg_setPlaceholder:(NSString *)placeholder
{
    // 设置占位文字
    [self xmg_setPlaceholder:placeholder];
    
    // 设置占位文字颜色
    self.placeholderColor = self.placeholderColor;
}

@end
