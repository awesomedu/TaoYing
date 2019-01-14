//
//  GTProgressHud.m
//  gtkit
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "GTProgressHud.h"
#import <MBProgressHUD.h>

@implementation GTProgressHud

+ (MBProgressHUD*)createMBProgressHUDviewWithMessage:(NSString*)message isWindiw:(BOOL)isWindow
{
    UIView  *view = isWindow? (UIView*)[UIApplication sharedApplication].delegate.window:[self getCurrentUIVC].view;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText=message?message:@"加载中.....";
    hud.labelFont=[UIFont systemFontOfSize:15];
    hud.removeFromSuperViewOnHide = YES;
    hud.dimBackground = NO;
    return hud;
}

#pragma mark-------------------- show Tip----------------------------

+ (void)gt_showTipMessageInWindow:(NSString*)message
{
    [self gt_showTipMessage:message isWindow:true timer:2];
}
+ (void)gt_showTipMessageInView:(NSString*)message
{
    [self gt_showTipMessage:message isWindow:false timer:2];
}
+ (void)gt_showTipMessageInWindow:(NSString*)message timer:(int)aTimer
{
    [self gt_showTipMessage:message isWindow:true timer:aTimer];
}
+ (void)gt_showTipMessageInView:(NSString*)message timer:(int)aTimer
{
    [self gt_showTipMessage:message isWindow:false timer:aTimer];
}
+ (void)gt_showTipMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(int)aTimer
{
    MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeText;
    [hud hide:YES afterDelay:aTimer];
}

#pragma mark-------------------- show Activity----------------------------

+ (void)gt_showActivityMessageInWindow:(NSString*)message
{
    [self gt_showActivityMessage:message isWindow:true timer:0];
}
+ (void)gt_showActivityMessageInView:(NSString*)message
{
    [self gt_showActivityMessage:message isWindow:false timer:0];
}
+ (void)gt_showActivityMessageInWindow:(NSString*)message timer:(int)aTimer
{
    [self gt_showActivityMessage:message isWindow:true timer:aTimer];
}
+ (void)gt_showActivityMessageInView:(NSString*)message timer:(int)aTimer
{
    [self gt_showActivityMessage:message isWindow:false timer:aTimer];
}
+ (void)gt_showActivityMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(int)aTimer
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeIndeterminate;
    if (aTimer>0) {
        [hud hide:YES afterDelay:aTimer];
    }
}

#pragma mark-------------------- show Image----------------------------

+ (void)gt_showSuccessMessage:(NSString *)Message
{
    NSString *name =@"MBProgressHUD+JDragon.bundle/MBProgressHUD/MBHUD_Success";
    [self gt_showCustomIconInWindow:name message:Message];
}
+ (void)gt_showErrorMessage:(NSString *)Message
{
    NSString *name =@"MBProgressHUD+JDragon.bundle/MBProgressHUD/MBHUD_Error";
    [self gt_showCustomIconInWindow:name message:Message];
}
+ (void)gt_showInfoMessage:(NSString *)Message
{
    NSString *name =@"MBProgressHUD+JDragon.bundle/MBProgressHUD/MBHUD_Info";
    [self gt_showCustomIconInWindow:name message:Message];
}
+ (void)gt_showWarnMessage:(NSString *)Message
{
    NSString *name =@"MBProgressHUD+JDragon.bundle/MBProgressHUD/MBHUD_Warn";
    [self gt_showCustomIconInWindow:name message:Message];
}
+ (void)gt_showCustomIconInWindow:(NSString *)iconName message:(NSString *)message
{
    [self gt_showCustomIcon:iconName message:message isWindow:true];
    
}
+ (void)gt_showCustomIconInView:(NSString *)iconName message:(NSString *)message
{
    [self gt_showCustomIcon:iconName message:message isWindow:false];
}
+ (void)gt_showCustomIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    hud.mode = MBProgressHUDModeCustomView;
    [hud hide:YES afterDelay:2];
    
}
+ (void)gt_hideHUD
{
    UIView  *winView =(UIView*)[UIApplication sharedApplication].delegate.window;
    [MBProgressHUD hideAllHUDsForView:winView animated:YES];
    [MBProgressHUD hideAllHUDsForView:[self getCurrentUIVC].view animated:YES];
}
#pragma mark --- 获取当前Window试图---------
//获取当前屏幕显示的viewcontroller
+(UIViewController*)getCurrentWindowVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到它
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    id nextResponder = nil;
    UIViewController *appRootVC = window.rootViewController;
    //1、通过present弹出VC，appRootVC.presentedViewController不为nil
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        //2、通过navigationcontroller弹出VC
        //        NSLog(@"subviews == %@",[window subviews]);
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    return nextResponder;
}

+(UINavigationController*)getCurrentNaVC
{
    
    UIViewController  *viewVC = (UIViewController*)[ self getCurrentWindowVC ];
    UINavigationController  *naVC;
    if ([viewVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController  *tabbar = (UITabBarController*)viewVC;
        naVC = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        if (naVC.presentedViewController) {
            while (naVC.presentedViewController) {
                naVC = (UINavigationController*)naVC.presentedViewController;
            }
        }
    }else
        if ([viewVC isKindOfClass:[UINavigationController class]]) {
            
            naVC  = (UINavigationController*)viewVC;
            if (naVC.presentedViewController) {
                while (naVC.presentedViewController) {
                    naVC = (UINavigationController*)naVC.presentedViewController;
                }
            }
        }else
            if ([viewVC isKindOfClass:[UIViewController class]])
            {
                if (viewVC.navigationController) {
                    return viewVC.navigationController;
                }
                return  (UINavigationController*)viewVC;
            }
    return naVC;
}

+(UIViewController*)getCurrentUIVC
{
    UIViewController   *cc;
    UINavigationController  *na = (UINavigationController*)[[self class] getCurrentNaVC];
    if ([na isKindOfClass:[UINavigationController class]]) {
        cc =  na.viewControllers.lastObject;
        
        if (cc.childViewControllers.count>0) {
            
            cc = [[self class] getSubUIVCWithVC:cc];
        }
    }else
    {
        cc = (UIViewController*)na;
    }
    return cc;
}
+(UIViewController *)getSubUIVCWithVC:(UIViewController*)vc
{
    UIViewController   *cc;
    cc =  vc.childViewControllers.lastObject;
    if (cc.childViewControllers>0) {
        
        [[self class] getSubUIVCWithVC:cc];
    }else
    {
        return cc;
    }
    return cc;
}


@end
