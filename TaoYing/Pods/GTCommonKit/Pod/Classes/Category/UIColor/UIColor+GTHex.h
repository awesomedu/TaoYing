//
//  UIColor+GTHex.h
//  pods
//
//  Created by mac on 2018/12/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (GTHex)


+ (UIColor *)gt_colorWithHex:(UInt32)hex;
+ (UIColor *)gt_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)gt_colorWithHexString:(NSString *)hexString;
- (NSString *)gt_HEXString;
///值不需要除以255.0
+ (UIColor *)gt_colorWithWholeRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue
                            alpha:(CGFloat)alpha;
///值不需要除以255.0
+ (UIColor *)gt_colorWithWholeRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue;
@end

NS_ASSUME_NONNULL_END
