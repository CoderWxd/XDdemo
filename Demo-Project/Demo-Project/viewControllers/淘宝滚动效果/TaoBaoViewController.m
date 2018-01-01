//
//  TaoBaoViewController.m
//  Demo-Project
//
//  Created by 王晓栋 on 2018/1/5.
//  Copyright © 2018年 王晓栋. All rights reserved.
//

#import "TaoBaoViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"

@interface TaoBaoViewController ()<UIScrollViewDelegate>
{
        BOOL _canScroll;
    
}
@property(nonatomic,strong)ViewController1 *v1;
@property(nonatomic,strong)ViewController2 *v2;

@end

@implementation TaoBaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Color_Ground;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"淘宝滚动效果";
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*2)];
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH,SCREEN_HEIGHT*2);
    
    self.v1 = [[ViewController1 alloc]initWithNibName:@"ViewController1" bundle:nil];
    self.v2 = [[ViewController2 alloc]initWithNibName:@"ViewController2" bundle:nil];
    
    [self addChildViewController:self.v1];
    [self addChildViewController:self.v2];
    
    
    [self.scrollView addSubview:self.v1.view];
    [self.scrollView addSubview:self.v2.view];
    
    
    self.v1.supervc = self;
    self.v2.supervc = self;
    
    self.v1.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.v2.view.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
//    NSLog(@"000ofset :%@",@(scrollView.contentOffset.y));
    
    
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
