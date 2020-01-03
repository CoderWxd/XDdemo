//
//  CoordinatesViewController.m
//  Demo-Project
//
//  Created by wangxiaodong on 2019/10/31.
//  Copyright © 2019 王晓栋. All rights reserved.
//

#import "CoordinatesViewController.h"
#import "GuideProManagView.h"
#import <TFPopup/TFPopup.h>


@interface CoordinatesViewController ()
@property (weak, nonatomic) IBOutlet UIView *orangeView;

@property (weak, nonatomic) IBOutlet UIView *blackView;

@property (weak, nonatomic) IBOutlet UIView *redView;

@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation CoordinatesViewController

//坐标系转换
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Color_Ground;
    self.title = @"坐标系转换";
    
    NSLog(@"orangeView=%@>>>>>>",NSStringFromCGRect(self.orangeView.frame));
    
    NSLog(@"blackView=%@>>>>>>",NSStringFromCGRect(self.blackView.frame));
    
    NSLog(@"redView=%@>>>>>>",NSStringFromCGRect(self.redView.frame));
    
    NSLog(@"blueView=%@>>>>>>",NSStringFromCGRect(self.blueView.frame));
    
    CGRect rect = [self.orangeView convertRect:self.redView.frame toView:self.view];
    NSLog(@"redView>>>转换后=%@>>>>>>",NSStringFromCGRect(rect));

    x_weakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        GuideProManagView *guideProManagView = [GuideProManagView shareInstance];
        TFPopupParam *param = [TFPopupParam new];
        param.disuseShowPopupAlphaAnimation = YES;
        param.disuseHidePopupAlphaAnimation = YES;
        param.backgroundColorClear = YES;
        param.disuseBackgroundTouchHide = NO;
        param.duration = 0.2;
        
        CGPoint point = CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
//        param.offset = point;
        NSLog(@"转换后11111=%@>>>>>>",NSStringFromCGPoint(point));

        [guideProManagView tf_showBubble:weakself.view basePoint:point bubbleDirection:PopupDirectionBottomLeft popupParam:param];

    }); 
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
