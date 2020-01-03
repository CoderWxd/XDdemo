//
//  GuideProManagView.h
//  nongpi
//
//  Created by wangxiaodong on 2019/8/30.
//  Copyright © 2019 shengnong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GuideProManagView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *dimissButton;
+(instancetype)shareInstance;

@end

NS_ASSUME_NONNULL_END
