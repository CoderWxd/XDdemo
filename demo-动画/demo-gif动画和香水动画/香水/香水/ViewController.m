//
//  ViewController.m
//  香水
//
//  Created by 王晓栋 on 2017/4/8.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "ViewController.h"
#import "PerfumeAnimation.h"
#import "TheKneeAnimation.h"
#import "BowelAnimation.h"

#import "SportsCarAnimation.h"
#import "RocketAnimation.h"

@interface ViewController ()
{
    UIView *bottomView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];

    
    bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 200,200,200)];
    bottomView.backgroundColor = [UIColor greenColor];
    
    UIBezierPath *showBottomPath = [UIBezierPath bezierPathWithRoundedRect:bottomView.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *showBottomLayer = [[CAShapeLayer alloc] init];
    showBottomLayer.backgroundColor = [UIColor yellowColor].CGColor;
    showBottomLayer.frame = bottomView.bounds;
    showBottomLayer.path = showBottomPath.CGPath;
    bottomView.layer.mask = showBottomLayer;
    [self.view addSubview:bottomView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
