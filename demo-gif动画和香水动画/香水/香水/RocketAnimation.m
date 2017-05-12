//
//  RocketAnimation.m
//  香水
//
//  Created by 王晓栋 on 2017/4/9.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "RocketAnimation.h"
@interface RocketAnimation()
{
    UIImageView *rocketImageView;
}


@end
@implementation RocketAnimation

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

    rocketImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,self.frame.size.width,self.frame.size.height)];
    
    NSMutableArray *images = [NSMutableArray array];
    for (int i =1; i< 27; i++) {
        
        NSString *imageName = [NSString stringWithFormat:@"rocket%d",i];
        UIImage *image = [UIImage imageNamed:imageName];
        [images addObject:image];
    }
    rocketImageView.animationImages = images;
    rocketImageView.animationDuration = 10.0;
    rocketImageView.animationRepeatCount = 1.0;
    [rocketImageView startAnimating];
    
    [self addSubview:rocketImageView];
    

    [self performSelector:@selector(animationStop) withObject:nil afterDelay:rocketImageView.animationDuration];

}
- (void)animationStop{
    
}

@end
