//
//  UIView+frame.m
//  gtkit
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "UIView+frame.h"

@implementation UIView (frame)

- (CGFloat)gt_x {
    return self.frame.origin.x;
}

- (void)gt_x:(CGFloat)gt_x {
    CGRect frame = self.frame;
    frame.origin.x = gt_x;
    self.frame = frame;
}

- (CGFloat)gt__y {
    return self.frame.origin.y;
}

- (void)gt_y:(CGFloat)gt_y {
    CGRect frame = self.frame;
    frame.origin.y = gt_y;
    self.frame = frame;
}

- (CGFloat)gt_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setGt_right:(CGFloat)gt_right{
    CGRect frame = self.frame;
    frame.origin.x = gt_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)gt_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setGt_bottom:(CGFloat)gt_bottom {
    
    CGRect frame = self.frame;
    
    frame.origin.y = gt_bottom - frame.size.height;
    
    self.frame = frame;
}

- (CGFloat)gt_width {
    return self.frame.size.width;
}

- (void)setLGt_width:(CGFloat)gt_width {
    CGRect frame = self.frame;
    frame.size.width = gt_width;
    self.frame = frame;
}

- (CGFloat)gt_height {
    return self.frame.size.height;
}

- (void)setLmj_height:(CGFloat)gt_height {
    CGRect frame = self.frame;
    frame.size.height = gt_height;
    self.frame = frame;
}

- (CGFloat)gt_centerX {
    return self.center.x;
}

- (void)setGt_centerX:(CGFloat)gt_centerX {
    self.center = CGPointMake(gt_centerX, self.center.y);
}

- (CGFloat)gt_centerY {
    return self.center.y;
}

- (void)setGt_centerY:(CGFloat)gt_centerY {
    self.center = CGPointMake(self.center.x, gt_centerY);
}

- (CGPoint)gt_origin {
    return self.frame.origin;
}

- (void)setGt_origin:(CGPoint)gt_origin {
    CGRect frame = self.frame;
    frame.origin = gt_origin;
    self.frame = frame;
}

- (CGSize)gt_size {
    return self.frame.size;
}

- (void)setLmj_size:(CGSize)gt_size {
    CGRect frame = self.frame;
    frame.size = gt_size;
    self.frame = frame;
}

@end
