//
//  DNCollectionViewController.m
//  Demo-Project
//
//  Created by 王晓栋 on 2018/5/23.
//  Copyright © 2018年 王晓栋. All rights reserved.
//

#import "DNCollectionViewController.h"
#import "LineLayout.h"
#import "ViscosityLayout.h"
#import "CollectionViewCell.h"

@interface DNCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)NSMutableArray *dataArray;

@property (nonatomic,weak)UICollectionView *collectionView;

@end

@implementation DNCollectionViewController

static NSString *const ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自定义UICollectionView的布局";
    
    CGRect rect = CGRectMake(0, 160, self.view.frame.size.width, 180);
    LineLayout *flowLayout = [[LineLayout alloc]init];
//    ViscosityLayout *viscosityLayout = [[ViscosityLayout alloc]init];
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:flowLayout];
    [self.view addSubview:collectionView];
    collectionView.backgroundColor = [UIColor blackColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    //    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    [collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
    self.collectionView = collectionView;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //    [self.collectionView setCollectionViewLayout:[[UICollectionViewFlowLayout alloc]init] animated:YES];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.index = indexPath.item;
    //    cell.backgroundColor = KRandomColor;
    return cell;
}

-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        for (int i = 1; i<=20; i++) {
            [_dataArray addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return _dataArray;
}

@end
