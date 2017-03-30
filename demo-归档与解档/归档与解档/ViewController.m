//
//  ViewController.m
//  归档与解档
//
//  Created by 王晓栋 on 16/6/16.
//  Copyright © 2016年 百思为科. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *p = [[Person alloc] init];
    p.name = @"wxd";
    p.age = 19;
    p.address = @"ddddd";
    
    
    // 归档
    NSArray *searchArr =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *path = [searchArr objectAtIndex:0];
    
    NSString *homePath = [path stringByAppendingPathComponent:@"person"];
    
    BOOL success =  [NSKeyedArchiver archiveRootObject:p toFile:homePath];
    if (success) {
        NSLog(@"归档成功");
    }
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 解档
    NSArray *searchArr =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [searchArr objectAtIndex:0];
    NSString *homePath = [path stringByAppendingPathComponent:@"person"];
    Person *p = [NSKeyedUnarchiver unarchiveObjectWithFile:homePath];
    
    NSLog(@"%@",p.name);
    NSLog(@"%zd",p.age);
    NSLog(@"%@",p.address);
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)text{
    /**
     归档array对象
     */
    NSArray *searchArr =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *path = [searchArr objectAtIndex:0];
    
    NSString *homePath = [path stringByAppendingPathComponent:@"person"];
    
    
    NSArray *array = [NSArray arrayWithObjects:@"wxd",@"19",@"ddd",nil];
    BOOL success = [NSKeyedArchiver archiveRootObject:array toFile:homePath];
    if (success) {
        NSLog(@"归档成功");
    }
    
    /**
     解档array对象
     */
    
    NSArray *jiedangArray = [NSKeyedUnarchiver unarchiveObjectWithFile:homePath];
    NSLog(@"%@",jiedangArray);

    

}

@end
