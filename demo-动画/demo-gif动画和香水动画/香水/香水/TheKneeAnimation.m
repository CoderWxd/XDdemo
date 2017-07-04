//
//  TheKneeAnimation.m
//  香水
//
//  Created by 王晓栋 on 2017/4/9.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "TheKneeAnimation.h"
#import "AnimationModel.h"
@interface TheKneeAnimation()
{
    UIImageView *bottleImgeView;
}

@property(nonatomic,strong)AnimationModel *animationModel;
@end

@implementation TheKneeAnimation

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
        self.animationModel = [[AnimationModel alloc]init];
    self.animationModel.duration = 8.0;
    self.animationModel.nameEnd = 27;
    self.animationModel.imageName = @"rocket";
    self.animationModel.delayDuration = 0;
    self.animationModel.animationFrame = [UIScreen mainScreen].bounds;
    self.animationModel.superView = self;
    [self.animationModel runQueue];
    __weak typeof(self) weakSelf = self;
    self.animationModel.stopBlock = ^(UIImageView *imageView){
        
        [imageView removeFromSuperview];
        imageView.image = nil;
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf startNextAnimation];
    };
    
}
- (void)startNextAnimation{
    self.animationModel = [[AnimationModel alloc]init];
    self.animationModel.duration = 8.0;
    self.animationModel.nameEnd = 40;
    self.animationModel.imageName = @"sportsCar";
    self.animationModel.delayDuration = 0;
    self.animationModel.animationFrame = [UIScreen mainScreen].bounds;
    self.animationModel.superView = self;
    [self.animationModel runQueue];
    self.animationModel.stopBlock = ^(UIImageView *_animationView){
        _animationView.alpha = 1.0;
        [UIView animateWithDuration:2.0 animations:^{
            _animationView.alpha = 0.0;
        } completion:^(BOOL finished) {
            _animationView.image = nil;
            [_animationView removeFromSuperview];
            
        }];
    };
    
}
@end
