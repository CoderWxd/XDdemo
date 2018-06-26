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
#import "DLCoreSpotlightViewController.h"
#import "DLLabelTapViewController.h"
#import "DEMOLeftMenuViewController.h"
#import "DEMORightMenuViewController.h"
#import "DEMOFirstViewController.h"
#import "DEMOSecondViewController.h"

@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate,RESideMenuDelegate>
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
                       @"IOS9 CoreSpotlight 搜索",
                       @"UILabel的特殊字符点击",
                       @"RESideMenu",
                       nil];
    [self.tableView reloadData];
    [self text];
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
    }else if ([text isEqualToString:@"IOS9 CoreSpotlight 搜索"]){
        DLCoreSpotlightViewController *coreTextVc = [[DLCoreSpotlightViewController alloc] init];
        [self.navigationController pushViewController:coreTextVc animated:YES];
    }else if ([text isEqualToString:@"UILabel的特殊字符点击"]){
        DLLabelTapViewController *coreTextVc = [[DLLabelTapViewController alloc] init];
        [self.navigationController pushViewController:coreTextVc animated:YES];
    }
    else if ([text isEqualToString:@"RESideMenu"]){
        
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[DEMOFirstViewController alloc] init]];
        DEMOLeftMenuViewController *leftMenuViewController = [[DEMOLeftMenuViewController alloc] init];
        DEMORightMenuViewController *rightMenuViewController = [[DEMORightMenuViewController alloc] init];
        
        RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:navigationController
                                                                        leftMenuViewController:leftMenuViewController
                                                                       rightMenuViewController:rightMenuViewController];
        sideMenuViewController.backgroundImage = [UIImage imageNamed:@"image/Stars"];
        sideMenuViewController.menuPreferredStatusBarStyle = 1; // UIStatusBarStyleLightContent
        sideMenuViewController.delegate = self;
        sideMenuViewController.contentViewShadowColor = [UIColor blackColor];
        sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
        sideMenuViewController.contentViewShadowOpacity = 0.6;
        sideMenuViewController.contentViewShadowRadius = 12;
        sideMenuViewController.contentViewShadowEnabled = YES;
        [UIApplication sharedApplication].keyWindow.rootViewController = sideMenuViewController;
    }
    
    
}

#pragma mark -
#pragma mark RESideMenu Delegate

- (void)sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"willShowMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu didShowMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"didShowMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu willHideMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"willHideMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"didHideMenuViewController: %@", NSStringFromClass([menuViewController class]));
}


//测试
- (void)text{
    [RootViewController functionName:@"aaa",@"bbb",@"ccc",@"ddd",nil];
//    [RootViewController tf_executeSelector:nil withTarget:self withParams:@"aaa",@"bbb",@"ccc",@"ddd",nil];
//    [RootViewController functionName2:@"aaa",@"bbb",@"ccc",@"ddd",nil];
    
}

//c语言用法 遍历不规则变量

+ (void)functionName:(NSObject *)name, ...{
    
    va_list args;
    va_start(args, name);
    if(name){
//        NSString *objectName;
//        NSLog(@"%@",va_arg(args, NSString *));
        while ((name = va_arg(args, NSString *))) {
            NSLog(@"objectName=%@",name);
         }
    }
    va_end(args);
}

//va_list args：定义一个指向个数可变的参数列表指针；
//
//va_start(args,string)：string为第一个参数，也就是最右边的已知参数,这里就是获取第一个可选参数的地址.使参数列表指针指向函数参数列表中的第一个可选参数，函数参数列表中参数在内存中的顺序与函数声明时的顺序是一致的。
//
//va_arg(args,NSString)：返回参数列表中指针所指的参数，返回类型为NSString，并使参数指针指向参数列表中下一个参数。
//
//va_end(args)：清空参数列表，并置参数指针args无效。

+(id)tf_executeSelector:(SEL)_sel withTarget:(id)_target  withParams:(id)params,...
{
    id arg;
    //define a pointer to the mutable paramter
    va_list _p_list;
    //va_start:get the first address of paramter
    va_start(_p_list, params);
    NSMutableArray *_obj_params =[NSMutableArray arrayWithCapacity:5];
    if (params) {
        //add the first paramter to array
        id pre = params;
        [_obj_params addObject:pre];
        @try {
            //point to the next address
            while ((arg = va_arg(_p_list, id))) {
                if (arg) {
                    [_obj_params addObject:arg];
                }
            }
        } @catch (NSException *exception) {
            NSCAssert(NO,@"%s paramter type error!",__func__);
        } @finally {}
    }
    //clear
    va_end(_p_list);
    return nil;
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
