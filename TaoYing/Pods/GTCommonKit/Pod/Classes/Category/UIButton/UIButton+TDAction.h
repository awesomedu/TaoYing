//
//  UIButton+TDAction.h
//  YLB_Pro
//
//  Created by 唐都 on 2017/10/25.
//  Copyright © 2017年 com.tangdu.@R. All rights reserved.
// 1. 点击事件采用Block 回调
// 2. 按钮倒计时处理


#import <UIKit/UIKit.h>




@interface UIButton (TDAction)

/// 点击事件
- (void)gt_setEventTouchUpInsideHandel:(void(^)(UIButton *btn))handel;

/// 倒计时处理
- (void)gt_countTimeTask;

@end
