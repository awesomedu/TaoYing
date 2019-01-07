//
//  UIColor+GTWebColor.h
//  pods
//
//  Created by mac on 2018/12/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (GTWebColor)
    
/**
 获取canvass用的颜色字符串

 @return canvas颜色
 */
- (NSString *)gt_canvasColorString;
    
/**
 获取网页颜色字串

 @return 网页颜色
 */
- (NSString *)gt_webColorString;

@end

NS_ASSUME_NONNULL_END
