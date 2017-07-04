//
//  PerfumeAnimation.m
//  香水
//
//  Created by 王晓栋 on 2017/4/8.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "PerfumeAnimation.h"
#import "UIView+ESShortcut.h"
#define Screen_Width [UIScreen mainScreen].bounds.size.width

#define Screen_Height [UIScreen mainScreen].bounds.size.height


@interface PerfumeAnimation()
{
    UIImageView *bottleImgeView;
    UIImageView *popUpImageView;
    UIImageView *charmImageView;
    UIImageView *shinyImageView1;
    UIImageView *shinyImageView2;
    UIImageView *shinyImageView3;
    UIImageView *shinyImageView4;
    //花
    UIImageView *flowerImageView;
    
    //喷雾
    UIImageView *sprayImageView;
    //液体
    UIImageView *liquidImageView;
    //牌子
    UIImageView *paiziImageView;
    
    
    
    
    
}
@end
@implementation PerfumeAnimation
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUI];
        [self startAnimation];
        
    }
    return self;
}
- (instancetype)init{
    if (self = [super init]) {
        [self setUI];
        [self startAnimation];
        
        
    }
    return self;
}
- (void)setUI{
    self.userInteractionEnabled = NO;

    //瓶身
    UIImage *image1 = [UIImage imageNamed:@"perfume_bottle"];
    bottleImgeView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.height - image1.size.height, image1.size.width/5, image1.size.height/5)];
    bottleImgeView.image = image1;
    [self addSubview:bottleImgeView];
    //瓶盖
    UIImage *popUpImage = [UIImage imageNamed:@"perfume_btn_PopUp"];
    popUpImageView =  [[UIImageView alloc]initWithFrame:CGRectMake(55,5, popUpImage.size.width/5, popUpImage.size.height/5)];
    popUpImageView.image = popUpImage;
    [bottleImgeView addSubview:popUpImageView];
    //花
    UIImage *flowerImage = [UIImage imageNamed:@"flower"];
    flowerImageView =  [[UIImageView alloc]initWithFrame:CGRectMake(37,0, flowerImage.size.width/5, flowerImage.size.height/5)];
    flowerImageView.image = flowerImage;
    [bottleImgeView addSubview:flowerImageView];

    //魅力值
    UIImage *charmImage = [UIImage imageNamed:@"perfume_Charm"];
    charmImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, self.height/2, charmImage.size.width/8, charmImage.size.height/8)];
    charmImageView.image = charmImage;
    [self addSubview:charmImageView];
    charmImageView.hidden = YES;

    UIImage *sprayImage = [UIImage imageNamed:@"spray_shui1"];
    sprayImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-40, -45, sprayImage.size.width/5, sprayImage.size.height/5)];
    sprayImageView.image = sprayImage;
    sprayImageView.transform = CGAffineTransformRotate(sprayImageView.transform, M_PI_4);
    [bottleImgeView addSubview:sprayImageView];
    
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 1; i< 17; i++) {
        NSString *imageName = [NSString stringWithFormat:@"spray_shui%d",i];
        UIImage *image = [UIImage imageNamed:imageName];
        
        [images addObject:image];
    }
    sprayImageView.animationImages = images;
    sprayImageView.animationRepeatCount = 2;
    sprayImageView.animationDuration = 2.0;
    
    
    
    UIImage *liquidImage = [UIImage imageNamed:@"yeti1"];
    liquidImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 25, liquidImage.size.width/3.5, liquidImage.size.height/3.5)];
    liquidImageView.image = sprayImage;
    [bottleImgeView addSubview:liquidImageView];
    
    NSMutableArray *liquidimages = [NSMutableArray array];
    for (int i = 1; i< 14; i++) {
        NSString *imageName = [NSString stringWithFormat:@"yeti%d",i];
        UIImage *image = [UIImage imageNamed:imageName];
        
        [liquidimages addObject:image];
    }
    liquidImageView.animationImages = liquidimages;
    liquidImageView.animationRepeatCount = HUGE_VALF;
    liquidImageView.animationDuration = 2.0;
    
    
    //牌子
    UIImage *paiziImage = [UIImage imageNamed:@"paizi"];
    paiziImageView =  [[UIImageView alloc]initWithFrame:CGRectMake(15,35, paiziImage.size.width/4, paiziImage.size.height/4)];
    paiziImageView.image = paiziImage;
    [bottleImgeView addSubview:paiziImageView];



    
    
}
- (void)startAnimation{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath addArcWithCenter:CGPointMake(-20,Screen_Height/2) radius:300 startAngle:M_PI +M_PI_4/2 endAngle: 0 clockwise:NO];
    animation.duration = 1.0;
    animation.repeatCount = 1.0;
    [animation setPath:bezierPath.CGPath];
    
    [animation setRemovedOnCompletion:NO];
    [animation setFillMode:kCAFillModeForwards];
    [bottleImgeView.layer addAnimation:animation forKey:@"imgeViewAnimation"];
    CGAffineTransform transform =  CGAffineTransformRotate(bottleImgeView.transform, M_2_PI);
    bottleImgeView.transform = transform;
    [UIView animateWithDuration:1.2 animations:^{
        bottleImgeView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
    }];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self popUpAnimation];
    });
    
}
- (void)popUpAnimation{
    //平移
    CABasicAnimation  *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    //setFromValue不设置,默认以当前状态为准
    [animation setToValue:[NSValue valueWithCGPoint:CGPointMake(popUpImageView.centerX + 3,popUpImageView.centerY-3)]];
    //    [animation setDelegate:self];//代理回调
    [animation setDuration:1.0];//设置动画时间，单次动画时间
    [animation setRemovedOnCompletion:NO];//默认为YES,设置为NO时setFillMode有效
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setAutoreverses:YES];
    [animation setFillMode:kCAFillModeBoth];
    animation.repeatCount = 2.0;
    [popUpImageView.layer addAnimation:animation forKey:@"baseanimation"];
    
    [sprayImageView startAnimating];
    
    [liquidImageView startAnimating];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self shinyAnimation];
    });
    
}
- (void)shinyAnimation{
    
    
    UIImage *start1Image = [UIImage imageNamed:@"perfume_star1"];
    shinyImageView1 = [[UIImageView alloc]init];
    shinyImageView1.frame = CGRectMake(0,0, start1Image.size.width/5,start1Image.size.height/5);
    shinyImageView1.center = CGPointMake(self.centerX - 30, self.centerY - 30);
    shinyImageView1.center = self.center;
    shinyImageView1.image = start1Image;
    [self addSubview:shinyImageView1];
    
    CAKeyframeAnimation *opacityAnimation;
    opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[@(0), @(1), @(0)];
    opacityAnimation.duration = 1.5;
    opacityAnimation.fillMode = kCAFillModeBoth;
    opacityAnimation.calculationMode = kCAAnimationCubic;
    opacityAnimation.repeatCount = HUGE_VALF;
    
    [shinyImageView1.layer addAnimation:opacityAnimation forKey:@"opacityAnimation1"];
    
    UIImage *start2Image = [UIImage imageNamed:@"perfume_star2"];
    shinyImageView2 = [[UIImageView alloc]init];
    shinyImageView2.frame = CGRectMake(0,0, start2Image.size.width/5,start2Image.size.height/5);
    shinyImageView2.center = CGPointMake(self.centerX + 30, self.centerY + 30);
    shinyImageView2.image = start2Image;
    [self addSubview:shinyImageView2];
    [shinyImageView2.layer addAnimation:opacityAnimation forKey:@"opacityAnimation2"];
    
    
    UIImage *start4Image = [UIImage imageNamed:@"perfume_star5"];
    shinyImageView4 = [[UIImageView alloc]init];
    shinyImageView4.frame = CGRectMake(0,0, start4Image.size.width/5,start4Image.size.height/5);
    shinyImageView4.center = CGPointMake(self.centerX + 60, self.centerY + 120);
    shinyImageView4.image = start4Image;
    [self addSubview:shinyImageView4];
    [shinyImageView4.layer addAnimation:opacityAnimation forKey:@"opacityAnimation4"];
    

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [shinyImageView1.layer removeAnimationForKey:@"opacityAnimation1"];
        [shinyImageView2.layer removeAnimationForKey:@"opacityAnimation2"];
        [shinyImageView4.layer removeAnimationForKey:@"opacityAnimation4"];
        
        UIImage *start3Image = [UIImage imageNamed:@"perfume_star3"];
        shinyImageView3 = [[UIImageView alloc]init];
        shinyImageView3.frame = CGRectMake(0,0, start3Image.size.width/3,start3Image.size.height/3);
        shinyImageView3.center = CGPointMake(self.centerX + 60, self.centerY - 60);
        shinyImageView3.image = start3Image;
        [self addSubview:shinyImageView3];
        [shinyImageView3.layer addAnimation:opacityAnimation forKey:@"opacityAnimation3"];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self charmImageAnimation];
    });
}

- (void)charmImageAnimation{
    charmImageView.hidden = NO;
    
    charmImageView.alpha = 0.0;
    [UIView animateWithDuration:1.0 animations:^{
        charmImageView.alpha = 1.0;
        charmImageView.bottom = charmImageView.bottom - 40;
    }];

    
    [UIView animateWithDuration:3.0 animations:^{
        
        charmImageView.bottom = charmImageView.bottom - 150;
        
    } completion:^(BOOL finished) {
    
        [shinyImageView1 removeFromSuperview];
        [shinyImageView2 removeFromSuperview];
        [shinyImageView3 removeFromSuperview];
        [shinyImageView4 removeFromSuperview];

        
        [UIView animateWithDuration:1.0 animations:^{
            charmImageView.bottom = charmImageView.bottom - 40;
            
            
            bottleImgeView.transform = CGAffineTransformMakeTranslation(Screen_Width, 0);

        } completion:^(BOOL finished) {
            
            [self removeFromSuperview];
            [self animationStop];
        }];
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        charmImageView.alpha = 1.0;
        [UIView animateWithDuration:1.0 animations:^{
            charmImageView.alpha = 0.0;
        }];
    });


}
- (void)animationStop{
    
}
@end
