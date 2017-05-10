//
//  ViewController.m
//  给任意的UIView添加点击事件
//
//  Created by 王晓栋 on 16/7/25.
//  Copyright © 2016年 百思为科. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AddClickEvent.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *view =  [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, 200, 200);
    view.backgroundColor = [UIColor redColor];
    [view addClickedBlock:^(id obj) {
        NSLog(@"%@",obj);
    }];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
