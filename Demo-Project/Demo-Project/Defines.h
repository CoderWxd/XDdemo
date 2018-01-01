//
//  Defines.h
//  Demo-Project
//
//  Created by 王晓栋 on 2018/1/5.
//  Copyright © 2018年 王晓栋. All rights reserved.
//

#ifndef Defines_h
#define Defines_h

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define IOS_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])
#define IOS_VERSION_IS_ABOVE_7 (IOS_VERSION >= 7.f)
#define IOS_VERSION_IS_ABOVE_11 (IOS_VERSION >= 11.f)

#define kKFLiveRoomContentViewTopMarginOnIOS7 (0.f)

#define kKFLiveRoomContentViewTopMarginOnIOS7 (0.f)


#define AddHeightForView  SCREEN_HEIGHT > 480 ? (568.0-480.0):0.0f

#define IS_iPhoneX (SCREEN_WIDTH == 375 && SCREEN_WIDTH == 812 ? YES : NO)
#define isIPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//状态栏、导航栏、标签栏高度
#define STATUS_HEIGHT   (IS_iPhoneX ? 44.f : 20.f) // ([UIApplication sharedApplication].statusBarFrame.size.height)
#define NAVIGATIONBAR_HEIGHT 44.f

#define TABBAR_HEIGHT  (IS_iPhoneX ? (49.f+34.f) : 49.f)


#define StatusBarHeight  (IS_iPhoneX ? 44.f : 20.f)

// Tabbar safe bottom margin.
#define  LL_TabbarSafeBottomMargin              (IS_iPhoneX ? 34.f : 0.f)
// Status bar & navigation bar height.
#define  LL_StatusBarAndNavigationBarHeight     (IS_iPhoneX ? 88.f : 64.f)


// Tabbar safe bottom margin.
#define  LL_TabbarSafeBottomMargin              (IS_iPhoneX ? 34.f : 0.f)
// Status bar & navigation bar height.
#define  LL_StatusBarAndNavigationBarHeight     (IS_iPhoneX ? 88.f : 64.f)

#define LL_ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})

#define Color_Ground [UIColor whiteColor]


//rbg转UIColor(16进制)
#define RGB16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBA16(rgbaValue) [UIColor colorWithRed:((float)((rgbaValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbaValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbaValue & 0xFF))/255.0 alpha:((float)((rgbaValue & 0xFF000000) >> 24))/255.0]

#define RGBAColor(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#endif /* Defines_h */
