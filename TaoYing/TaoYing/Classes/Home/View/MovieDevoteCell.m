//
//  MovieDevoteCell.m
//  TaoYing
//
//  Created by 唐都 on 2019/1/8.
//  Copyright © 2019 mac. All rights reserved.
//

#import "MovieDevoteCell.h"
#import <Masonry.h>
#import <GTCommonKit.h>
#import <UIImageView+WebCache.h>
#import "HomeMovieDevoteItem.h"

@interface MovieDevoteCell()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *itemNameLabel;
@property (nonatomic, strong) UILabel *itemTypeLabel;
@property (nonatomic, strong) UILabel *predictCostLabel;
@property (nonatomic, strong) UILabel *openPriceLabel;
@property (nonatomic, strong) UILabel *isBuyLabel;
@property (nonatomic, strong) UILabel *promiseLabel;
@property (nonatomic, strong) UILabel *protectLabel;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) UIProgressView *progressView;



@end


@implementation MovieDevoteCell

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor gt_colorWithHexString:@"#f8f8f8"];
        [self setUpUI];
    }
    return self;
}


- (void)setUpUI
{
    _imageView = [UIImageView new];
    [self addSubview:_imageView];
    
    _itemNameLabel = [UILabel new];
    _itemNameLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_itemNameLabel];
    
    _itemTypeLabel = [UILabel new];
    _itemTypeLabel.font = [UIFont systemFontOfSize:13];
    _itemTypeLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:_itemTypeLabel];
    
    _predictCostLabel = [UILabel new];
    _predictCostLabel.font = [UIFont systemFontOfSize:13];
    _predictCostLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:_predictCostLabel];
    
    
    _openPriceLabel = [UILabel new];
    _openPriceLabel.font = [UIFont systemFontOfSize:13];
    _openPriceLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:_openPriceLabel];
    
    _isBuyLabel = [UILabel new];
    _isBuyLabel.font = [UIFont systemFontOfSize:13];
    _isBuyLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:_isBuyLabel];
    
    
    _promiseLabel = [UILabel new];
    _promiseLabel.font = [UIFont systemFontOfSize:12];
    _promiseLabel.textColor = [UIColor gt_colorWithHexString:@"#cc3399"];
    _promiseLabel.textAlignment = NSTextAlignmentCenter;
    _promiseLabel.text = @"承诺上映";
    
    [self addSubview:_promiseLabel];
    
    _protectLabel = [UILabel new];
    _protectLabel.text = @"完片担保";
    _protectLabel.font = [UIFont systemFontOfSize:12];
    _protectLabel.textColor = [UIColor gt_colorWithHexString:@"#cc3399"];
    _protectLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_protectLabel];
    
    _statusLabel = [UILabel new];
    _statusLabel.font = [UIFont systemFontOfSize:12];
    _statusLabel.textAlignment = NSTextAlignmentCenter;
    _statusLabel.textColor = [UIColor blackColor];
    [self addSubview:_statusLabel];
    
    
    _progressView = [[UIProgressView alloc] init];
    //设置进度条颜色
    _progressView.trackTintColor=[UIColor gt_colorWithHexString:@"#eaeaea"];
    //设置进度条上进度的颜色
    _progressView.progressTintColor=[UIColor gt_colorWithHexString:@"#cc3399"];
    
    [self addSubview:_progressView];
    
}

#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    __weak __typeof(self) weakSelf = self;
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(self).offset(10);
        make.width.mas_equalTo(120);
    }];
    
    [_itemNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.imageView.mas_right).offset(10);
        make.top.mas_equalTo(weakSelf.imageView).offset(10);
    }];
    
    [_itemTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.itemNameLabel);
        make.top.mas_equalTo(weakSelf.itemNameLabel.mas_bottom).offset(10);
    }];
    
    [_predictCostLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.itemTypeLabel);
        make.top.mas_equalTo(weakSelf.itemTypeLabel.mas_bottom).offset(10);
    }];
    
    [_openPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.predictCostLabel);
        make.top.mas_equalTo(weakSelf.predictCostLabel.mas_bottom).offset(10);
    }];
    
    [_isBuyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.openPriceLabel);
        make.left.mas_equalTo(weakSelf.openPriceLabel.mas_right).offset(10);
    }];
    
    [_promiseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.openPriceLabel);
        make.top.mas_equalTo(weakSelf.openPriceLabel.mas_bottom).offset(10);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(20);
    }];
    
    [_protectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.promiseLabel);
        make.left.mas_equalTo(weakSelf.promiseLabel.mas_right).offset(10);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(20);
    }];
    
    [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.itemNameLabel);
        make.right.mas_equalTo(weakSelf).offset(-10);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(20);
    }];
    
    [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.imageView).offset(-10);
        make.left.mas_equalTo(weakSelf.promiseLabel);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-10);
        make.height.mas_equalTo(6);
    }];
//    _testProgressView.backgroundColor = [UIColor brownColor];
//    [_testProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.bottom.mas_equalTo(weakSelf.imageView).offset(-10);
//                make.left.mas_equalTo(weakSelf.promiseLabel);
//                make.right.mas_equalTo(weakSelf.mas_right).offset(-10);
//                make.height.mas_equalTo(10);
//    }];
    
    
    _promiseLabel.layer.masksToBounds = YES;
    _promiseLabel.layer.cornerRadius = 4;
    _promiseLabel.layer.borderWidth = 1;
    _promiseLabel.layer.borderColor = [UIColor gt_colorWithHexString:@"#cc3399"].CGColor;
    
    _protectLabel.layer.masksToBounds = YES;
    _protectLabel.layer.cornerRadius = 4;
    _protectLabel.layer.borderWidth = 1;
    _protectLabel.layer.borderColor = [UIColor gt_colorWithHexString:@"#cc3399"].CGColor;
    
    _statusLabel.layer.masksToBounds = YES;
    _statusLabel.layer.cornerRadius = 4;
    _statusLabel.layer.borderWidth = 1;
    _statusLabel.layer.borderColor = [UIColor blackColor].CGColor;
    
    _progressView.layer.masksToBounds = YES;
    _progressView.layer.cornerRadius = 3;
}


- (void)setMovieDevoteItem:(HomeMovieDevoteItem *)movieDevoteItem{
    _movieDevoteItem = movieDevoteItem;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:movieDevoteItem.imageUrl]];
    _itemNameLabel.text = movieDevoteItem.movieTitle;
    _itemTypeLabel.text = [NSString stringWithFormat:@"类型:%@",movieDevoteItem.movieType];
    _predictCostLabel.text = [NSString stringWithFormat:@"总预算%@",movieDevoteItem.predictCost];
    _openPriceLabel.text = [NSString stringWithFormat:@"开放额度%@",movieDevoteItem.openPrice];
    if (movieDevoteItem.isBuy) {
        _isBuyLabel.text = @"已认购";
    }else{
        _isBuyLabel.text = @"未认购";
    }
    
    _statusLabel.text = movieDevoteItem.status;
    
    _progressView.progress = [movieDevoteItem.process floatValue] / 100.0;
}



@end
