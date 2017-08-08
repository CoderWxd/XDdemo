//
//  CrystalAnimation.m
//  水晶动画
//
//  Created by 王晓栋 on 2017/4/10.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "CrystalAnimation.h"
#import "UIView+ESShortcut.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define const_explosion_time 5.0
@interface CrystalAnimation()
{
    UIImageView *palaceImageView;
    UIImageView *planetImageView;
    UIImageView *wave_seaImageView;
    UIImageView *seal3ImageView;
    UIImageView *seal2ImageView;
    UIImageView *diamondImageView;
    
    UIImageView *wave1ImageView;
    UIImageView *wave2ImageView;
    
    UIImageView *seaweedImageView;
    
    UIImageView *wackgroundPointsImageView;
    
    UIImageView *mush_roomImageView;
    UIImageView *algaeImageView;
    
}
@end

@implementation CrystalAnimation

- (instancetype)init{
    if (self = [super init]) {
        
        
        [self customui];
        
        [self statrAnimation];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self customui];
        [self statrAnimation];

    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self customui];
        [self statrAnimation];

    }
    return self;
}

- (void)customui{
    
    self.userInteractionEnabled = NO;
    //天空之城
    UIImage *crystal_palaceImage = [UIImage imageNamed:@"crystal_palace.png"];
    palaceImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width, 120)];
    palaceImageView.image = crystal_palaceImage;
    palaceImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:palaceImageView];
    palaceImageView.hidden = YES;
    
    
    //流星
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 1; i< 5; i++) {
        NSString *imageName = [NSString stringWithFormat:@"crystal_planet%d",i];
        UIImage *image = [UIImage imageNamed:imageName];
        [images addObject:image];
    }

    [self setImageViewWithCenter:CGPointMake(50, 130) withImages:images];
    [self setImageViewWithCenter:CGPointMake(SCREEN_WIDTH - 50, 150) withImages:images];
    [self setImageViewWithCenter:CGPointMake(20, 150) withImages:images];
    [self setImageViewWithCenter:CGPointMake(SCREEN_WIDTH - 100, 160) withImages:images];
    [self setImageViewWithCenter:CGPointMake(100, SCREEN_HEIGHT/2) withImages:images];
    [self setImageViewWithCenter:CGPointMake(130, SCREEN_HEIGHT/2 + 30) withImages:images];

    [self setImageViewWithCenter:CGPointMake(SCREEN_WIDTH - 150, SCREEN_HEIGHT/2 + 70) withImages:images];
    [self setImageViewWithCenter:CGPointMake(50,SCREEN_HEIGHT - 100) withImages:images];
    [self setImageViewWithCenter:CGPointMake(SCREEN_WIDTH - 50, SCREEN_HEIGHT - 70) withImages:images];
    //底部父控件
    UIView *bottomContentView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT/2- 60, SCREEN_WIDTH, SCREEN_HEIGHT/2 + 60)];
    bottomContentView.backgroundColor = [UIColor clearColor];
    [self addSubview:bottomContentView];
    
    
//    crystal_wave_sea 海浪 上部
    UIImage *crystal_wave_seaImage = [UIImage imageNamed:@"crystal_wave_sea"];
    wave_seaImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, crystal_wave_seaImage.size.height/4)];
    wave_seaImageView.image = crystal_wave_seaImage;
    [bottomContentView addSubview:wave_seaImageView];
    wave_seaImageView.hidden = YES;
    
    
    //海豚左 crystal_seal3
    UIImage *crystal_seal3Image = [UIImage imageNamed:@"crystal_seal3"];
    seal3ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, wave_seaImageView.bottom - 80, 0, 0)];
    seal3ImageView.image = crystal_seal3Image;
    [bottomContentView addSubview:seal3ImageView];
    seal3ImageView.hidden = YES;

    //   海豚右 crystal_seal2
    UIImage *crystal_seal2Image = [UIImage imageNamed:@"crystal_seal2"];
    seal2ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, wave_seaImageView.bottom - 80, 0, 0)];
    seal2ImageView.image = crystal_seal2Image;
    [bottomContentView addSubview:seal2ImageView];
    seal2ImageView.hidden = YES;
    
    //   水晶石 crystal_diamond
    UIImage *crystal_diamondImage = [UIImage imageNamed:@"crystal_diamond"];
    diamondImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, wave_seaImageView.bottom - 120, 0, 0)];
    diamondImageView.image = crystal_diamondImage;
    [bottomContentView addSubview:diamondImageView];
    diamondImageView.hidden = YES;

    
    //海波1 crystal_wave1
    UIImage *crystal_wave1Image = [UIImage imageNamed:@"crystal_wave3"];
    wave1ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, wave_seaImageView.bottom - 100, SCREEN_WIDTH + 40, crystal_wave1Image.size.height/4)];
    wave1ImageView.image = crystal_wave1Image;
    [bottomContentView addSubview:wave1ImageView];
    wave1ImageView.hidden = YES;
    
    
    //海波2 crystal_wave2
    UIImage *crystal_wave2Image = [UIImage imageNamed:@"crystal_wave2"];
    wave2ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, wave_seaImageView.bottom - 100, SCREEN_WIDTH+ 40, crystal_wave2Image.size.height/4)];
    wave2ImageView.image = crystal_wave2Image;
    [bottomContentView addSubview:wave2ImageView];
    wave2ImageView.hidden = YES;

    
   //海浪渲染 crystal_wackgroundPoints
    UIImage *crystal_wackgroundPointsImage = [UIImage imageNamed:@"crystal_wackgroundPoints"];
    wackgroundPointsImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, wave_seaImageView.height/2, SCREEN_WIDTH, crystal_wackgroundPointsImage.size.height/2.5)];
    
    wackgroundPointsImageView.center =CGPointMake(wave_seaImageView.centerX, wave_seaImageView.top);// wave_seaImageView.center;
    wackgroundPointsImageView.image = crystal_wackgroundPointsImage;
    [bottomContentView addSubview:wackgroundPointsImageView];
    wackgroundPointsImageView.hidden = YES;

    
    //海草 crystal_seaweed
    UIImage *crystal_seaweedImage = [UIImage imageNamed:@"crystal_seaweed"];
    seaweedImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, bottomContentView.height - crystal_seaweedImage.size.height/4 -20, SCREEN_WIDTH - 60, crystal_seaweedImage.size.height/4)];
    seaweedImageView.image = crystal_seaweedImage;
    [bottomContentView addSubview:seaweedImageView];
    seaweedImageView.hidden = YES;
    
    

    
    
    //crystal_mush_room
        UIImage *crystal_mush_roomImage = [UIImage imageNamed:@"crystal_mush_room"];
    mush_roomImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, seaweedImageView.top + 20 , crystal_mush_roomImage.size.width/3, crystal_mush_roomImage.size.height/3)];
    mush_roomImageView.image = crystal_mush_roomImage;
    [bottomContentView addSubview:mush_roomImageView];
    mush_roomImageView.hidden = YES;
    
    //crystal_algae
    UIImage *crystal_algaeImage = [UIImage imageNamed:@"crystal_algae"];
    algaeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(mush_roomImageView.right+ 20, mush_roomImageView.top , crystal_algaeImage.size.width/3, crystal_algaeImage.size.height/3)];
    algaeImageView.image = crystal_algaeImage;
    [bottomContentView addSubview:algaeImageView];
    algaeImageView.hidden = YES;


    
}
- (void)statrAnimation{
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        wave1ImageView.hidden = NO;
        wave1ImageView.alpha = 0.0;
        wave2ImageView.hidden = NO;
        wave2ImageView.alpha = 0.0;
        palaceImageView.hidden = NO;
        palaceImageView.alpha = 0.0;
    
        //平移
        CABasicAnimation  *animation = [CABasicAnimation animationWithKeyPath:@"position"];
        //setFromValue不设置,默认以当前状态为准
        [animation setToValue:[NSValue valueWithCGPoint:CGPointMake(wave1ImageView.centerX + 10,wave1ImageView.centerY+ 2)]];
        //    [animation setDelegate:self];//代理回调
        [animation setDuration:1.0];//设置动画时间，单次动画时间
//        [animation setRemovedOnCompletion:NO];//默认为YES,设置为NO时setFillMode有效
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [animation setAutoreverses:YES];
        [animation setFillMode:kCAFillModeBoth];
        animation.repeatCount = HUGE_VALF;
        [wave1ImageView.layer addAnimation:animation forKey:@"baseanimation"];
        
        
        
        CABasicAnimation  *animation2 = [CABasicAnimation animationWithKeyPath:@"position"];
        //setFromValue不设置,默认以当前状态为准
        [animation2 setToValue:[NSValue valueWithCGPoint:CGPointMake(wave2ImageView.centerX - 10,wave2ImageView.centerY-2)]];
        //    [animation setDelegate:self];//代理回调
        [animation2 setDuration:1.0];//设置动画时间，单次动画时间
//        [animation2 setRemovedOnCompletion:NO];//默认为YES,设置为NO时setFillMode有效
        [animation2 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [animation2 setAutoreverses:YES];
        [animation2 setFillMode:kCAFillModeBoth];
        animation2.repeatCount = HUGE_VALF;
        [wave2ImageView.layer addAnimation:animation2 forKey:@"baseanimation1"];

        [UIView animateWithDuration:2.0 animations:^{
            wave1ImageView.alpha = 1.0;
            wave2ImageView.alpha = 1.0;
            palaceImageView.alpha = 1.0;

        }completion:^(BOOL finished) {
        }];

    });
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            seaweedImageView.hidden = NO;
            seaweedImageView.alpha = 0.0;
            mush_roomImageView.hidden = NO;
            mush_roomImageView.alpha = 0.0;

            algaeImageView.hidden = NO;
            algaeImageView.alpha = 0.0;
        [UIView animateWithDuration:2.0 animations:^{
            seaweedImageView.alpha = 1.0;
            mush_roomImageView.alpha = 1.0;
            algaeImageView.alpha = 1.0;
    
        }];
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      
            wave_seaImageView.hidden = NO;
//            wave_seaImageView.alpha = 0.0;
        [self setImage];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            wackgroundPointsImageView.hidden = NO;

        });

        
        
    });
    
    UIImage *crystal_seal3Image = [UIImage imageNamed:@"crystal_seal3"];
    UIImage *crystal_diamondImage = [UIImage imageNamed:@"crystal_diamond"];
    UIImage *crystal_seal2Image = [UIImage imageNamed:@"crystal_seal2"];

    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        seal2ImageView.hidden = NO;
        seal3ImageView.hidden = NO;
    
        [UIView animateWithDuration:2.0 animations:^{
            seal3ImageView.bounds = CGRectMake(0, 0, crystal_seal3Image.size.width/3.5, crystal_seal3Image.size.height/4);
            seal3ImageView.top -=crystal_seal3Image.size.height/4;
            seal3ImageView.left -=crystal_seal3Image.size.width/3.8;
            
            seal2ImageView.bounds = CGRectMake(0, 0, crystal_seal2Image.size.width/3.5, crystal_seal2Image.size.height/4);
            seal2ImageView.top -=crystal_seal2Image.size.height/4;
            seal2ImageView.right +=crystal_seal2Image.size.width/3.8;
            
    
        }completion:^(BOOL finished) {
            
            diamondImageView.hidden = NO;

            [UIView animateWithDuration:2.0 animations:^{
                
                
                diamondImageView.bounds = CGRectMake(0, 0, crystal_diamondImage.size.width/3.5, crystal_diamondImage.size.height/3.5);
                diamondImageView.top -=crystal_diamondImage.size.height/2.5;
                
            }completion:^(BOOL finished) {
                
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [UIView animateWithDuration:2.0 animations:^{
                        self.alpha = 0.0;
                    }completion:^(BOOL finished) {
                        
                        [self removeFromSuperview];
                    }];

                });
            }];
            
        }];

    });
    


    
    
    
    
    
    
    
}

- (void)setImageViewWithCenter:(CGPoint)point withImages:(NSMutableArray *)images{
    
    float timeCount = arc4random()%10 / 10.0;
    NSLog(@"timeCount=%f",timeCount);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeCount * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        UIImage *imagePlanet = [UIImage imageNamed:@"crystal_planet1"];
        planetImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, imagePlanet.size.width/5, imagePlanet.size.height/5)];
        planetImageView.contentMode = UIViewContentModeScaleToFill;
        planetImageView.animationImages = images;
        planetImageView.center = point;
        planetImageView.animationDuration = 1.0;
        planetImageView.animationRepeatCount = HUGE_VALF;
        
        [planetImageView startAnimating];
        [self addSubview:planetImageView];

    });
    
    

}


- (void)setImage{
    UIBezierPath *maskStartPath = [UIBezierPath bezierPathWithRect:CGRectMake(0,CGRectGetHeight(wave_seaImageView.bounds),CGRectGetWidth(wave_seaImageView.bounds),0)];

    UIBezierPath *maskFinalPath = [UIBezierPath bezierPathWithRect:wave_seaImageView.bounds];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    wave_seaImageView.layer.mask = maskLayer;
    maskLayer.path = maskFinalPath.CGPath;
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.fromValue = (__bridge id)maskStartPath.CGPath;
    maskLayerAnimation.toValue = (__bridge id)maskFinalPath.CGPath;
    maskLayerAnimation.removedOnCompletion = NO;
    maskLayerAnimation.duration = 1.0;//kCAMediaTimingFunctionEaseOut
    maskLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];//kCAMediaTimingFunctionEaseIn
    [maskLayer addAnimation:maskLayerAnimation forKey:@"maskLayerAnimation"];
}



@end
