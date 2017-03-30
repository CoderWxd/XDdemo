//
//  MainViewController.m
//  SCAutoMove
//
//  Created by show class on 15/11/25.
//  Copyright © 2015年 show class. All rights reserved.
//

#import "MainViewController.h"
#import "UIView+Uitls.h"

@interface MainViewController ()
{
    CGFloat _totalYOffset;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _totalYOffset = 0;
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEditing)]];
}


- (void)endEditing
{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
