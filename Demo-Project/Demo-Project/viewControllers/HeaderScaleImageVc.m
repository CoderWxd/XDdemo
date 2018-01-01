//
//  HeaderScaleImageVc.m
//  Demo-Project
//
//  Created by 王晓栋 on 2018/1/5.
//  Copyright © 2018年 王晓栋. All rights reserved.
//

#import "HeaderScaleImageVc.h"

#import "UIScrollView+HeaderScaleImage.h"

static NSString *cellID = @"ID";


@interface HeaderScaleImageVc ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@end

@implementation HeaderScaleImageVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Color_Ground;
    self.navigationItem.title = @"HeaderScaleImage";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATIONBAR_HEIGHT + StatusBarHeight,SCREEN_WIDTH,SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.tableView.xd_headerScaleImage = [UIImage imageNamed:@"image/center"];
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 200)];
    headView.backgroundColor = [UIColor clearColor
                                ];
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

@end
