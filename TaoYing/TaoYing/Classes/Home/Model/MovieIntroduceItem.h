//
//  MovieIntroduceItem.h
//  TaoYing
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 mac. All rights reserved.
//  影视宣发 电影介绍

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieIntroduceItem : NSObject

@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *itemTitle;
@property (nonatomic, copy) NSString *itemType;
@property (nonatomic, copy) NSString *itemDetail;
@property (nonatomic, copy) NSString *itemTime;
@property (nonatomic, copy) NSString *itemPrefer;
@property (nonatomic, copy) NSString *introduce;

- (float)headerViewHeight;

@end

NS_ASSUME_NONNULL_END
