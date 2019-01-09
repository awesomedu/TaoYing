//
//  MoviePublishCommonheaderView.m
//  TaoYing
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "MoviePublishCommonheaderView.h"
#import <Masonry.h>

@interface MoviePublishCommonheaderView()
@property (nonatomic, strong) UILabel *headerTitleLabel;
@property (nonatomic, strong) UIButton *headerAllBtn;

@end


@implementation MoviePublishCommonheaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:17];
    self.headerTitleLabel = label;
    [self addSubview:self.headerTitleLabel];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"全部" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.headerAllBtn = btn;
    [self addSubview:self.headerAllBtn];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.headerTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(self);
    }];
    
    [self.headerAllBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-10);
        make.centerY.mas_equalTo(self);
    }];
}

- (void)setHeaderTitleStr:(NSString *)headerTitleStr{
    _headerTitleStr = headerTitleStr;
    self.headerTitleLabel.text = headerTitleStr;
}




@end
