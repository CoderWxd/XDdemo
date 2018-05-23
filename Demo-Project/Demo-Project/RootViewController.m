//
//  RootViewController.m
//  Demo-Project
//
//  Created by 王晓栋 on 2018/1/5.
//  Copyright © 2018年 王晓栋. All rights reserved.
//

#import "RootViewController.h"
#import "OpenCellViewController.h"
#import "QQGroupViewController.h"
#import "HeaderScaleImageVc.h"
#import "CollectionVC.h"
#import "KeyChainViewController.h"
#import "PopViewController.h"
#import "TaoBaoViewController.h"
#import "SaoYiSaoViewController.h"
#import "CoreTextViewController.h"
#import "DNHeadViewScaleViewController.h"
#import "ShowCellViewController.h"
#import "DNCollectionViewController.h"

@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Demo";
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.dataSource = [NSMutableArray arrayWithObjects:
                       @"展开cell",
                       @"QQGroup",
                       @"HeaderScaleImage",
                       @"错乱排布",
                       @"keyChain存储",
                       @"PopView",
                       @"淘宝滚动效果",
                       @"SaoYiSao",
                       @"CoreText",
                       @"获取文件的大小和清除缓存",
                       @"巧妙实现悬浮tableviewHeaderView方法",
                       @"UITableViewCell的展开与收缩",
                       @"自定义UICollectionView的布局",
                       nil];
    [self.tableView reloadData];
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *text = [self.dataSource objectAtIndex:indexPath.row];
    if ([text isEqualToString:@"展开cell"]) {// cell内容变化
        OpenCellViewController *openCellVc = [[OpenCellViewController alloc] init];
        [self.navigationController pushViewController:openCellVc animated:YES];
    }else if ([text isEqualToString:@"QQGroup"]){//分组展开
        
        QQGroupViewController *qqGroupVc = [[QQGroupViewController alloc] init];
        [self.navigationController pushViewController:qqGroupVc animated:YES];
    }else if ([text isEqualToString:@"HeaderScaleImage"]){//头部缩小放大
        HeaderScaleImageVc *headerScaleImageVc = [[HeaderScaleImageVc alloc] init];
        [self.navigationController pushViewController:headerScaleImageVc animated:YES];
    }
    else if ([text isEqualToString:@"错乱排布"]){//collectionView实现错乱分布
        CollectionVC *collectionVc = [[CollectionVC alloc] init];
        [self.navigationController pushViewController:collectionVc animated:YES];
    }else if ([text isEqualToString:@"keyChain存储"]){//@"keyChain存储"
        KeyChainViewController *keyChainVc = [[KeyChainViewController alloc] init];
        [self.navigationController pushViewController:keyChainVc animated:YES];
    }
    else if ([text isEqualToString:@"PopView"]){//PopView
        [PopViewController showInview:self.view WithData:[UIFont familyNames] animated:YES callBack:^(NSIndexPath *indexPath) {
            
            NSLog(@"---------------:%@",@(indexPath.row));
        }];

    }else if ([text isEqualToString:@"淘宝滚动效果"]){//淘宝滚动效果
        TaoBaoViewController *taoBaoVc = [[TaoBaoViewController alloc] init];
        [self.navigationController pushViewController:taoBaoVc animated:YES];
    }else if ([text isEqualToString:@"SaoYiSao"]){//SaoYiSao
        SaoYiSaoViewController *taoBaoVc = [[SaoYiSaoViewController alloc] init];
        [self.navigationController pushViewController:taoBaoVc animated:YES];
    }
    else if ([text isEqualToString:@"CoreText"]){//CoreText
        CoreTextViewController *coreTextVc = [[CoreTextViewController alloc] init];
        [self.navigationController pushViewController:coreTextVc animated:YES];
    }
    else if ([text isEqualToString:@"获取文件的大小和清除缓存"]){//@"获取文件的大小和清除缓存"
        CoreTextViewController *coreTextVc = [[CoreTextViewController alloc] init];
        [self.navigationController pushViewController:coreTextVc animated:YES];
    }else if ([text isEqualToString:@"巧妙实现悬浮tableviewHeaderView方法"]){
        DNHeadViewScaleViewController *coreTextVc = [[DNHeadViewScaleViewController alloc] init];
        [self.navigationController pushViewController:coreTextVc animated:YES];
    }else if ([text isEqualToString:@"UITableViewCell的展开与收缩"]){
        ShowCellViewController *coreTextVc = [[ShowCellViewController alloc] init];
        [self.navigationController pushViewController:coreTextVc animated:YES];
    }else if ([text isEqualToString:@"自定义UICollectionView的布局"]){
         DNCollectionViewController *coreTextVc = [[DNCollectionViewController alloc] init];
        [self.navigationController pushViewController:coreTextVc animated:YES];
    } 
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
