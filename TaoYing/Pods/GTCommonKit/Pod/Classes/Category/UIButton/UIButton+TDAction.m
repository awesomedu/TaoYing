//
//  UIButton+TDAction.m
//  YLB_Pro
//
//  Created by 唐都 on 2017/10/25.
//  Copyright © 2017年 com.tangdu.@R. All rights reserved.
//

#import "UIButton+TDAction.h"
#import <objc/runtime.h>
#import "UIColor+GTHex.h"


/// 倒计时时间
static const NSInteger COUNT_TIME = 59;
/// 按钮颜色
#define CountButtonColor [UIColor gt_colorWithHexString:@"#DADADA"]
#define CountOverButtonColor [UIColor gt_colorWithHexString:@"#DA4B96"]



@interface UIButton (_TDAction)
@property (copy, nonatomic) void(^gt_eventTouchUpInsideHandelBlock)(UIButton *btn);

@end



@implementation UIButton (TDAction)


#pragma mark - Public
- (void)gt_setEventTouchUpInsideHandel:(void (^)(UIButton *))handel {
    self.gt_eventTouchUpInsideHandelBlock = handel;
    [self addTarget:self action:@selector(gt_eventTouchUpInsideHandel) forControlEvents:UIControlEventTouchUpInside];
}

- (void)gt_countTimeTask{
    self.layer.borderWidth = 0;
    __block NSInteger time = COUNT_TIME; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(time <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
//                self.layer.borderWidth = 1;
                //设置按钮的样式
                [self setTitle:@"重新发送" forState:UIControlStateNormal];
                [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [self setBackgroundColor:CountOverButtonColor];
                self.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮显示读秒效果
                [self setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                [self setBackgroundColor:CountButtonColor];
                [self  setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}


#pragma mark - Private
- (void)gt_eventTouchUpInsideHandel
{
    if (self.gt_eventTouchUpInsideHandelBlock) {
        self.gt_eventTouchUpInsideHandelBlock(self);
    }
}

#pragma mark - Getter & Setter
- (void (^)(UIButton *))gt_eventTouchUpInsideHandelBlock
{
    NSLog(@"111");
    return objc_getAssociatedObject(self, @selector(gt_eventTouchUpInsideHandelBlock));
}

- (void)setGt_eventTouchUpInsideHandelBlock:(void (^)(UIButton *))gt_eventTouchUpInsideHandelBlock
{
    NSLog(@"2222");
    objc_setAssociatedObject(self, @selector(gt_eventTouchUpInsideHandelBlock), gt_eventTouchUpInsideHandelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}



@end
