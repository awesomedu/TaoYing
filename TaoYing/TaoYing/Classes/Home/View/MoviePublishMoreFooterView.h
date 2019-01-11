//
//  MoviePublishMoreFooterView.h
//  TaoYing
//
//  Created by 唐都 on 2019/1/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LookMoreFooterViewDelegate <NSObject>

- (void)showMoreData;

@end

NS_ASSUME_NONNULL_BEGIN

@interface MoviePublishMoreFooterView : UICollectionReusableView
@property (nonatomic, assign) NSInteger commentsCount;
@property (nonatomic, assign) id<LookMoreFooterViewDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
