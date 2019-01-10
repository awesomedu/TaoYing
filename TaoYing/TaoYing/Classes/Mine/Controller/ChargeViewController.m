//
//  ChargeViewController.m
//  TaoYing
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "ChargeViewController.h"

@interface ChargeViewController ()
@property (weak, nonatomic) IBOutlet UIView *backView1;
@property (weak, nonatomic) IBOutlet UIView *backView2;
@property (weak, nonatomic) IBOutlet UIView *backView3;
@property (weak, nonatomic) IBOutlet UIView *backView4;

@end

@implementation ChargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *arr = @[
                     _backView1,
                     _backView2,
                     _backView3,
                     _backView4
                     ];
    
    [arr enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //阴影设置
        obj.layer.shadowColor = [UIColor blackColor].CGColor;
        obj.layer.shadowOffset = CGSizeMake(4, 4);
        obj.layer.shadowOpacity = 0.5;
        obj.layer.shadowRadius = 4.0;
        obj.layer.cornerRadius = 10.0;
    }];
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
