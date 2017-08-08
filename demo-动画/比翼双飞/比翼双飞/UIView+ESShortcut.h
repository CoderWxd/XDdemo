//
//  UIView+ESShortcut.h
//  ESFramework
//
//  Created by Elf Sundae on 14-4-6.
//  Copyright (c) 2014 www.0x123.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define const_explosion_time 1.0
#define weak(obj) __weak typeof(obj) _weak##obj = obj;
#define strong(obj) __strong typeof(obj) _strong##obj = obj;


#define ESWeak_(var, weakVar)                   __weak __typeof(&*var) weakVar = var;
#define ESWeak(var)                             ESWeak_(var, weak_##var);
#define ESWeakSelf                              ESWeak(self);

#define ESStrong_DoNotCheckNil(weakVar, var)    __typeof(&*weakVar) var = weakVar;
#define ESStrong_(weakVar, var)                 ESStrong_DoNotCheckNil(weakVar, var); if (!var) return;
#define ESStrong(var)                           ESStrong_(weak_##var, _##var);
#define ESStrongSelf                            ESStrong(self);


/**
 * Shortcuts for view's frame, center, size, etc.
 */
@interface UIView (ESShortcut)

/// frame.origin
@property (nonatomic) CGPoint origin;
/// frame.size
@property (nonatomic) CGSize size;
/// Shortcut for frame.origin.x
@property (nonatomic) CGFloat left;
/// Shortcut for frame.origin.y
@property (nonatomic) CGFloat top;
/// Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat right;
/// Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat bottom;
/// Shortcut for frame.size.width
@property (nonatomic) CGFloat width;
/// Shortcut for frame.size.height
@property (nonatomic) CGFloat height;
/// Shortcut for center.x
@property (nonatomic) CGFloat centerX;
/// Shortcut for center.y
@property (nonatomic) CGFloat centerY;

@end
