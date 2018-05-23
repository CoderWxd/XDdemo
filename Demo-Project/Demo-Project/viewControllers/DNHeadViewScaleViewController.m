
//
//  DNHeadViewScaleViewController.m
//  Demo-Project
//
//  Created by 王晓栋 on 2018/5/14.
//  Copyright © 2018年 王晓栋. All rights reserved.
//

#import "DNHeadViewScaleViewController.h"
#import "DNHeadView.h"

@interface DNHeadViewScaleViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *mainTable;
    DNHeadView *headerView;
    NSMutableArray *tableData;
}
@end

@implementation DNHeadViewScaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    mainTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    mainTable.delegate = self;
    mainTable.dataSource = self;
    mainTable.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    mainTable.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:mainTable];
    //添加监听，动态观察tableview的contentOffset的改变
    [mainTable addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    tableData = @[@"12",@"werd",@"sdfgd",@"fs"];
    headerView = [[DNHeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    headerView.backgroundColor =[UIColor redColor];
    [self.view addSubview:headerView];
    
   }
#pragma mark KVC 回调
//本例设置headerView的最大高度为200，最小为64
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]) {
        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
        if (offset.y <= 0 && -offset.y >= 64) {
            CGRect newFrame = CGRectMake(0, 0, self.view.frame.size.width, -offset.y);
            headerView.frame = newFrame;
            if (-offset.y <=200) {
                mainTable.contentInset = UIEdgeInsetsMake(-offset.y, 0, 0, 0);
                
            }
            
        } else {
            CGRect newFrame = CGRectMake(0, 0, self.view.frame.size.width, 64); headerView.frame = newFrame; mainTable.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
            
        }
        
    }
    
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tableData.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = tableData[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
