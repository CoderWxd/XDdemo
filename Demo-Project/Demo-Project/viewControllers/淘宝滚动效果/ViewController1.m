//
//  ViewController1.m
//  detailtest
//
//  Created by ztf on 16/3/30.
//  Copyright © 2016年 ztf. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()<UIScrollViewDelegate>
{
    BOOL _canScroll;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];

    _canScroll = YES;
    // Do any additional setup after loading the view from its nib.
    CGRect sb = [[UIScreen mainScreen]bounds];
    self.scrollview.contentSize = CGSizeMake(sb.size.width, SCREEN_HEIGHT *2);
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (_canScroll == YES) {
        
        NSLog(@"ViewController1 :%@,SCREEN_HEIGHT = %@",@(scrollView.contentOffset.y),@([UIScreen mainScreen].bounds.size.height));
        
        
        if (scrollView.contentOffset.y >= SCREEN_HEIGHT + 50) {
            _canScroll = NO;
            
            CGRect sb = [[UIScreen mainScreen]bounds];
            
            [UIView animateWithDuration:0.5 animations:^{
                self.supervc.scrollView.contentOffset = CGPointMake(0, sb.size.height);
                
            }completion:^(BOOL finished) {
                _canScroll = YES;
            }];
            
        }
        
    }

}


@end
