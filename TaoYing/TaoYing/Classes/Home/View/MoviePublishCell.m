//
//  MoviePublishCell.m
//  TaoYing
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "MoviePublishCell.h"
#import <GTCommonKit.h>
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "MovieIntroduceItem.h"


@interface MoviePublishCell()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *itemTitleLabel;
@property (nonatomic, strong) UILabel *itemStyleLabel;
@property (nonatomic, strong) UILabel *itemDetailLabel;
@property (nonatomic, strong) UILabel *itemPublishTimeLabel;
@property (nonatomic, strong) UILabel *itemPreferLabel;
@property (nonatomic, strong) UILabel *itemIntroduceLabel;
@property (nonatomic, strong) UIButton *foldBtn;

@end

@implementation MoviePublishCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    _iconImageView = [[UIImageView alloc] init];
    _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
    _iconImageView.clipsToBounds = YES;
    [self addSubview:_iconImageView];
    
    _itemTitleLabel = [[UILabel alloc] init];
    _itemTitleLabel.textColor = [UIColor blackColor];
    _itemTitleLabel.font = [UIFont systemFontOfSize:17];
    [self addSubview:_itemTitleLabel];
    
    _itemStyleLabel = [[UILabel alloc] init];
    _itemStyleLabel.textColor = [UIColor lightGrayColor];
    _itemStyleLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:_itemStyleLabel];
    
    _itemDetailLabel = [[UILabel alloc] init];
    _itemDetailLabel.textColor = [UIColor lightGrayColor];
    _itemDetailLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:_itemDetailLabel];
    
    _itemPublishTimeLabel = [[UILabel alloc] init];
    _itemPublishTimeLabel.textColor = [UIColor lightGrayColor];
    _itemPublishTimeLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:_itemPublishTimeLabel];
    
    _itemPreferLabel = [[UILabel alloc] init];
    _itemPreferLabel.textColor = [UIColor gt_colorWithHexString:@"#cc3399"];
    _itemPreferLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:_itemPreferLabel];
    
    _itemIntroduceLabel = [[UILabel alloc] init];
    _itemIntroduceLabel.textColor = [UIColor lightGrayColor];
    _itemIntroduceLabel.numberOfLines = 0;
    _itemIntroduceLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:_itemIntroduceLabel];
    
    _foldBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_foldBtn setImage:[UIImage imageNamed:@"arrow_down"] forState:UIControlStateNormal];
    [_foldBtn setImage:[UIImage imageNamed:@"arrow_up"] forState:UIControlStateSelected];
    [_foldBtn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:_foldBtn];
}

- (void)btnclick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (self.delegate) {
        [self.delegate foldClick:sender];
    }
}

#pragma -mark layoutSubViews
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak __typeof(self) weakSelf = self;
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self).offset(10);
        make.width.mas_equalTo(140);
        make.height.mas_equalTo(160);
    }];
    
    [_itemTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.iconImageView.mas_right).offset(10);
        make.top.mas_equalTo(weakSelf.iconImageView).offset(10);
    }];
    
    [_itemStyleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.itemTitleLabel);
        make.top.mas_equalTo(weakSelf.itemTitleLabel.mas_bottom).offset(20);
    }];
    
    [_itemDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.itemStyleLabel);
        make.top.mas_equalTo(weakSelf.itemStyleLabel.mas_bottom).offset(10);
    }];
    
    [_itemPublishTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.itemDetailLabel);
        make.top.mas_equalTo(weakSelf.itemDetailLabel.mas_bottom).offset(10);
    }];
    
    [_itemPreferLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.itemPublishTimeLabel);
        make.bottom.mas_equalTo(weakSelf.iconImageView).offset(-7);
    }];
    
    [_foldBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(weakSelf);
        make.height.mas_equalTo(20);
        make.bottom.mas_equalTo(weakSelf);
    }];
    
    [_itemIntroduceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf).offset(10);
        make.right.mas_equalTo(weakSelf).offset(-10);
        make.top.mas_equalTo(weakSelf.iconImageView.mas_bottom).offset(12);
        make.bottom.mas_equalTo(weakSelf.foldBtn.mas_top);
    }];
}


- (void)setItem:(MovieIntroduceItem *)item{
    _item = item;
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:item.imageUrl]];
    _itemTitleLabel.text = item.itemTitle;
    _itemStyleLabel.text = item.itemType;
    _itemDetailLabel.text = item.itemDetail;
    _itemPublishTimeLabel.text = item.itemTime;
    _itemPreferLabel.text = item.itemPrefer;
    _itemIntroduceLabel.text = item.introduce;
}


@end
