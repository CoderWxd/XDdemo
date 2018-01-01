//
//  ClearCachesViewController.m
//  Demo-Project
//
//  Created by 王晓栋 on 2018/1/25.
//  Copyright © 2018年 王晓栋. All rights reserved.
//

#import "ClearCachesViewController.h"
#import "FileCacheManager.h"

@interface ClearCachesViewController ()

@end

@implementation ClearCachesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 缓存路径
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSLog(@"%@",path);
    
    [FileCacheManager getCacheSizeOfDirectoriesPath:path completeBlock:^(NSInteger totalSize) {
        NSString *fileSize = [self cacheStr:totalSize];
        NSLog(@"%@",fileSize);
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    // 清除缓存
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    [FileCacheManager removeDirectoriesPath:path];
}

// 获取缓存字符串
- (NSString *)cacheStr:(NSInteger)totalSize
{
    // 获取文件夹缓存尺寸:文件夹比较小,文件夹非常大,获取尺寸比较耗时
    CGFloat cacheSizeF = 0;
    NSString *cacheStr = @"清空缓存";
    if (totalSize > (1000 * 1000)) { //MB
        cacheSizeF = totalSize / (1000 * 1000);
        cacheStr = [NSString stringWithFormat:@"清空缓存(%.1fMB)",cacheSizeF];
        cacheStr = [cacheStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
    } else if (totalSize > 1000) { //KB
        cacheSizeF = totalSize / 1000;
        cacheStr = [NSString stringWithFormat:@"清空缓存(%.1fKB)",cacheSizeF];
    } else if (totalSize > 0){ // B
        cacheStr = [NSString stringWithFormat:@"清空缓存(%ldB)",totalSize];
    }
    
    return cacheStr;
}

@end
