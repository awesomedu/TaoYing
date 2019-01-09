//
//  MoviePhotoInnerCell.m
//  TaoYing
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "MoviePhotoInnerCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "MovieintroduceVideoPhotoItem.h"

@interface MoviePhotoInnerCell()
@property (nonatomic, strong) UIImageView *videoImageView;

@end

@implementation MoviePhotoInnerCell


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    _videoImageView = [[UIImageView alloc] init];
    _videoImageView.contentMode = UIViewContentModeScaleAspectFill;
    _videoImageView.clipsToBounds = YES;
    _videoImageView.layer.cornerRadius = 8;
    [self addSubview:_videoImageView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_videoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(self).offset(10);
        make.right.mas_equalTo(self).offset(-10);
        make.bottom.mas_equalTo(self).offset(-10);
    }];
}

- (void)setMoviePhotoItem:(MovieintroduceVideoPhotoItem *)moviePhotoItem{
    _moviePhotoItem = moviePhotoItem;
    [_videoImageView sd_setImageWithURL:[NSURL URLWithString:moviePhotoItem.photoImageUrl]];
}


@end
