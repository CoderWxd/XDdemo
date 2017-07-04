//
//  SportsCarAnimation.m
//  香水
//
//  Created by 王晓栋 on 2017/4/9.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "SportsCarAnimation.h"

@interface SportsCarAnimation()
{
    UIImageView *sportsCarImageView;
}


@end
@implementation SportsCarAnimation

- (instancetype)init{
    if (self = [super init]) {
        
        [self setUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUI];
    }
    return self;
}
- (void)setUI{
    self.userInteractionEnabled = NO;

    sportsCarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,self.frame.size.width,self.frame.size.height)];
    
    NSMutableArray *images = [NSMutableArray array];
    for (int i =1; i< 40; i++) {
        
        NSString *imageName = [NSString stringWithFormat:@"sportsCar%d",i];
        UIImage *image = [UIImage imageNamed:imageName];
        [images addObject:image];
    }
    sportsCarImageView.animationImages = images;
    sportsCarImageView.animationDuration = 10.0;
    sportsCarImageView.animationRepeatCount = 1.0;
    [sportsCarImageView startAnimating];
    [self addSubview:sportsCarImageView];
    
    [self performSelector:@selector(animationStop) withObject:nil afterDelay:sportsCarImageView.animationDuration];
    
}
- (void)animationStop{
    
}

@end
