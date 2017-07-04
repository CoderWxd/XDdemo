//
//  ViewController.m
//  飞升上神
//
//  Created by 王晓栋 on 2017/5/5.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "ViewController.h"
#import "AnimationRingView.h"
#import "AnimationChestnutView.h"
#import "AnimationCreamView.h"
#import "AnimationCottonCaView.h"
#import "AnimationFerrisWheelView.h"
#import "AnimationNecklaceView.h"
#import "AnimationLoveLollView.h"
#import "AnimationPerfumeView.h"

#import "PerfumeView.h"
#import "CottonCaView.h"
#import "NecklaceView.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    //戒指
    //        AnimationRingView *ringView = [[AnimationRingView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //        [self.view addSubview:ringView];
    //栗子
    //        AnimationChestnutView *ringView = [[AnimationChestnutView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //        [self.view addSubview:ringView];
    //棉花糖
    //            AnimationCottonCaView *cottonCaView = [[AnimationCottonCaView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //            [self.view addSubview:cottonCaView];
    // 摩天轮
    //        AnimationFerrisWheelView *ferrisWheelView = [[AnimationFerrisWheelView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //        [self.view addSubview:ferrisWheelView];
    
    //冰淇淋
    //                AnimationCreamView *creamView = [[AnimationCreamView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //                [self.view addSubview:creamView];
    // 项链
    
    //        AnimationNecklaceView *creamView = [[AnimationNecklaceView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //        [self.view addSubview:creamView];
    
    //  爱心棒棒糖
    //    AnimationLoveLollView *creamView = [[AnimationLoveLollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //    [self.view addSubview:creamView];
    //  香水
    //        AnimationPerfumeView *creamView = [[AnimationPerfumeView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //        [self.view addSubview:creamView];
    
    
    // 手写
    //戒指
    AnimationRingView *ringView = [[AnimationRingView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:ringView];
    //栗子
//    AnimationChestnutView *chestnutView = [[AnimationChestnutView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    [self.view addSubview:chestnutView];
//    //香水
//    PerfumeView *perfumeView = [[PerfumeView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    [self.view addSubview:perfumeView];
//    //棉花糖
//    CottonCaView *cottonCaView = [[CottonCaView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    [self.view addSubview:cottonCaView];
//    //项链
//    NecklaceView *necklaceView = [[NecklaceView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    [self.view addSubview:necklaceView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
