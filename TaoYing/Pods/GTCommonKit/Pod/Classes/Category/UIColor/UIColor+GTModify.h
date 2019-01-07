//
//  UIColor+GTModify.h
//  pods
//
//  Created by mac on 2018/12/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (GTModify)
    
- (UIColor *)gt_invertedColor;
- (UIColor *)gt_colorForTranslucency;
- (UIColor *)gt_lightenColor:(CGFloat)lighten;
- (UIColor *)gt_darkenColor:(CGFloat)darken;

@end

NS_ASSUME_NONNULL_END
