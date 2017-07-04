//
//  BowelAnimation.m
//  香水
//
//  Created by 王晓栋 on 2017/4/9.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "BowelAnimation.h"
@interface BowelAnimation()
{
    UIImageView *bowelImageView;
}

@end

@implementation BowelAnimation

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

    bowelImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,self.frame.size.width,self.frame.size.height)];
    
    NSMutableArray *images = [NSMutableArray array];
    for (int i =1; i< 40; i++) {
        
        NSString *imageName = [NSString stringWithFormat:@"bowel%d",i];
        UIImage *image = [UIImage imageNamed:imageName];
        [images addObject:image];
    }
    bowelImageView.animationImages = images;
    bowelImageView.animationDuration = 4.0;
    bowelImageView.animationRepeatCount = 1.0;
    [bowelImageView startAnimating];
    [self addSubview:bowelImageView];
    
    [self performSelector:@selector(animationStop) withObject:nil afterDelay:bowelImageView.animationDuration];

}
- (void)animationStop{
    
}


@end
