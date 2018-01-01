//
//  FileCacheManager.h
//  获取缓存文件的大小
//
//  Created by 王晓栋 on 16/6/27.
//  Copyright © 2016年 百思为科. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileCacheManager : NSObject

/**
 *  计算文件夹的尺寸
 *
 *  @param directoriesPath 文件路径
 *  @param completeBlock   计算完之后回调
 */
+ (void)getCacheSizeOfDirectoriesPath:(NSString *)directoriesPath completeBlock:(void(^)(NSInteger))completeBlock;

/**
 清除缓存
 */
+ (void)removeDirectoriesPath:(NSString *)directoriesPath;

@end
