//
//  LoginViewController.m
//  TaoYing
//
//  Created by mac on 2019/1/7.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "LoginViewController.h"
#import "MainTabBarViewController.h"

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (IBAction)loginClick:(UIButton *)sender {
    UIStoryboard *mainTabSb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    MainTabBarViewController *mVc = [mainTabSb instantiateViewControllerWithIdentifier:@"MainTabBarViewController"];
    [UIApplication sharedApplication].keyWindow.rootViewController = mVc;
}



@end
