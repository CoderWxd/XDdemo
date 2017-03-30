//
//  Person.m
//  归档与解档
//
//  Created by 王晓栋 on 16/6/16.
//  Copyright © 2016年 百思为科. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
    [aCoder encodeObject:self.address forKey:@"address"];
    
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    _name = [aDecoder decodeObjectForKey:@"name"];
    _age = [aDecoder decodeIntegerForKey:@"age"];
    _address = [aDecoder decodeObjectForKey:@"address"];
    return self;
}
// 当打印Person对象的时候,系统默认会调用description方法
//- (NSString *)description{
//    NSString *string = [NSString stringWithFormat:@"name=%@,age=%d,_address=%@",_name,_age,_address];
//    return string;
//}

@end
