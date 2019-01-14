//
//  UIView+frame.h
//  gtkit
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (frame)
@property (nonatomic) CGFloat gt_x;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat gt_y;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat gt_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat gt_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat gt_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat gt_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat gt_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat gt_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint gt_origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  gt_size;



@end

NS_ASSUME_NONNULL_END
