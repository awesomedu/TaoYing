//
//  GTProgressHud.h
//  gtkit
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTProgressHud : NSObject

+ (void)gt_showTipMessageInWindow:(NSString*)message;
+ (void)gt_showTipMessageInView:(NSString*)message;
+ (void)gt_showTipMessageInWindow:(NSString*)message timer:(int)aTimer;
+ (void)gt_showTipMessageInView:(NSString*)message timer:(int)aTimer;


+ (void)gt_showActivityMessageInWindow:(NSString*)message;
+ (void)gt_showActivityMessageInView:(NSString*)message;
+ (void)gt_showActivityMessageInWindow:(NSString*)message timer:(int)aTimer;
+ (void)gt_showActivityMessageInView:(NSString*)message timer:(int)aTimer;


+ (void)gt_showSuccessMessage:(NSString *)Message;
+ (void)gt_showErrorMessage:(NSString *)Message;
+ (void)gt_showInfoMessage:(NSString *)Message;
+ (void)gt_showWarnMessage:(NSString *)Message;


+ (void)gt_showCustomIconInWindow:(NSString *)iconName message:(NSString *)message;
+ (void)gt_showCustomIconInView:(NSString *)iconName message:(NSString *)message;


+ (void)gt_hideHUD;

@end

NS_ASSUME_NONNULL_END
