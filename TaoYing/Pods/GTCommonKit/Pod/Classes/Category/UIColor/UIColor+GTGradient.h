//
//  UIColor+GTGradient.h
//  pods
//
//  Created by mac on 2018/12/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (GTGradient)

/**
 渐变颜色

 @param c1 开始颜色
 @param c2 结束颜色
 @param height 渐变高度
 @return 渐变颜色
 */
+ (UIColor*)gt_gradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(int)height;

@end

NS_ASSUME_NONNULL_END
