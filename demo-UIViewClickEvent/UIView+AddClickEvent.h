//
//  UIView+AddClickEvent.h
//  给任意的UIView添加点击事件
//
//  Created by 王晓栋 on 16/7/25.
//  Copyright © 2016年 百思为科. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AddClickEvent)

 - (void)addClickedBlock:(void(^)(id obj))clickedAction;

@end
