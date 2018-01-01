//
//  PopViewCell.h
//  PopTableView
//
//  Created by ztf on 15/12/17.
//  Copyright © 2015年 ztf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopViewCell : UITableViewCell

+ (PopViewCell *)dequeueReusableCellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;
@end
