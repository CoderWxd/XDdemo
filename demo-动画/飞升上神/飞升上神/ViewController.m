//
//  ViewController.m
//  飞升上神
//
//  Created by 王晓栋 on 2017/5/5.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "ViewController.h"
#import "SoaringGodOnAnimation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    SoaringGodOnAnimation *soaringGodOnAnimation = [[SoaringGodOnAnimation alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.view addSubview:soaringGodOnAnimation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
