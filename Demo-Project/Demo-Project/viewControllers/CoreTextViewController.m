//
//  CoreTextViewController.m
//  Demo-Project
//
//  Created by 王晓栋 on 2018/1/24.
//  Copyright © 2018年 王晓栋. All rights reserved.
//

#import "CoreTextViewController.h"

#import <CoreText/CoreText.h>

@interface CoreTextViewController ()
{
    UIView *_btnSup;
    NSMutableArray *dataArr;
    NSMutableArray *numArr;
}
@end

// CATextLayer 代替 UILabel

//http://www.cnblogs.com/daxiaxiaohao/p/4272722.html
//https://zsisme.gitbooks.io/ios-/content/chapter1/layers-and-trees.html

@implementation CoreTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Color_Ground;
    [self performSelector:@selector(setupSubViews) withObject:self afterDelay:1.0f];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self setupSubViews];
}
- (void)setupSubViews{
    if (_btnSup) {
        return;
    }
    _btnSup = [[UIView alloc] initWithFrame:CGRectMake(50,SCREEN_HEIGHT-44 -  100, 300, 44)];
    _btnSup.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_btnSup];
    
    _btnSup.left = SCREEN_WIDTH;
    [UIView animateWithDuration:2.0 animations:^{
        _btnSup.centerX = SCREEN_WIDTH/2;
    }completion:^(BOOL finished) {
        [self startText];
    }];
}
- (void)startText{
    
    NSString * str =@"12345678901234567890-";
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.string = str;
    textLayer.frame = CGRectMake(0, 20, _btnSup.width, 30);
    textLayer.fontSize = 12.f;//字体的大小
    textLayer.wrapped = YES;//默认为No.  当Yes时，字符串自动适应layer的bounds大小
    textLayer.alignmentMode = kCAAlignmentCenter;//字体的对齐方式
    //    textLayer.position = CGPointMake(100, 100);//layer在view的位置 适用于跟随摸一个不固定长的的控件后面需要的
    textLayer.contentsScale = [UIScreen mainScreen].scale;//解决文字模糊 以Retina方式来渲染，防止画出来的文本像素化
    textLayer.foregroundColor =[UIColor clearColor].CGColor;//字体的颜色 文本颜色
    textLayer.fillMode = @"forwards";
    [_btnSup.layer addSublayer:textLayer];
    
    UIFont *font = [UIFont fontWithName:@"EuphemiaUCAS-Bold" size:12];
    NSMutableAttributedString *string = nil;
    string = [[NSMutableAttributedString alloc] initWithString:str];
    CFStringRef fontName = (__bridge CFStringRef)(font.fontName);
    CGFloat fontSize = font.pointSize;
    CTFontRef fontRef = CTFontCreateWithName(fontName, fontSize, NULL);
    NSDictionary *attribs = @{
                              (__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor clearColor].CGColor,
                              (__bridge id)kCTFontAttributeName:(__bridge id)fontRef
                              };
    [string setAttributes:attribs range:NSMakeRange(0, str.length)];
    
    dataArr = [NSMutableArray arrayWithObjects:(__bridge id _Nonnull)(fontRef),attribs,string,str,textLayer, nil];
    numArr = [NSMutableArray array];
    for (int i = 0 ; i < str.length; i ++) {
        [numArr addObject:[NSNumber numberWithInt:i]];
        [self performSelector:@selector(changeToBlack) withObject:self afterDelay:0.05* i];
    }
}
- (void)changeToBlack {
    CTFontRef fontRef = (__bridge CTFontRef)(dataArr[0]);
    NSMutableAttributedString *string = dataArr[2];
    NSNumber *num = [numArr firstObject];
    int y = [num intValue];
    NSDictionary *attribs = dataArr[1];
    attribs = @{
                (__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor yellowColor].CGColor,
                (__bridge id)kCTFontAttributeName:(__bridge id)fontRef
                };
    [string setAttributes:attribs range:NSMakeRange(y, 1)];
    if (numArr.count > 1) {
        [numArr removeObjectAtIndex:0];
    }else{
        NSLog(@"暂停");
        [UIView animateWithDuration:2.0 animations:^{
            _btnSup.right = 0 ;
        }completion:^(BOOL finished) {
            [_btnSup removeFromSuperview];
            _btnSup = nil;
        }];

    }
    CATextLayer *textLayer = [dataArr lastObject];
    if (textLayer) {
        textLayer.string = string;
    }
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
