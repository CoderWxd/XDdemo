//
//  ViewController.m
//  水晶动画
//
//  Created by 王晓栋 on 2017/4/10.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "ViewController.h"
#import "CrystalAnimation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];

    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CrystalAnimation *cryStal = [[CrystalAnimation alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:cryStal];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
