//
//  MoviePublishMoreFooterView.m
//  TaoYing
//
//  Created by 唐都 on 2019/1/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import "MoviePublishMoreFooterView.h"
#import <GTCommonKit.h>
#import <Masonry.h>

@interface MoviePublishMoreFooterView()
@property (nonatomic, strong) UILabel *commentsCountLabel;

@end

@implementation MoviePublishMoreFooterView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor gt_colorWithHexString:@"#cd349a"];
    label.font = [UIFont systemFontOfSize:13];
    self.commentsCountLabel = label;
    [self addSubview:self.commentsCountLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_commentsCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];
}

- (void)setCommentsCount:(NSInteger)commentsCount{
    _commentsCount = commentsCount;
    _commentsCountLabel.text = [NSString stringWithFormat:@"查看全部%ld评论",_commentsCount];
}



@end
