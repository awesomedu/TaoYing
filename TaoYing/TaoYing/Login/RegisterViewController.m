//
//  RegisterViewController.m
//  TaoYing
//
//  Created by mac on 2019/1/7.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "RegisterViewController.h"
#import "GTCommonKit.h"

@interface RegisterViewController ()
/// 手机号
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
/// 用户名
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
/// 密码
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
/// 验证码
@property (weak, nonatomic) IBOutlet UITextField *verfyCodeField;
/// 发送验证码
@property (weak, nonatomic) IBOutlet UIButton *verfyButton;
/// 确定
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
/// 同意协议
@property (weak, nonatomic) IBOutlet UIButton *agreeButton;

@end

@implementation RegisterViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    [self addNotiTheField];
}

- (void)setUpUI{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.verfyCodeButton.bounds      byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight    cornerRadii:CGSizeMake(3, 3)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.verfyCodeButton.bounds;
    maskLayer.path = maskPath.CGPath;
    self.verfyCodeButton.layer.mask = maskLayer;
}

- (void)addNotiTheField{
    NSArray *fieldArr = @[
                          _phoneTextField,
                          _userNameTextField,
                          _pwdTextField,
                          _verfyCodeField
                          ];
    [fieldArr enumerateObjectsUsingBlock:^(UITextField*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"obj = %@",obj);
        [obj addTarget:self action:@selector(changedTextField:) forControlEvents:UIControlEventEditingChanged];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark -给每个textfield添加事件
-(void)changedTextField:(UITextField *)textField
{
    if ([_phoneTextField.text isNotEmptyWords] &&
        [_userNameTextField.text isNotEmptyWords] &&
        [_pwdTextField.text isNotEmptyWords] &&
        [_verfyCodeField.text isNotEmptyWords]) {
        _confirmButton.backgroundColor = [UIColor gt_colorWithHexString:@"#DA4B96"];
        
        [_confirmButton setTitleColor:[UIColor gt_colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
    }else{
        _confirmButton.backgroundColor = [UIColor gt_colorWithHexString:@"#DDDDDD"];
        [_confirmButton setTitleColor:[UIColor gt_colorWithHexString:@"#AAAAAA"] forState:UIControlStateNormal];
    }
}

- (IBAction)verfyBtnClick:(UIButton *)sender {
    
    [sender gt_countTimeTask];
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
