//
//  UIAlertView+Block.m
//  Mazda-E-Commerce
//
//  Created by shijianlong on 15/5/22.
//  Copyright (c) 2015年 ichinadev. All rights reserved.
//

#import "UIAlertView+Block.h"

/**
 OC中的关联就是在已有类的基础上添加对象参数。来扩展原有的类，需要引入#import <objc/runtime.h>头文件。关联是基于一个key来区分不同的关联。
 常用函数: objc_setAssociatedObject       设置关联
 objc_getAssociatedObject       获取关联
 objc_removeAssociatedObjects   移除关联
 */
#import <objc/runtime.h>


@implementation UIAlertView (Block)

static char BlockKey;

// 用Block的方式回调，这时候会默认用self作为Delegate
- (void)showAlertViewWithClickBlock:(ClickBlock)block
{
    if (block) {
        //移除所有关联
        objc_removeAssociatedObjects(self);
        //设置block属性
        self.clickButtonClickBlock = block;
        //设置delegate
        self.delegate = self;
    }
    //调用系统show
    [self show];
}

//实现属性的get方法
- (ClickBlock)clickButtonClickBlock {
    return objc_getAssociatedObject(self, &BlockKey);
}

//实现属性的set方法
- (void)setClickButtonClickBlock:(ClickBlock)clickButtonClickBlock{
    objc_setAssociatedObject(self, &BlockKey, clickButtonClickBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (self.clickButtonClickBlock) {
        ///block传值
        self.clickButtonClickBlock(buttonIndex);
    }
}

@end
