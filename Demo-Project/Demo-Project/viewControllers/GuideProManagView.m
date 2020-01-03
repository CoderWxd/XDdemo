//
//  GuideProManagView.m
//  nongpi
//
//  Created by wangxiaodong on 2019/8/30.
//  Copyright © 2019 shengnong. All rights reserved.
//

#import "GuideProManagView.h"

@implementation GuideProManagView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.imageView.layer.cornerRadius = 8.0f;
}

static GuideProManagView *_guideProManagView = nil;
+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        UINib *nib = [UINib nibWithNibName:@"GuideProManagView" bundle:nil];
        NSArray *xibArray = [nib instantiateWithOwner:nil options:nil];
       _guideProManagView =  xibArray[0];
        _guideProManagView.frame = CGRectMake(0, 0, 150, 50);
    });
    return _guideProManagView;
} 
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
