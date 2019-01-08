//
//  LoginViewController.h
//  TaoYing
//
//  Created by mac on 2019/1/7.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;

@end

NS_ASSUME_NONNULL_END
