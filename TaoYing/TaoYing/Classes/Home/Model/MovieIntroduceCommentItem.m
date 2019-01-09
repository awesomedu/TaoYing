//
//  MovieIntroduceCommentItem.m
//  TaoYing
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "MovieIntroduceCommentItem.h"
#import <GTCommonKit.h>

@implementation MovieIntroduceCommentItem

- (float)cellHeight{
    CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 93, MAXFLOAT);
    CGFloat textH = [self.itemComments boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
    // 减去单行高度
//    NSString *content = @"单行数据";
//    CGSize size =[content sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
//    textH = textH - size.height;
    return textH;
}

@end
