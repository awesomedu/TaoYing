//
//  MoviePublicCommentsHeaderView.m
//  TaoYing
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "MoviePublicCommentsHeaderView.h"
#import <Masonry.h>
#import <GTCommonKit.h>

@interface MoviePublicCommentsHeaderView ()

@property (nonatomic, strong) UILabel *itemTitleLabel;
@property (nonatomic, strong) UIButton *itemCommentBtn;

@end

@implementation MoviePublicCommentsHeaderView


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
    label.text = @"评论";
    self.itemTitleLabel = label;
    [self addSubview:self.itemTitleLabel];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"写短评" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn setTitleColor:[UIColor gt_colorWithHexString:@"#cc3399"] forState:UIControlStateNormal];
    self.itemCommentBtn = btn;
    [self addSubview:self.itemCommentBtn];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self.itemTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(self);
    }];
    
    [self.itemCommentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-10);
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(70);
    }];
}

- (void)layoutSublayersOfLayer:(CALayer *)layer{
    [super layoutSublayersOfLayer:layer];
    self.itemCommentBtn.layer.borderWidth = 1;
    self.itemCommentBtn.layer.masksToBounds = YES;
    self.itemCommentBtn.layer.borderColor = [UIColor gt_colorWithHexString:@"#cc3399"].CGColor;
    self.itemCommentBtn.layer.cornerRadius = self.itemCommentBtn.frame.size.height / 2;
}
    




@end
