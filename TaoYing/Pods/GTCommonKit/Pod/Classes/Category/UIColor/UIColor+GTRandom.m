//
//  UIColor+GTRandom.m
//  pods
//
//  Created by mac on 2018/12/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UIColor+GTRandom.h"

@implementation UIColor (GTRandom)
    
+ (UIColor *)gt_randomColor{
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    return randColor;
}

@end
