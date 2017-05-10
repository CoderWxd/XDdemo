//
//  UIView+AddClickEvent.m
//  给任意的UIView添加点击事件
//
//  Created by 王晓栋 on 16/7/25.
//  Copyright © 2016年 百思为科. All rights reserved.
//

#import "UIView+AddClickEvent.h"
#import <objc/message.h>
@interface UIView ()

@property void(^clickedAction)(id);

@end
@implementation UIView (AddClickEvent)
- (void)setClickedAction:(void (^)(id))clickedAction{
    objc_setAssociatedObject(self, @"AddClickEvent", clickedAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void (^)(id))clickedAction{
    return objc_getAssociatedObject(self, @"AddClickEvent");
    
}
- (void)addClickedBlock:(void (^)(id))clickedAction{
    self.clickedAction = clickedAction;
    // 判断当前是否有交互事件 如果没有，则所有的交互事件会添加到gestureRecognizers中。
    if (!self.gestureRecognizers) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
        [self addGestureRecognizer:tap];
    }
    
}
- (void)tap{
    if (self.clickedAction) {
        self.clickedAction(self);
    }
}

@end
