//
//  ViewController.m
//  比翼双飞
//
//  Created by 王晓栋 on 2017/8/8.
//
//

#import "ViewController.h"
#import "AnimationFlyWingView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    //比翼双飞
    AnimationFlyWingView *flyWingView = [[AnimationFlyWingView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:flyWingView];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
