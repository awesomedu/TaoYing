//
//  UIScrollView+GTScrollView.h
//  PodRepo
//
//  Created by mac on 2018/12/11.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (GTScrollView)
- (void)gt_scrollToTop;


- (void)gt_scrollToBottom;


- (void)gt_scrollToLeft;


- (void)gt_scrollToRight;


- (void)gt_scrollToTopAnimated:(BOOL)animated;


- (void)gt_scrollToBottomAnimated:(BOOL)animated;


- (void)gt_scrollToLeftAnimated:(BOOL)animated;


- (void)gt_scrollToRightAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
