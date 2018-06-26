//
//  DLLabelTapViewController.m
//  Demo-Project
//
//  Created by 王晓栋 on 2018/6/24.
//  Copyright © 2018年 王晓栋. All rights reserved.
//

#import "DLLabelTapViewController.h"
#import "UILabel+YBAttributeTextTapAction.h"

#define YBAlertShow(messageText,buttonName) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:(messageText) \
delegate:nil cancelButtonTitle:(buttonName) otherButtonTitles: nil];\
[alert show];

@interface DLLabelTapViewController ()<YBAttributeTapActionDelegate>

@end

@implementation DLLabelTapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Color_Ground;
    //需要点击的字符相同
    NSString *label_text1 = @"恭喜您中奖了,点我领取哦,点我领取哦";
    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc]initWithString:label_text1];
    [attributedString1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, label_text1.length)];
    [attributedString1 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(7, 2)];
    [attributedString1 addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(13, 2)];
    //最好设置一下行高，不设的话默认是0
    NSMutableParagraphStyle *sty = [[NSMutableParagraphStyle alloc] init];
    sty.alignment = NSTextAlignmentCenter;
    sty.lineSpacing = 5;
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:sty range:NSMakeRange(0, label_text1.length)];
    
    UILabel *ybLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, self.view.bounds.size.width - 20, 60)];
    ybLabel1.backgroundColor = [UIColor yellowColor];
    ybLabel1.numberOfLines = 2;
    ybLabel1.attributedText = attributedString1;
    [self.view addSubview:ybLabel1];
    
    [ybLabel1 yb_addAttributeTapActionWithStrings:@[@"点我",@"点我"] delegate:self];
    
    //需要点击的字符不同
    NSString *label_text2 = @"您好！您是小明吗？你中奖了，领取地址“www.yb.com”,领奖码“9527”";
    NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc]initWithString:label_text2];
    [attributedString2 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, label_text2.length)];
    [attributedString2 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(19, 10)];
    [attributedString2 addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(35, 4)];
    
    UILabel *ybLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, self.view.bounds.size.width - 20, 60)];
    ybLabel2.backgroundColor = [UIColor greenColor];
    ybLabel2.numberOfLines = 2;
    ybLabel2.attributedText = attributedString2;
    [self.view addSubview:ybLabel2];
    
    [ybLabel2 yb_addAttributeTapActionWithStrings:@[@"www.yb.com",@"9527"] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
        NSString *message = [NSString stringWithFormat:@"点击了“%@”字符\nrange: %@\nindex: %ld",string,NSStringFromRange(range),index];
        YBAlertShow(message, @"取消");
    }];
    //设置是否有点击效果，默认是YES
    ybLabel2.enabledTapEffect = NO;
}

//delegate
- (void)yb_attributeTapReturnString:(NSString *)string range:(NSRange)range index:(NSInteger)index
{
    NSString *message = [NSString stringWithFormat:@"点击了“%@”字符\nrange: %@\nindex: %ld",string,NSStringFromRange(range),index];
    YBAlertShow(message, @"取消");
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
