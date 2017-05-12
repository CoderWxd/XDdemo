//
//  ViewController.m
//  手势解锁
//
//  Created by 王晓栋 on 16/8/1.
//  Copyright © 2016年 百思为科. All rights reserved.
//

#import "ViewController.h"

#import "GestureViewController.h"
#import "GestureVerifyViewController.h"
#import "PCCircleViewConst.h"


@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"手势解锁";
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    for (int i = 0; i < 4; i ++) {
    
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(100, (i+2) * 80, 100, 40);
        btn.backgroundColor = [UIColor greenColor];
        btn.tag = i;
        if (i == 0) {
            
            [btn setTitle:@"设置手势密码" forState:UIControlStateNormal];
            
        }else if(i == 1){
            [btn setTitle:@"登录手势密码" forState:UIControlStateNormal];
            
        }else if(i == 2){
            [btn setTitle:@"验证手势密码" forState:UIControlStateNormal];
            
        }else if(i == 3){
            [btn setTitle:@"修改手势密码" forState:UIControlStateNormal];
            
        }
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }
}
- (void)btnClick:(UIButton *)btn{
    switch (btn.tag) {
        case 0:
        {
            //设置手势密码
            GestureViewController *gestureVc = [[GestureViewController alloc] init];
            gestureVc.type = GestureViewControllerTypeSetting;
            [self.navigationController pushViewController:gestureVc animated:YES];
        }
            break;
        case 1:
        {
            //登录手势密码
            if ([[PCCircleViewConst getGestureWithKey:gestureFinalSaveKey] length]) {
                GestureViewController *gestureVc = [[GestureViewController alloc] init];
                [gestureVc setType:GestureViewControllerTypeLogin];
                [self.navigationController pushViewController:gestureVc animated:YES];
            } else {
                UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"提示" message:@"暂未设置手势密码，是否前往设置" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    
                    GestureViewController *gestureVc = [[GestureViewController alloc] init];
                    gestureVc.type = GestureViewControllerTypeSetting;
                    [self.navigationController pushViewController:gestureVc animated:YES];
 
                }];
                UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                        [self dismissViewControllerAnimated:YES completion:nil];
                    
                }];
                
                [ac addAction:action];
                [ac addAction:action1];
                [self presentViewController:ac animated:YES completion:nil];

            }
        }
            break;
        case 2:
        {
            //验证手势密码
            GestureVerifyViewController *gestureVerifyVc = [[GestureVerifyViewController alloc] init];
            [self.navigationController pushViewController:gestureVerifyVc animated:YES];
        }
            break;

        case 3:
        {
            //修改手势密码
            GestureVerifyViewController *gestureVerifyVc = [[GestureVerifyViewController alloc] init];
            gestureVerifyVc.isToSetNewGesture = YES;
            [self.navigationController pushViewController:gestureVerifyVc animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
