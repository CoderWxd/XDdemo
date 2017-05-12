//
//  ViewController.m
//  XDHeaderScaleImage
//
//  Created by 王晓栋 on 2017/5/12.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+HeaderScaleImage.h"
static NSString *cellID = @"ID";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.xd_headerScaleImage = [UIImage imageNamed:@"center"];
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 200)];
    headView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = headView;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd个cell",indexPath.row];
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
