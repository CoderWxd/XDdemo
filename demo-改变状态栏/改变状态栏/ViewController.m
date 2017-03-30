//
//  ViewController.m
//  改变状态栏
//
//  Created by 王晓栋 on 16/6/17.
//  Copyright © 2016年 百思为科. All rights reserved.
//

#import "ViewController.h"
#import "ChangeStatusViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *status;

@property (weak, nonatomic) IBOutlet UISegmentedControl *seg;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor greenColor];
    self.seg.selectedSegmentIndex = 1;
    self.status.selectedSegmentIndex = 1;
    
}


- (IBAction)segmented:(UISegmentedControl *)sender {
    self.seg.selectedSegmentIndex = sender.selectedSegmentIndex;
    if (self.seg.selectedSegmentIndex == 0) {
        [ChangeStatusViewController shareInstance].statusBarHidden = YES;
        
    }else{
        [ChangeStatusViewController shareInstance].statusBarHidden = NO;
    }

}
- (IBAction)status:(UISegmentedControl *)sender {
    
    self.status.selectedSegmentIndex =sender.selectedSegmentIndex;
    if (self.status.selectedSegmentIndex == 0) {
        
        [ChangeStatusViewController shareInstance].statusBarStyle = UIStatusBarStyleLightContent;
    }else{
        [ChangeStatusViewController shareInstance].statusBarStyle = UIStatusBarStyleDefault;
        
    }
}
@end
