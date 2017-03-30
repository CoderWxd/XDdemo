//
//  UIView+Uitls.h
//  XDAutoMove
//
//  Created by 王晓栋 on 2017/3/30.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Uitls)

- (void)setBorderWidth:(CGFloat)with;

- (CGFloat)borderWidth;

- (void)setBorderColor:(UIColor *)color;

- (UIColor *)borderColor;

- (CGFloat)x;

- (CGFloat)y;

- (CGFloat)width;

- (CGFloat)height;

- (CGPoint)origin;

- (CGSize)size;

- (void)setX:(CGFloat)x;

- (void)setY:(CGFloat)y;

- (void)setWidth:(CGFloat)width;

- (void)setHeight:(CGFloat)height;

- (void)setOrigin:(CGPoint)origin;

- (void)setSize:(CGSize)size;

- (CGFloat)left;

- (CGFloat)right;

- (CGFloat)top;

- (CGFloat)bottom;
@end

@interface UIView(FindFirstResponder)
- (UIView *)findFirstResponder;
@end
