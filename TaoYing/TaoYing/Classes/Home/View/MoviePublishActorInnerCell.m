//
//  MoviePublishActorInnerCell.m
//  TaoYing
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 mac. All rights reserved.
//

//
//  MoviePublishActorCell.m
//  TaoYing
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "MoviePublishActorInnerCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "MovieIntroduceActorItem.h"

@interface MoviePublishActorInnerCell()
@property (strong , nonatomic)UIImageView *actorImageView;
@property (strong , nonatomic)UILabel *actorNameLabel;
@property (strong , nonatomic)UILabel *actorRoleLabel;

@end

@implementation MoviePublishActorInnerCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    _actorImageView = [[UIImageView alloc] init];
    _actorImageView.contentMode = UIViewContentModeScaleAspectFill;
    _actorImageView.clipsToBounds = YES;
    _actorImageView.layer.cornerRadius = 8;
    [self addSubview:_actorImageView];
    
    _actorNameLabel = [[UILabel alloc] init];
    _actorNameLabel.font = [UIFont systemFontOfSize:15];
    _actorNameLabel.textColor = [UIColor blackColor];
    _actorNameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_actorNameLabel];
    
    _actorRoleLabel = [[UILabel alloc] init];
    _actorRoleLabel.font = [UIFont systemFontOfSize:13];
    _actorRoleLabel.textColor = [UIColor lightGrayColor];
    _actorRoleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_actorRoleLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_actorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10);
        make.top.mas_equalTo(self).offset(10);
        make.width.mas_equalTo(self.frame.size.width - 20);
        make.height.mas_equalTo(120);
    }];
    
    __weak __typeof(self) weakSelf = self;
    [_actorNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(weakSelf.actorImageView.mas_bottom)setOffset:5];
    }];
    
    [_actorRoleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(weakSelf.actorNameLabel.mas_bottom)setOffset:5];
    }];
}

- (void)setActorItem:(MovieIntroduceActorItem *)actorItem{
    _actorItem = actorItem;
    [_actorImageView sd_setImageWithURL:[NSURL URLWithString:actorItem.itemImageUrl]];
    _actorNameLabel.text = actorItem.itemName;
    _actorRoleLabel.text = actorItem.itemRole;
}




@end
