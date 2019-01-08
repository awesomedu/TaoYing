//
//  HomeMovieDevoteItem.h
//  TaoYing
//
//  Created by 唐都 on 2019/1/8.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeMovieDevoteItem : NSObject
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *movieTitle;
@property (nonatomic, copy) NSString *movieType;
@property (nonatomic, copy) NSString *predictCost;
@property (nonatomic, copy) NSString *openPrice;
@property (nonatomic, assign) BOOL isBuy;
@property (nonatomic, assign) BOOL isPlay;
@property (nonatomic, strong) NSNumber *process;
@property (nonatomic, copy) NSString *status;


@end

NS_ASSUME_NONNULL_END
