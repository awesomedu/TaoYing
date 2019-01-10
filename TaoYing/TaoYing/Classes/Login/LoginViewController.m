//
//  LoginViewController.m
//  TaoYing
//
//  Created by mac on 2019/1/7.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "LoginViewController.h"
#import "MainTabBarViewController.h"
#import "TDRequest.h"
#import "NSString+MD5.h"
#import "MBProgressHUD+GTCommonHud.h"
#import "UserDetailModel.h"

@implementation LoginViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self configureUI];
}

- (void)configureUI{
    NSArray *fieldArr = @[
                          _loginField,
                          _pwdField
                          ];
    [fieldArr enumerateObjectsUsingBlock:^(UITextField *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 0)] ;
        obj.leftView.userInteractionEnabled = NO;
        obj.leftViewMode = UITextFieldViewModeAlways;
        // Text 垂直居中
        obj.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    }];
    
}

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
    NSString *md5Str = [NSString MD5ForLower32Bate:_pwdField.text];
    [MBProgressHUD showActivityMessageInWindow:LoadingString];
    [TDRequest loginWithUserName:_loginField.text pwd:md5Str success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [MBProgressHUD hideHUD];
        NSLog(@"res = %@",responseObject);
        if ([responseObject[@"code"] integerValue]== 200) {
            //save info
            [[UserDetailModel shareInstance] setModel:responseObject[@"data"]];
            [UserDetailModel save];
            UIStoryboard *mainTabSb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            MainTabBarViewController *mVc = [mainTabSb instantiateViewControllerWithIdentifier:@"MainTabBarViewController"];
            [UIApplication sharedApplication].keyWindow.rootViewController = mVc;
        }else{
            [MBProgressHUD showErrorMessage:LoginWrong];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUD];
        NSLog(@"err = %@",error.description);
    }];
 
}



@end
