//
//  AnimationFlyWingView.m
//  飞升上神
//
//  Created by 王晓栋 on 2017/8/3.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "AnimationFlyWingView.h"
#import "UIView+ESShortcut.h"
@interface AnimationFlyWingView()
{
    UIImageView *_lakeImV;
    UIImageView *_lotusMobileImV;
    UIImageView *_whiteLotusImV;
    UIImageView *_lotusHigMobileImV;
    UIImageView *_leftGreenBirdsImV;
    UIImageView *_leftBirdsImV;
    UIImageView *_frontLotusImV;
    UIImageView *_rightMandarinImV;
    UIImageView *_butterfly1ImV;
    UIImageView *_butterfly2ImV;
    UIImageView *_leftMandarinImV;
    UIImageView *_wordsImV;
    
    UIImageView *_rightGreBirdsImV;
    UIImageView *_rightBirdsfly;
}

@end

@implementation AnimationFlyWingView

- (void)dealloc{
    NSLog(@"%s",__func__);
}
- (instancetype)init{
    if (self = [super init]) {
        [self customUI];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self customUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self customUI];
        
    }
    return self;
}
- (void)customUI{
    self.userInteractionEnabled = NO;
    //flywing_lake
    UIImage *image = [UIImage imageNamed:@"flywing_lake"];
    float width = image.size.width/3;
    float height = image.size.height/3;
    _lakeImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,SCREENHEIGHT - 80 - height, SCREENWIDTH, height)];
    _lakeImV.image = image;
    [self addSubview:_lakeImV];
    
    //flywing_words
    image = [UIImage imageNamed:@"flywing_words"];
    width = image.size.width/3.0;
    height = image.size.height/3.0;
    _wordsImV = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH/2 - width/2,_lakeImV.top - 40, width, height)];
    _wordsImV.image = image;
    [self addSubview:_wordsImV];
    

    
    //flywing_right_mandarin
    image = [UIImage imageNamed:@"flywing_right_mandarin"];
    width = image.size.width/3;
    height = image.size.height/3;
    _rightMandarinImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, width, height)];
    _rightMandarinImV.image = image;
    [self addSubview:_rightMandarinImV];
    _rightMandarinImV.top = _lakeImV.top + 40;
    
    
    //flywing_lotus_mobile
    image = [UIImage imageNamed:@"flywing_lotus_mobile"];
     width = image.size.width/3;
     height = image.size.height/3;
    _lotusMobileImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, width, height)];
    _lotusMobileImV.image = image;
    [self addSubview:_lotusMobileImV];
    _lotusMobileImV.centerY = _lakeImV.centerY - 20;
    
    //flywing_whitelotus
    image = [UIImage imageNamed:@"flywing_whitelotus"];
    width = image.size.width/3;
    height = image.size.height/3;
    _whiteLotusImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, width, height)];
    _whiteLotusImV.image = image;
    [self addSubview:_whiteLotusImV];
    _whiteLotusImV.top = _lakeImV.top + 10;
    _whiteLotusImV.right = _lakeImV.right;
    
    //flywing_lotus_highly_mobile
    image = [UIImage imageNamed:@"flywing_lotus_highly_mobile"];
    height = image.size.height/3;
    _lotusHigMobileImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, 0)];
    _lotusHigMobileImV.image = image;
    [self addSubview:_lotusHigMobileImV];
    _lotusHigMobileImV.bottom = _lakeImV.bottom -20;
    
    //左飞绿鸟 flywing_left_green_birdsfly
    image = [UIImage imageNamed:@"flywing_left_green_birdsfly"];
    width = image.size.width/3;
    height = image.size.height/3;
    _leftGreenBirdsImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, width, height)];
    _leftGreenBirdsImV.image = image;
    [self addSubview:_leftGreenBirdsImV];
    _leftGreenBirdsImV.bottom = 0;
    _leftGreenBirdsImV.left = SCREENWIDTH -30;
    
    //左飞鸟 flywing_left_birdsfly
    image = [UIImage imageNamed:@"flywing_left_birdsfly"];
    width = image.size.width/3;
    height = image.size.height/3;
    _leftBirdsImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, width, height)];
    _leftBirdsImV.image = image;
    [self addSubview:_leftBirdsImV];
    _leftBirdsImV.left = SCREENWIDTH;

    //flywing_frontlotus
    image = [UIImage imageNamed:@"flywing_frontlotus"];
    width = image.size.width/3;
    height = image.size.height/3;
    _frontLotusImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, 0, 0)];
    _frontLotusImV.image = image;
    [self addSubview:_frontLotusImV];
    _frontLotusImV.bottom = _lakeImV.bottom -20;
    
    //flywing_butterfly1-1
    
    image = [UIImage imageNamed:@"flywing_butterfly1-1"];
    width = image.size.width/4;
    height = image.size.height/4;
    _butterfly1ImV = [[UIImageView alloc]initWithFrame:CGRectMake(10,0, width, height)];
    NSMutableArray<UIImage *> *images1 = [NSMutableArray array];
    UIImage *image1 = [UIImage imageNamed:@"flywing_butterfly1-1"];
    if (image1) {
    [images1 addObject:image1];
    }
    UIImage *image2 = [UIImage imageNamed:@"flywing_butterfly1-2"];
    if (image2) {
        [images1 addObject:image2];
    }
    _butterfly1ImV.animationImages = images1;
    _butterfly1ImV.animationDuration = 0.4;
    _butterfly1ImV.image = image;
    [self addSubview:_butterfly1ImV];
    _butterfly1ImV.centerY =_lakeImV.centerY;
    _butterfly1ImV.left = 60;
    
     //flywing_butterfly2-1
    image = [UIImage imageNamed:@"flywing_butterfly2-1"];
    width = image.size.width/4;
    height = image.size.height/4;
    _butterfly2ImV = [[UIImageView alloc]initWithFrame:CGRectMake(10,0, width, height)];
    NSMutableArray<UIImage *> *images2 = [NSMutableArray array];
    UIImage *image3 = [UIImage imageNamed:@"flywing_butterfly2-1"];
    if (image3) {
        [images2 addObject:image3];
    }
    UIImage *image4 = [UIImage imageNamed:@"flywing_butterfly2-2"];
    if (image4) {
        [images2 addObject:image4];
    }
    _butterfly2ImV.animationImages = images2;
    _butterfly2ImV.animationDuration = 0.4;
    _butterfly2ImV.image = image;
    [self addSubview:_butterfly2ImV];
    [self insertSubview:_butterfly2ImV belowSubview:_lotusHigMobileImV];
    _butterfly2ImV.bottom = _lakeImV.bottom;
    _butterfly2ImV.right = SCREENWIDTH - 40;
    _butterfly2ImV.transform = CGAffineTransformMakeRotation(-M_PI/4);
    
    //flywing_left_mandarin
    image = [UIImage imageNamed:@"flywing_left_mandarin"];
    width = image.size.width/3.5;
    height = image.size.height/3.5;
    _leftMandarinImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, width, height)];
    _leftMandarinImV.image = image;
    [self addSubview:_leftMandarinImV];
    _leftMandarinImV.bottom = _lakeImV.bottom -40;
    _leftMandarinImV.right = _lakeImV.right - 50;
    [self insertSubview:_leftMandarinImV belowSubview:_lotusHigMobileImV];
    
    //flywing_right_birdsfly
    image = [UIImage imageNamed:@"flywing_right_birdsfly"];
    width = image.size.width/3.0;
    height = image.size.height/3.0;
    _rightBirdsfly = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, width, height)];
    _rightBirdsfly.image = image;
    [self addSubview:_rightBirdsfly];
    _rightBirdsfly.bottom = SCREENHEIGHT/2 - 40;
    _rightBirdsfly.right = 0;

    //flywing_right_green_birdsfly
    image = [UIImage imageNamed:@"flywing_right_green_birdsfly"];
    width = image.size.width/3.0;
    height = image.size.height/3.0;
    _rightGreBirdsImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, width, height)];
    _rightGreBirdsImV.image = image;
    [self addSubview:_rightGreBirdsImV];
    _rightGreBirdsImV.right = 0;
    _rightGreBirdsImV.bottom = _rightBirdsfly.top;

    _lakeImV.hidden = YES;
    _lotusMobileImV.hidden = YES;
    _whiteLotusImV.hidden = YES;
    _lotusHigMobileImV.hidden = YES;
    _frontLotusImV.hidden = YES;
    _rightMandarinImV.hidden = YES;
    _butterfly1ImV.hidden = YES;
    _butterfly2ImV.hidden = YES;
    _leftMandarinImV.hidden = YES;
    _wordsImV.hidden = YES;
    _rightGreBirdsImV.hidden = YES;
    _rightBirdsfly.hidden = YES;

    [self startAnimation];

}

#pragma mark start

- (void)startAnimation{
    
    _lakeImV.hidden = NO;
    _lotusMobileImV.hidden = NO;
    _whiteLotusImV.hidden = NO;
    _lakeImV.alpha = 0.0;
    _lotusMobileImV.alpha = 0.0;
    _whiteLotusImV.alpha = 0.0;
    ESWeakSelf;

    [UIView animateWithDuration:1.5 animations:^{
        _lakeImV.alpha = 1.0;
        _lotusMobileImV.alpha = 1.0;
        _whiteLotusImV.alpha = 1.0;
    }completion:^(BOOL finished) {
        ESStrongSelf;
        //循环移动
        [_self playRecyclingMobileWithImV:_lotusMobileImV];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [_self playRecyclingMobileWithImV:_whiteLotusImV];

        });
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _lotusHigMobileImV.hidden = NO;
        _lotusHigMobileImV.alpha = 0.0;
        UIImage *image = [UIImage imageNamed:@"flywing_lotus_highly_mobile"];
        CGFloat width = image.size.width/3;
        CGFloat height = image.size.height/3;
        [UIView animateWithDuration:1.5 animations:^{
            _lotusHigMobileImV.alpha = 1.0;
            _lotusHigMobileImV.height = height;
            _lotusHigMobileImV.bottom = _lakeImV.bottom -20;
        }];
        
        image = [UIImage imageNamed:@"flywing_frontlotus"];
        width = image.size.width/3.5;
        height = image.size.height/3.5;
        _frontLotusImV.hidden = NO;
        _frontLotusImV.alpha = 0.0;
        [UIView animateWithDuration:1.5 animations:^{
            _frontLotusImV.alpha = 1.0;
            _frontLotusImV.width = width;
            _frontLotusImV.height = height;
            _frontLotusImV.bottom = _lakeImV.bottom -20;
        }];
        
        
        _rightMandarinImV.hidden = NO;
        _rightMandarinImV.transform = CGAffineTransformMakeScale(0.4, 0.4);
        [UIView animateWithDuration:2.0 animations:^{
            _rightMandarinImV.transform = CGAffineTransformMakeScale(0.6, 0.6);

        }];
        [UIView animateWithDuration:4.0 animations:^{
            _rightMandarinImV.left = SCREENWIDTH;
            _rightMandarinImV.top += 40;
        }completion:^(BOOL finished) {
            [_rightMandarinImV removeFromSuperview];
        }];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _butterfly1ImV.hidden = NO;
            [_butterfly1ImV startAnimating];
            [UIView animateWithDuration:3.0 animations:^{
                _butterfly1ImV.center = CGPointMake(self.centerX - 8 , self.centerY - 40);
            }];
            _butterfly2ImV.hidden = NO;
            [_butterfly2ImV startAnimating];
            [UIView animateWithDuration:3.0 animations:^{
                _butterfly2ImV.center = CGPointMake(self.centerX + 60, self.centerY);
            }];
            
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _leftMandarinImV.hidden = NO;
            _leftMandarinImV.transform = CGAffineTransformMakeScale(0.1, 0.1);
            [UIView animateWithDuration:2.0 animations:^{
                _leftMandarinImV.transform = CGAffineTransformMakeScale(1.0,1.0);
                _leftMandarinImV.left -= 90;
            }];
        });
    });
  
 

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ESStrongSelf;
        [_self playRightToLeftBirdsAndWordsAnimations];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ESStrongSelf;
        [_self playleftToRightBirdsAndWordsAnimations];
    });
    
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(12 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          ESStrongSelf;
          
          [UIView animateWithDuration:2.0 animations:^{
              _self.alpha = 0.0;
          }completion:^(BOOL finished) {
              ESStrongSelf;
              [_self.layer removeAllAnimations];
              [_self removeFromSuperview];
              [_self callBackManager];
              _self = nil;
          }];
      });
    
}
/**
 * 荷花循环移动
 */
- (void)playRecyclingMobileWithImV:(UIImageView *)imV{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 1.0;
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBoth;
    [animation setAutoreverses:YES];
    animation.repeatCount = 2;
    NSValue *p1 = [NSValue valueWithCGPoint:imV.center];
    NSValue *p2 =[NSValue valueWithCGPoint:CGPointMake(imV.centerX + 30, imV.centerY)];
    animation.values = @[p1,p2];
    [imV.layer addAnimation:animation forKey:@"positionAnimation"];
    
}


/**
 * 飞鸟 文字出现 移动 向左
 */
- (void)playRightToLeftBirdsAndWordsAnimations{
    [UIView animateWithDuration:2.0 animations:^{
        _leftGreenBirdsImV.top += 130;
        _leftGreenBirdsImV.right = 130;
    }completion:^(BOOL finished) {
    }];
    [UIView animateWithDuration:1.0 delay:1.9 options:UIViewAnimationOptionLayoutSubviews animations:^{
        _leftGreenBirdsImV.top += 50;
        _leftGreenBirdsImV.right = 0;
    } completion:^(BOOL finished) {
        [_leftGreenBirdsImV removeFromSuperview];
    }];
    [UIView animateWithDuration:2.0 animations:^{
        _leftBirdsImV.top += 200;
        _leftBirdsImV.right = SCREENWIDTH/2 - 30;
    }completion:^(BOOL finished) {
    }];
    [UIView animateWithDuration:1.0 delay:1.9 options:UIViewAnimationOptionLayoutSubviews animations:^{
        _leftBirdsImV.top -= 40;
        _leftBirdsImV.right = 0;
    } completion:^(BOOL finished) {
        [_leftBirdsImV removeFromSuperview];
    }];

}

/**
 * 飞鸟 文字出现 移动 向右
 */
- (void)playleftToRightBirdsAndWordsAnimations{
    
    _rightGreBirdsImV.hidden = NO;
    _rightBirdsfly.hidden = NO;
    [UIView animateWithDuration:4.0 animations:^{
        _rightGreBirdsImV.bottom = SCREENHEIGHT/2- 40;
        _rightGreBirdsImV.right = SCREENWIDTH;
        _rightBirdsfly.bottom = SCREENHEIGHT/2 - 40;
        _rightBirdsfly.right = SCREENWIDTH- 50 ;
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _wordsImV.hidden = NO;
        UIBezierPath *maskStartPath = [UIBezierPath bezierPathWithRect:CGRectMake(0,0,0,CGRectGetHeight(_wordsImV.bounds))];//CGRectGetWidth(_wordsImV.bounds)
        UIBezierPath *maskFinalPath = [UIBezierPath bezierPathWithRect:_wordsImV.bounds];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        _wordsImV.layer.mask = maskLayer;
        maskLayer.path = maskFinalPath.CGPath;
        CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        maskLayerAnimation.fromValue = (__bridge id)maskStartPath.CGPath;
        maskLayerAnimation.toValue = (__bridge id)maskFinalPath.CGPath;
        maskLayerAnimation.removedOnCompletion = YES;
        maskLayerAnimation.duration = 3.0;//kCAMediaTimingFunctionEaseOut
        maskLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];//kCAMediaTimingFunctionEaseIn
        [maskLayerAnimation setValue:@"maskLayerAnimation" forKey:@"keyID"];
        [maskLayer addAnimation:maskLayerAnimation forKey:@"maskLayerAnimation"];
    });

}
#pragma mark - end
- (void)callBackManager {
    NSLog(@"动画结束");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
