//
//  MoviePublishShareCollectionViewCell.m
//  TaoYing
//
//  Created by 唐都 on 2019/1/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "MoviePublishShareCollectionViewCell.h"
#import <Masonry.h>
#import <GTCommonKit.h>
#import "MoviePubliishViewController.h"
#import <UIImageView+WebCache.h>
#import <JSHAREService.h>
#import <FSActionSheet.h>
#import "MBProgressHUD+GTCommonHud.h"

@interface MoviePublishShareCollectionViewCell()
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) UIImageView *shareImageView;

@end

@implementation MoviePublishShareCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    self.shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.shareButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.shareButton setTitle:@"复制分享语并转发朋友圈开始创业" forState:UIControlStateNormal];
    [self.shareButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.shareButton addTarget:self action:@selector(shareClick) forControlEvents:UIControlEventTouchUpInside];
    self.shareButton.backgroundColor = [UIColor gt_colorWithHexString:@"#cd349a"];
    [self addSubview:self.shareButton];
    
    self.shareImageView = [UIImageView new];
    self.shareImageView.image = [UIImage imageNamed:@"touxiang"];
    [self addSubview:self.shareImageView];
    
    /// test data
    [self.shareImageView sd_setImageWithURL:[NSURL URLWithString:@"http://148.70.53.15:8088/banner/18/20181228113138.png"]];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self).offset(10);
        make.right.mas_equalTo(self).offset(-10);
        make.bottom.mas_equalTo(self.shareImageView.mas_top).offset(-10);
        make.height.mas_equalTo(40);
    }];
    self.shareButton.layer.cornerRadius = 6;
    
    [self.shareImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.shareButton);
        make.bottom.mas_equalTo(self).offset(-10);
    }];
    self.shareImageView.layer.cornerRadius = 6;
}

- (void)shareClick{
    NSMutableArray *actionSheetItems = [@[FSActionSheetTitleItemMake(FSActionSheetTypeNormal, @"发送给朋友"),
                                          FSActionSheetTitleItemMake(FSActionSheetTypeNormal, @"发送到朋友圈"),
                                          ]mutableCopy];
    FSActionSheet *actionSheet = [[FSActionSheet alloc] initWithTitle:nil cancelTitle:nil items:actionSheetItems];
    // 展示并绑定选择回调
    [actionSheet showWithSelectedCompletion:^(NSInteger selectedIndex) {
        if (selectedIndex == 0) {
            [self shareToPlatForm:JSHAREPlatformWechatSession];
        }
        if (selectedIndex == 1) {
            [self shareToPlatForm:JSHAREPlatformWechatTimeLine];
        }
    }];

}
    
- (void)shareToPlatForm:(JSHAREPlatform)platForm{
    NSLog(@"___%s___",__func__);
    JSHAREMessage *message = [JSHAREMessage message];
    message.text = @"welcome to use yingxiaoer";
    message.platform = platForm;
    message.mediaType = JSHAREText;
    [JSHAREService share:message handler:^(JSHAREState state, NSError *error) {
        if (state == JSHAREStateSuccess) {
            [MBProgressHUD showSuccessMessage:@"分享成功"];
        }else if (state == JSHAREStateFail){
            [MBProgressHUD showSuccessMessage:@"分享失败"];
        }else if (state == JSHAREStateCancel){
            [MBProgressHUD showSuccessMessage:@"分享取消"];
        }
    }];
}

- (UIViewController *)parentController
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[MoviePubliishViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
