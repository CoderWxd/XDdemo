//
//  PopViewController.m
//  PopTableView
//
//  Created by ztf on 15/12/17.
//  Copyright © 2015年 ztf. All rights reserved.
//

#import "PopViewController.h"
#import "PopViewCell.h"

typedef void(^CallBackBlock) (NSIndexPath *indexPath);

@interface PopViewController ()<UITableViewDataSource,UITableViewDelegate>
{
}
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSArray     *dataSource;
@property(nonatomic,  weak)CallBackBlock popCallBackBlock;

@end

@implementation PopViewController


static PopViewController *_popViewController;
+(instancetype)shareInstance
{
    if (!_popViewController) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _popViewController = [[[self class]alloc]init];
        });
    
    }
    return _popViewController;
}

-(instancetype)init
{
    if (self = [super init]) {
        self.view.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3];
        self.view.alpha = 0;
        
        CGFloat w = self.view.bounds.size.width / 2.0;
        CGFloat h = self.view.bounds.size.height / 2.0;
        CGFloat x = (self.view.bounds.size.width - w) / 2.0;
        CGFloat y = (self.view.bounds.size.height - h) / 2.0;
        CGRect frame = CGRectMake(x, y, w, h);
        
        self.tableview = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
        self.tableview.dataSource = self;
        self.tableview.delegate = self;
        [self.view addSubview:self.tableview];
    }
    return self;
}


+ (void)showInview:(UIView *)view WithData:(NSArray *)data animated:(BOOL)animated callBack:(CallBackBlock)callBack
{
    PopViewController *pop = [PopViewController shareInstance];
 
    if (view == nil) {
        view = [[UIApplication sharedApplication]keyWindow];
    }
    if (pop.dataSource == nil || pop.dataSource != data) {
        pop.dataSource = data;
        [pop.tableview reloadData];
    }
    
    if (callBack) {
        pop.popCallBackBlock = callBack;
    }
    
    if (animated) {
        [view addSubview:pop.view];
        [UIView animateWithDuration:0.3 animations:^{
            pop.view.alpha = 1;
        }];
    }else{
        pop.view.alpha = 1;
    }
    
}

+ (void)hide:(BOOL)animated
{
    PopViewController *pop = [PopViewController shareInstance];
    if (animated) {
        [UIView animateWithDuration:0.3 animations:^{
            pop.view.alpha = 0;
        }completion:^(BOOL finished) {
            [pop.view removeFromSuperview];
        }];
    }else{
        pop.view.alpha = 0;
        [pop.view removeFromSuperview];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.dataSource) {
        return self.dataSource.count;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    PopViewCell *cell = [PopViewCell dequeueReusableCellWithTableView:tableView forIndexPath:indexPath];
    
    NSString *fontName = self.dataSource[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",fontName];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont fontWithName:fontName size:14];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.popCallBackBlock) {
        self.popCallBackBlock(indexPath);
    }
    [PopViewController hide:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [PopViewController hide:YES];
}

@end
