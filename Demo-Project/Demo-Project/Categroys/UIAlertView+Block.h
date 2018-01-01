//
//  UIAlertView+Block.h
//  Mazda-E-Commerce
//
//  Created by shijianlong on 15/5/22.
//  Copyright (c) 2015年 ichinadev. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ClickBlock) (NSInteger index);
@interface UIAlertView (Block)
/**
 *  像类别中添加属性  block
 */
@property (nonatomic, copy)ClickBlock clickButtonClickBlock;

/**
 *  加入新的show方法，这里的show方法加入block
 */
- (void)showAlertViewWithClickBlock:(ClickBlock)block;
@end
