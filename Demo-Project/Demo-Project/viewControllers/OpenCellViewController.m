//
//  OpenCellViewController.m
//  Demo-Project
//
//  Created by 王晓栋 on 2018/1/5.
//  Copyright © 2018年 王晓栋. All rights reserved.
//

#import "OpenCellViewController.h"

@implementation ModelIndex

@end

@interface OpenCellViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation OpenCellViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = Color_Ground;
    self.title = @"展开cell";
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH,SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.dataSource = [NSMutableArray array];
    for (NSInteger i =0; i < 30; i++) {
        ModelIndex *model = [[ModelIndex alloc]init];
        model.isOpen = i % 2 == 0;
        [self.dataSource addObject:model];
    }
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ModelIndex *model = [self.dataSource objectAtIndex:indexPath.row];
    if (model.isOpen) {
        return 100;
    }else{
        return 50;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellid = @"xxx";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    ModelIndex *model = [self.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = model.isOpen?@"现在是展开状态":@"现在是关闭状态";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ModelIndex *model = [self.dataSource objectAtIndex:indexPath.row];
    
    model.isOpen = !model.isOpen;
    
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    
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

