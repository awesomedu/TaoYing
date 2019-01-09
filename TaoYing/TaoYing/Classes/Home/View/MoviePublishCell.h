//
//  MoviePublishCell.h
//  TaoYing
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MoviePublishCellDelegate<NSObject>
- (void)foldClick:(UIButton *)foldBtn;

@end

@class MovieIntroduceItem;

NS_ASSUME_NONNULL_BEGIN

@interface MoviePublishCell : UICollectionViewCell
@property (nonatomic, strong) MovieIntroduceItem *item;
@property (nonatomic, assign) id<MoviePublishCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
