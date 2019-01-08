//
//  HomeBannerView.m
//  TaoYing
//
//  Created by mac on 2019/1/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "HomeBannerView.h"
#import <SDCycleScrollView.h>
#import <GTCommonKit.h>

@interface HomeBannerView ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@end

@implementation HomeBannerView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    self.backgroundColor = [UIColor cyanColor];
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kWidth, self.frame.size.height) delegate:self placeholderImage:nil];
    _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    _cycleScrollView.autoScrollTimeInterval = 3.0;
    [self addSubview:_cycleScrollView];
}

- (void)setImageArr:(NSArray *)imageArr{
    _imageArr = imageArr;
    _cycleScrollView.placeholderImage = [UIImage imageNamed:@"img"];
    if (imageArr.count == 0) {
        return;
    }
    _cycleScrollView.imageURLStringsGroup = _imageArr;
}

#pragma -mark 轮播点击事件
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"click %zd banner",index);
}

@end
