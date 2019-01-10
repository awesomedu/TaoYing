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
#import <UMShare/UMShare.h>
#import "MoviePubliishViewController.h"

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
    NSLog(@"___%s___",__func__);
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //创建图片内容对象
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //如果有缩略图，则设置缩略图
    shareObject.thumbImage = [UIImage imageNamed:@"icon"];
    [shareObject setShareImage:@"https://mobile.umeng.com/images/pic/home/social/img-1.png"];
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_Line messageObject:messageObject currentViewController:[self parentController] completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
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
