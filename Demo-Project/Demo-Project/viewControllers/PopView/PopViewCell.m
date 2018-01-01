//
//  PopViewCell.m
//  PopTableView
//
//  Created by ztf on 15/12/17.
//  Copyright © 2015年 ztf. All rights reserved.
//

#import "PopViewCell.h"

@implementation PopViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (PopViewCell *)dequeueReusableCellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"PopViewCell";
    PopViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[PopViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}


@end
