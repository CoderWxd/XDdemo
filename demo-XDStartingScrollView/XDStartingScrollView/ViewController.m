//
//  ViewController.m
//  XDStartingScrollView
//
//  Created by 王晓栋 on 16/7/5.
//  Copyright © 2016年 百思为科. All rights reserved.
//

#import "ViewController.h"
#import "XDStartingScrollView.h"

@interface ViewController ()<XDStartingScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    XDStartingScrollView *start = [[XDStartingScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
    UIImage *image1 = [UIImage imageNamed:@"01"];
    UIImage *image2 = [UIImage imageNamed:@"02"];
    UIImage *image3 = [UIImage imageNamed:@"03"];
    start.images =@[image1,image2,image3];
    start.delegate = self;
    [self.view addSubview:start];
}
- (void)xdStartingScrollView:(XDStartingScrollView *)scrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"点击了第%zd张图片",index);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
