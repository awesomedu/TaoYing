//
//  MoviePublishCommentCell.m
//  TaoYing
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "MoviePublishCommentCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "MovieIntroduceCommentItem.h"
#import <GTCommonKit.h>

@interface MoviePublishCommentCell()
@property (nonatomic, strong) UIImageView *userIamgeView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *commentContentLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *praiseButton;
@property (nonatomic, strong) UIButton *commentsButton;
@property (nonatomic, strong) UIView *seperatorLineView;




@end

@implementation MoviePublishCommentCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    _userIamgeView = [[UIImageView alloc] init];
    [self addSubview:_userIamgeView];
    
    _userNameLabel = [[UILabel alloc] init];
    _userNameLabel.font = [UIFont systemFontOfSize:14];
    _userNameLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:_userNameLabel];
    
    _commentContentLabel = [[UILabel alloc] init];
    _commentContentLabel.numberOfLines = 0;
    _commentContentLabel.font = [UIFont systemFontOfSize:14];
    _commentContentLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:_commentContentLabel];
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = [UIFont systemFontOfSize:14];
    _timeLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:_timeLabel];
    
    _praiseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _praiseButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_praiseButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self addSubview:_praiseButton];
    
    _commentsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _commentsButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_commentsButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self addSubview:_commentsButton];
    
    _seperatorLineView = [[UIView alloc] init];
    _seperatorLineView.backgroundColor = [UIColor gt_colorWithHexString:@"#e1e1e1"];
    [self addSubview:_seperatorLineView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_userIamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(18);
        make.top.mas_equalTo(self).offset(13);
        make.width.height.mas_equalTo(50);
    }];
    
    _userIamgeView.layer.masksToBounds = YES;
    _userIamgeView.layer.cornerRadius = _userIamgeView.frame.size.height / 2;
    
    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.userIamgeView.mas_right).offset(10);
        make.centerY.mas_equalTo(self.userIamgeView);
    }];
    
    [_commentContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userIamgeView.mas_bottom).offset(12);
        make.left.mas_equalTo(self.userNameLabel);
        make.right.mas_equalTo(self).offset(-15);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.commentContentLabel);
        make.top.mas_equalTo(self.commentContentLabel.mas_bottom).offset(12);
    }];
    
    [_commentsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-20);
        make.width.mas_equalTo(60);
        make.centerY.mas_equalTo(self.timeLabel);
    }];
    _commentsButton.layer.masksToBounds = YES;
    _commentsButton.layer.cornerRadius = _commentsButton.frame.size.height / 2;
    _commentsButton.layer.borderWidth = 0.8;
    _commentsButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    [_praiseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.commentsButton.mas_left).offset(-15);
        make.centerY.mas_equalTo(self.commentsButton);
        make.width.mas_equalTo(60);
    }];
    _praiseButton.layer.masksToBounds = YES;
    _praiseButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _praiseButton.layer.borderWidth = 0.8;
    _praiseButton.layer.cornerRadius = _commentsButton.frame.size.height / 2;

    [_seperatorLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10);
        make.right.mas_equalTo(self).offset(-10);
        make.bottom.mas_equalTo(self);
        make.height.mas_equalTo(0.6);
    }];
}

- (void)setCommentItem:(MovieIntroduceCommentItem *)commentItem{
    _commentItem = commentItem;
    [_userIamgeView sd_setImageWithURL:[NSURL URLWithString:commentItem.itemImageUrl]];
    _userNameLabel.text = commentItem.itemName;
    _commentContentLabel.text = commentItem.itemComments;
    _timeLabel.text = commentItem.itemTime;
    [_praiseButton setTitle:commentItem.itemPraiseCount forState:UIControlStateNormal];
    [_commentsButton setTitle:commentItem.itemCommentsCount forState:UIControlStateNormal];
}




@end
