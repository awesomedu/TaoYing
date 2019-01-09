//
//  MovieTopCollectionViewCell.m
//  TaoYing
//
//  Created by mac on 2019/1/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "MovieTopCollectionViewCell.h"
#import "HomeZoneTopItem.h"
#import <Masonry.h>
#import <GTCommonKit.h>

#define itemTopMargin 12

@interface MovieTopCollectionViewCell()
@property (strong , nonatomic)UIImageView *zoneImageView;
@property (strong , nonatomic)UILabel *zoneLabel;

@end

@implementation MovieTopCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    _zoneImageView = [[UIImageView alloc] init];
    _zoneImageView.contentMode = UIViewContentModeScaleAspectFill;
    _zoneImageView.clipsToBounds = YES;
    [self addSubview:_zoneImageView];
    
    _zoneLabel = [[UILabel alloc] init];
    _zoneLabel.font = [UIFont systemFontOfSize:13];
    _zoneLabel.textColor = [UIColor grayColor];
    _zoneLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_zoneLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_zoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self)setOffset:itemTopMargin];
        make.size.mas_equalTo(CGSizeMake((kWidth - 220) / 5, (kWidth - 230) / 5));
        make.centerX.mas_equalTo(self);
    }];
    
    __weak __typeof(self) weakSelf = self;
    [_zoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(weakSelf.zoneImageView.mas_bottom)setOffset:5];
    }];
}

- (void)setZoneItem:(HomeZoneTopItem *)zoneItem{
    _zoneItem = zoneItem;
    _zoneLabel.text = zoneItem.zoneTitle;
    _zoneImageView.image = [UIImage imageNamed:zoneItem.iconImage];
}


@end
