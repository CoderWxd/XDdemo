//
//  BaseViewController.m
//  XDAutoMove
//
//  Created by 王晓栋 on 2017/3/30.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "BaseViewController.h"
#import "UIView+Uitls.h"

@interface BaseViewController ()
{
    CGFloat _totalYOffset;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _totalYOffset = 0;
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEditing)]];
}


- (void)endEditing
{
    [self.view endEditing:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidChangeFrame:) name:UIKeyboardDidChangeFrameNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidChangeFrameNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)noti
{
    CGFloat keyboardHeight = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    [self.view.layer removeAllAnimations];
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIView *firstResponderView = [keyWindow performSelector:@selector(findFirstResponder)];
    
    CGRect rect = [[UIApplication sharedApplication].keyWindow convertRect:firstResponderView.frame fromView:firstResponderView.superview];
    
    CGFloat bottom = rect.origin.y + rect.size.height;
    CGFloat keyboardY = self.view.window.size.height - keyboardHeight;
    if (bottom > keyboardY) {
        _totalYOffset += bottom - (self.view.window.size.height - keyboardHeight) + 50;
        [UIView animateWithDuration:[noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]
                              delay:0
                            options:[noti.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue]
                         animations:^{
                             self.view.y -= _totalYOffset;
                         }
                         completion:nil];
    }
}

- (void)keyboardWillHide:(NSNotification *)noti
{
    [UIView animateWithDuration:[noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]
                          delay:0
                        options:[noti.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue]
                     animations:^{
                         self.view.y += _totalYOffset;
                     }
                     completion:nil];
    _totalYOffset = 0;
}

- (void)keyboardWillChangeFrame:(NSNotification *)noti
{
    
}

- (void)keyboardDidShow:(NSNotification *)noti
{
}

- (void)keyboardDidHide:(NSNotification *)noti
{
}

- (void)keyboardDidChangeFrame:(NSNotification *)noti
{
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
