//
//  HomeRecommendItem.h
//  TaoYing
//
//  Created by mac on 2019/1/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeRecommendItem : NSObject
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *itemTitle;
@property (nonatomic, copy) NSString *itemType;
@property (nonatomic, copy) NSString *itemCost;
@property (nonatomic, copy) NSString *itemSaleCount;
@property (nonatomic, copy) NSString *rewardRate;
@property (nonatomic, assign) BOOL dividend;


@end

NS_ASSUME_NONNULL_END
