//
//  QQGroupViewController.m
//  Demo-Project
//
//  Created by 王晓栋 on 2018/1/5.
//  Copyright © 2018年 王晓栋. All rights reserved.
//

#import "QQGroupViewController.h"
#import "NSObject+DLSubViews.h"
#define dic_array @"zuarray"

#define dic_title @"title"

#define dic_status @"status"

@interface QQGroupViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;

@property(nonatomic, strong) NSMutableArray *array;
@end

@implementation QQGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Color_Ground;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH,SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.tableView.tableFooterView =[[UIView alloc]init];
    [self initDataArray];
    
}
-(void)initDataArray{
    _array = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 20; i++) {
        
        
        NSMutableArray *zuarray =[[NSMutableArray alloc] init];
        for (int j = 0; j< 10; j++) {
            
            NSString *string = [NSString stringWithFormat:@"第%d组,第%d行",i,j];
            [zuarray addObject:string];
            
            
        }
        
        NSString *str = [NSString stringWithFormat:@"第%d分组",i];
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:str,dic_title,zuarray,dic_array,[NSNumber numberWithInt:0],dic_status,nil];
        [_array addObject:dict];
    }
}
#pragma mark -datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _array.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSDictionary *dict = [_array objectAtIndex:section];
    NSArray *array = [dict objectForKey:dic_array];
    
    if ([[dict objectForKey:dic_status]intValue]) {
        return array.count;
    }else{
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSArray *array1 = [[_array objectAtIndex:indexPath.section] objectForKey:dic_array];
    cell.textLabel.text = [array1 objectAtIndex:indexPath.row];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *hView = [[UIView alloc]initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, 44)];
    
    hView.backgroundColor=[UIColor whiteColor];
    
    UIButton* eButton = [[UIButton alloc] init];
    
    //按钮填充整个视图
    eButton.frame = hView.frame;
    
    [eButton addTarget:self action:@selector(expandButtonClicked:)
     
      forControlEvents:UIControlEventTouchUpInside];
    
    
    eButton.tag = section;
    
    //设置图标
    
    //根据是否展开，切换按钮显示图片
    
    if ([self isExpanded:section]){
        
        [eButton setImage: [UIImage imageNamed: @"image/arrow_right_grey" ]forState:UIControlStateNormal];
    } else {
        
        [eButton setImage: [UIImage imageNamed: @"image/arrow_down_grey" ]forState:UIControlStateNormal];
    }
    //设置分组标题
    
    [eButton setTitle:[[_array objectAtIndex:section] objectForKey:dic_title] forState:UIControlStateNormal];
    
    [eButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //设置button的图片和标题的相对位置
    
    //4个参数是到上边界，左边界，下边界，右边界的距离
    eButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [eButton setTitleEdgeInsets:UIEdgeInsetsMake(5, -5, 0, 0)];
    
    [eButton setImageEdgeInsets:UIEdgeInsetsMake(5, hView.bounds.size.width- 20, 5, -5)];
    //下显示线
    
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, hView.frame.size.height-1, hView.frame.size.width,1)];
    
    label.backgroundColor = [UIColor grayColor];
    [hView addSubview:label];
    
    [hView addSubview: eButton];
    
    return hView;
}
- (int)isExpanded:(NSInteger)section
{
    NSDictionary *dict = [_array objectAtIndex:section];
    return  [[dict objectForKey:dic_status] intValue];
}

- (void)expandButtonClicked:(UIButton *)btn{
    
    NSDictionary *dict = [_array objectAtIndex:btn.tag];
    int a = [[dict objectForKey:dic_status]intValue] ;
    if (a) {
        [dict setValue:[NSNumber numberWithInt:0] forKey:dic_status];
    }else{
        [dict setValue:[NSNumber numberWithInt:1] forKey:dic_status];
    }
    
    [self.tableView reloadData];
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


