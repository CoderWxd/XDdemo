//
//  KeyChainViewController.m
//  Demo-Project
//
//  Created by 王晓栋 on 2018/1/5.
//  Copyright © 2018年 王晓栋. All rights reserved.
//

#import "KeyChainViewController.h"
#import "keyChain.h"

@interface KeyChainViewController ()

@end

@implementation KeyChainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = Color_Ground;
    self.title = @"keyChain存储";
    //注意先导入
    /**
     1234为存储的密码
     第一步:导入Security.framework框架
     第二步:点击项目,点Build Phases 修改制定的文件夹为 -fno-objc-arc
     */
    NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
    [usernamepasswordKVPairs setObject:@"1234" forKey:KEY_PASSWORD];
    [usernamepasswordKVPairs setObject:@"wxd" forKey:KEY_USERNAME_PASSWORD];
    //    [ save:KEY_USERNAME_PASSWORD data:usernamepasswordKVPairs];
    [keyChain save:KEY_USERNAME_PASSWORD data:usernamepasswordKVPairs];
    
  
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    NSMutableDictionary *usernamepasswordKVPairs = (NSMutableDictionary *)[keyChain load:KEY_USERNAME_PASSWORD];
    NSLog(@"%@",[usernamepasswordKVPairs objectForKey:KEY_PASSWORD]);
    NSLog(@"%@",[usernamepasswordKVPairs objectForKey:KEY_USERNAME_PASSWORD]);
    
    //删除
//    [keyChain delete:KEY_USERNAME_PASSWORD];

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
