//
//  RecommendInnerCell.m
//  TaoYing
//
//  Created by mac on 2019/1/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "RecommendInnerCell.h"
#import "HomeRecommendItem.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import <GTCommonKit.h>


@interface RecommendInnerCell()

/// 图片
@property (strong , nonatomic)UIImageView *goodsImageView;
/// 赚钱了
@property (strong , nonatomic)UIImageView *earnImageView;
/// 名称
@property (strong , nonatomic)UILabel *itemNameLabel;
/// 类型
@property (strong , nonatomic)UILabel *itemStyleLabel;
/// 成本
@property (strong , nonatomic)UILabel *itemCostLabel;
/// 票房
@property (strong , nonatomic)UILabel *itemEarnLabel;
/// 回报率
@property (strong , nonatomic)UILabel *itemPayBackRateLabel;
/// 分红
@property (strong , nonatomic)UILabel *dividenLabel;
/// 是否分红
@property (nonatomic, assign) BOOL dividend;
/// backView
@property (nonatomic, strong) UIView *backView;



@end

@implementation RecommendInnerCell

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor gt_colorWithHexString:@"#f8f8f8"];
        self.backgroundColor = [UIColor clearColor];
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    _backView = [UIView new];
    _backView.backgroundColor = [UIColor whiteColor];
    _backView.layer.shadowColor=[UIColor lightGrayColor].CGColor;
    _backView.layer.shadowOffset=CGSizeMake(10, 10);
    _backView.layer.shadowOpacity=0.5;
    _backView.layer.shadowRadius=5;

    [self addSubview:_backView];
//
    _goodsImageView = [[UIImageView alloc] init];
    _goodsImageView.contentMode = UIViewContentModeScaleAspectFill;
    _goodsImageView.clipsToBounds = YES;
    [_backView addSubview:_goodsImageView];

    _earnImageView = [[UIImageView alloc] init];
    _earnImageView.contentMode = UIViewContentModeScaleAspectFill;
    _earnImageView.clipsToBounds = YES;
    [_backView addSubview:_earnImageView];

    _itemNameLabel = [[UILabel alloc] init];
    _itemNameLabel.font = [UIFont systemFontOfSize:17];
    _itemNameLabel.textColor = [UIColor blackColor];
    [_backView addSubview:_itemNameLabel];

    _itemStyleLabel = [[UILabel alloc] init];
    _itemStyleLabel.font = [UIFont systemFontOfSize:14];
    _itemStyleLabel.textColor = [UIColor grayColor];
    [_backView addSubview:_itemStyleLabel];

    _itemCostLabel = [[UILabel alloc] init];
    _itemCostLabel.font = [UIFont systemFontOfSize:14];
    _itemCostLabel.textColor = [UIColor grayColor];
    [_backView addSubview:_itemCostLabel];

    _itemEarnLabel = [[UILabel alloc] init];
    _itemEarnLabel.font = [UIFont systemFontOfSize:14];
    _itemEarnLabel.textColor = [UIColor grayColor];
    [_backView addSubview:_itemEarnLabel];

    _itemPayBackRateLabel = [[UILabel alloc] init];
    _itemPayBackRateLabel.font = [UIFont systemFontOfSize:14];
    _itemPayBackRateLabel.textColor = [UIColor grayColor];
    [_backView addSubview:_itemPayBackRateLabel];

    _dividenLabel = [[UILabel alloc] init];
    _dividenLabel.font = [UIFont systemFontOfSize:14];
    _dividenLabel.textColor = [UIColor whiteColor];
    _dividenLabel.textAlignment = NSTextAlignmentCenter;
    _dividenLabel.backgroundColor = [UIColor gt_colorWithHexString:@"#cc3399"];
    [_backView addSubview:_dividenLabel];
    
    UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 300, 200)];//这里的大小将不影响fangkuanView1 的显示（即这里只起 设置frame.origin的作用）
    //阴影设置
    shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
    shadowView.layer.shadowOffset = CGSizeMake(4, 4);
    shadowView.layer.shadowOpacity = 0.5;
    shadowView.layer.shadowRadius = 4.0;
    shadowView.layer.cornerRadius = 10.0;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    __weak __typeof(self) weakSelf = self;

    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(5);
        make.bottom.mas_equalTo(self).offset(-10);
        make.left.mas_equalTo(self).offset(15);
        make.right.mas_equalTo(self).offset(0);
    }];
    
    [_earnImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(weakSelf.backView);
        make.bottom.mas_equalTo(weakSelf.backView);
        make.width.height.mas_equalTo(@60);
    }];

//    _goodsImageView.backgroundColor = [UIColor brownColor];
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.backView).offset(5);
        make.height.mas_equalTo(weakSelf.frame.size.height *0.85);
        make.width.mas_equalTo(weakSelf.frame.size.height *0.5);
        make.centerY.mas_equalTo(weakSelf.backView);
    }];

    [_itemNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.goodsImageView.mas_right).offset(10);
        make.top.mas_equalTo(weakSelf.goodsImageView).offset(10);
    }];

    [_itemStyleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.itemNameLabel);
        make.top.mas_equalTo(weakSelf.itemNameLabel.mas_bottom).offset(10);
    }];

    [_itemCostLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.itemStyleLabel);
        make.top.mas_equalTo(weakSelf.itemStyleLabel.mas_bottom).offset(10);
    }];

    [_itemPayBackRateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.itemCostLabel);
        make.bottom.mas_equalTo(weakSelf.goodsImageView).offset(-10);
    }];

    [_dividenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.itemNameLabel);
        make.right.mas_equalTo(weakSelf).offset(3);
        make.width.mas_equalTo(55);
        make.height.mas_equalTo(20);
    }];

    [self setPartRoundWithView:_earnImageView corners:UIRectCornerBottomRight cornerRadius:10];
    
    _dividenLabel.layer.masksToBounds = YES;
    _dividenLabel.layer.cornerRadius = 5;

    _backView.layer.cornerRadius = 10;
}

- (void)setPartRoundWithView:(UIView *)view corners:(UIRectCorner)corners cornerRadius:(float)cornerRadius {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)].CGPath;
    view.layer.mask = shapeLayer;
}

#pragma mark - Setter Getter Methods
- (void)setRecomendItem:(HomeRecommendItem *)recomendItem{
    NSLog(@"recs = %@",recomendItem.imageUrl);
    _recomendItem = recomendItem;
    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:recomendItem.imageUrl]];
    _itemNameLabel.text = recomendItem.itemTitle;
    _itemStyleLabel.text = [NSString stringWithFormat:@"类型:%@",recomendItem.itemType];
    _itemCostLabel.text = recomendItem.itemCost;
    _itemPayBackRateLabel.text = [NSString stringWithFormat:@"回报率:  %@%%",recomendItem.rewardRate];
    [_earnImageView sd_setImageWithURL:[NSURL URLWithString:recomendItem.imageUrl]];
    _dividenLabel.text = @"已分红";
}

@end
