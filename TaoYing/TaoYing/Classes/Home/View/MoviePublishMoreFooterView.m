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
//@property (nonatomic, strong) UILabel *commentsCountLabel;
@property (nonatomic, strong) UIButton *commentMoreBtn;

@end

@implementation MoviePublishMoreFooterView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor gt_colorWithHexString:@"#c3349a"] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn addTarget:self action:@selector(moreClick) forControlEvents:UIControlEventTouchUpInside];
    self.commentMoreBtn = btn;
    [self addSubview:self.commentMoreBtn];
}

- (void)moreClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(showMoreData)]) {
        [self.delegate showMoreData];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_commentMoreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];
}

- (void)setCommentsCount:(NSInteger)commentsCount{
    _commentsCount = commentsCount;
    [_commentMoreBtn setTitle:[NSString stringWithFormat:@"查看全部%ld评论",_commentsCount] forState:UIControlStateNormal];
}



@end
