//
//  UIScrollView+GTScrollView.m
//  PodRepo
//
//  Created by mac on 2018/12/11.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UIScrollView+GTScrollView.h"

@implementation UIScrollView (GTScrollView)


- (void)gt_scrollToTop {
    [self gt_scrollToTopAnimated:YES];
}

- (void)scrollToBottom {
    [self gt_scrollToBottomAnimated:YES];
}

- (void)gt_scrollToLeft {
    [self gt_scrollToLeftAnimated:YES];
}

- (void)gt_scrollToRight {
    [self gt_scrollToRightAnimated:YES];
}

- (void)gt_scrollToTopAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = 0 - self.contentInset.top;
    [self setContentOffset:off animated:animated];
}

- (void)gt_scrollToBottomAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
    [self setContentOffset:off animated:animated];
}

- (void)gt_scrollToLeftAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = 0 - self.contentInset.left;
    [self setContentOffset:off animated:animated];
}

- (void)gt_scrollToRightAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    [self setContentOffset:off animated:animated];
}


@end
