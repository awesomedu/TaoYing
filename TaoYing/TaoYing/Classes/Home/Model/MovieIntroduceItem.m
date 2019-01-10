//
//  MovieIntroduceItem.m
//  TaoYing
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "MovieIntroduceItem.h"
#import <GTCommonKit.h>

@implementation MovieIntroduceItem

- (float)headerViewHeight{
    CGSize maxSize = CGSizeMake(kWidth - 20, MAXFLOAT);
    CGFloat textH = [self.introduce boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]} context:nil].size.height + 5;
    // 减去单行高度
//    NSString *content = @"单行数据";
//    CGSize size =[content sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
//    textH = textH - size.height;
    return textH;
}

@end
