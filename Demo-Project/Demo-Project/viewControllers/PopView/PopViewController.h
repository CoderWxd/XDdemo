//
//  PopViewController.h
//  PopTableView
//
//  Created by ztf on 15/12/17.
//  Copyright © 2015年 ztf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CallBackBlock) (NSIndexPath *indexPath);

@interface PopViewController : UIViewController



+ (void)showInview:(UIView *)view WithData:(NSArray *)data animated:(BOOL)animated callBack:(CallBackBlock)callBack;

+ (void)hide:(BOOL)animated;


@end
