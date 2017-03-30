//
//  Person.h
//  归档与解档
//
//  Created by 王晓栋 on 16/6/16.
//  Copyright © 2016年 百思为科. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *address;
//- (NSString *)description;
@end
