//
//  DLCoreSpotlightViewController.m
//  Demo-Project
//
//  Created by 王晓栋 on 2018/5/23.
//  Copyright © 2018年 王晓栋. All rights reserved.
//

#import "DLCoreSpotlightViewController.h"
#import "NewsModel.h"
#import <CoreSpotlight/CoreSpotlight.h>

@interface DLCoreSpotlightViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSArray * dataArray;

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation DLCoreSpotlightViewController

/**
 iOS 9新特性 搜索直接进入app
 **/
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 80;
    [self getNewsData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NewsCell"];
    }
    NewsModel *model = self.dataArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:model.imgUrl];
    //    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    cell.textLabel.text = model.title;
    
    return cell;
}


-(void)getNewsData{
    
    NSMutableArray<CSSearchableItem *> *items = [NSMutableArray array];
    
    for (NewsModel *model in self.dataArray) {
        CSSearchableItemAttributeSet *csSet = [[CSSearchableItemAttributeSet alloc]initWithItemContentType:@"test"];
        csSet.title = model.title;
        csSet.contentDescription = model.webUrl;
        csSet.thumbnailData = UIImagePNGRepresentation([UIImage imageNamed:model.imgUrl]);
        
        CSSearchableItem *csItem = [[CSSearchableItem alloc]initWithUniqueIdentifier:model.sId domainIdentifier:@"coreSportlightDemo" attributeSet:csSet];
        [items addObject:csItem];
    }
    
    //将值注入到系统中
    [[CSSearchableIndex defaultSearchableIndex]indexSearchableItems:items completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"had error:%@",error);
        }
    }];
}


-(NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSArray array];
        
        NewsModel *m1 = [NewsModel newsWithsId:@"s01" title:@"U.S. media: the renowned British Spitfire antique machine for $4 million 800 thousand" imgUrl:@"11" webUrl:@"http://club.china.com/data/thread/247374811/2783/12/41/7_1.html"];
        NewsModel *m2 = [NewsModel newsWithsId:@"s02" title:@"第88OSCar届奥斯卡尘埃落定 看各项大奖花落谁家" imgUrl:@"12" webUrl:@"http://photos.caixin.com/2016-02-29/100914029.html"];
        NewsModel *m3 = [NewsModel newsWithsId:@"s03" title:@"两会特别策划：《中国人家》之上海人家" imgUrl:@"13" webUrl:@"http://slide.news.sina.com.cn/c/slide_1_75490_95880.html/d/1"];
        NewsModel *m4 = [NewsModel newsWithsId:@"s04" title:@"重庆轻轨列车穿楼而过场面震撼" imgUrl:@"14" webUrl:@"http://slide.news.sina.com.cn/c/slide_1_2841_95918.html/d/1#p=1"];
        _dataArray = @[m1,m2,m3,m4];
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
