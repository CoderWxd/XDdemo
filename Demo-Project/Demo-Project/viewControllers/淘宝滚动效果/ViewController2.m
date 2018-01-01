//
//  ViewController2.m
//  detailtest
//
//  Created by ztf on 16/3/30.
//  Copyright © 2016年 ztf. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()<UIScrollViewDelegate>
{
    BOOL _canScroll;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    _canScroll = YES;
    // Do any additional setup after loading the view from its nib.
    CGRect sb = [[UIScreen mainScreen]bounds];
    self.scrollview.contentSize = CGSizeMake(sb.size.width, SCREEN_HEIGHT *2);
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (_canScroll == YES) {
        
        NSLog(@"ViewController2 :%@",@(scrollView.contentOffset.y));
        if (scrollView.contentOffset.y < -100) {
            _canScroll = NO;
            
            
            [UIView animateWithDuration:0.5 animations:^{
                self.supervc.scrollView.contentOffset = CGPointMake(0, 0);
            }completion:^(BOOL finished) {
                _canScroll = YES;
            }];
            
            
        }
    }
    

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    

}


@end
