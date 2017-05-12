//
//  NormalButton.m
//  手势解锁
//
//  Created by 王晓栋 on 16/8/1.
//  Copyright © 2016年 百思为科. All rights reserved.
//

#import "NormalButton.h"

@implementation NormalButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init{
    if (self == [super init]) {
        
        [self setupUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setBackgroundColor:[UIColor whiteColor]];
//    [self]
}

@end
