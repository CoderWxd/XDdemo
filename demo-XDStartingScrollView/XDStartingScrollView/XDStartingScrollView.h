//
//  XDStartingScrollView.h
//  XDStartingScrollView
//
//  Created by 王晓栋 on 16/7/5.
//  Copyright © 2016年 百思为科. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XDStartingScrollView;

@protocol XDStartingScrollViewDelegate <NSObject>
@optional
- (void)xdStartingScrollView:(XDStartingScrollView *)scrollView didSelectItemAtIndex:(NSInteger)index;
@end

typedef NS_ENUM(NSInteger, HTInfiniteScrollViewDirection) {
    /** 水平滚动（左右滚动） */
    HTInfiniteScrollViewDirectionHorizontal = 0,
    /** 垂直滚动（上下滚动） */
    HTInfiniteScrollViewDirectionVertical
};

@interface XDStartingScrollView : UIView
/** 图片数据(里面存放UIImage对象) */
@property (nonatomic, strong) NSArray *images;
/** 滚动方向 */
@property (nonatomic, assign) HTInfiniteScrollViewDirection direction;
/** 代理 */
@property (nonatomic, weak) id<XDStartingScrollViewDelegate> delegate;
@property (nonatomic, weak, readonly) UIPageControl *pageControl;
@end
