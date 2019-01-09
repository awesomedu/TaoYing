//
//  MovieIntroduceCommentItem.h
//  TaoYing
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieIntroduceCommentItem : NSObject
@property (nonatomic, copy) NSString *itemImageUrl;
@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *itemComments;
@property (nonatomic, copy) NSString *itemTime;
@property (nonatomic, copy) NSString *itemPraiseCount;
@property (nonatomic, copy) NSString *itemCommentsCount;

- (float)cellHeight;

@end

NS_ASSUME_NONNULL_END
