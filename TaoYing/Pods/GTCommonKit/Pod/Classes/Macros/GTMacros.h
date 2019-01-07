//
//  GTMacros.h
//  Pods
//
//  Created by mac on 2018/12/12.
//

#ifndef GTMacros_h
#define GTMacros_h


#define BASH @"http://218.87.176.156:80"
#define HOST [BASH stringByAppendingString:@"/platform/services/XzsposServices"]
#define kWidth         [UIScreen mainScreen].bounds.size.width   // 当前屏幕宽
#define kHeight        [UIScreen mainScreen].bounds.size.height  // 当前屏幕高   480 568
#define kAppDelegate        (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define kBundleLoadNibName(name) [[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] lastObject]
#define is_IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)


/*屏幕高度*/
#define iPhone6 ([UIScreen mainScreen].bounds.size.height == 667)
#define iPhone6P ([UIScreen mainScreen].bounds.size.height == 736)
#define iPhone5 ([UIScreen mainScreen].bounds.size.height == 568)
#define iPhone4 ([UIScreen mainScreen].bounds.size.height == 480)
//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
/// 常用宏定义

#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define kApplication        [UIApplication sharedApplication]
#define kAppDelegate        (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define kFileManager        [NSFileManager defaultManager]
#define kBundle             [NSBundle mainBundle]
#define kDevice             [UIDevice currentDevice]
#define kWindow             [[UIApplication sharedApplication] keyWindow]
#define kBundleVersion      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define kDocumentPath       [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kBundleLoadNibName(name) [[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] lastObject]

/// 颜色
#define kBlackColor     [UIColor blackColor]      // 0.0 white
#define kDarkGrayColor  [UIColor darkGrayColor]   // 0.333 white
#define kLightGrayColor [UIColor lightGrayColor]  // 0.667 white
#define kWhiteColor     [UIColor whiteColor]      // 1.0 white
#define kGrayColor      [UIColor grayColor]       // 0.5 white
#define kRedColor       [UIColor redColor]        // 1.0, 0.0, 0.0 RGB
#define kGreenColor     [UIColor greenColor]      // 0.0, 1.0, 0.0 RGB
#define kBlueColor      [UIColor blueColor]       // 0.0, 0.0, 1.0 RGB
#define hCyanColor      [UIColor cyanColor]       // 0.0, 1.0, 1.0 RGB
#define hYellowColor    [UIColor yellowColor]     // 1.0, 1.0, 0.0 RGB
#define hMagentaColor   [UIColor magentaColor]    // 1.0, 0.0, 1.0 RGB
#define kOrangeColor    [UIColor orangeColor]     // 1.0, 0.5, 0.0 RGB
#define kPurpleColor    [UIColor purpleColor]     // 0.5, 0.0, 0.5 RGB
#define hBrownColor     [UIColor brownColor]      // 0.6, 0.4, 0.2 RGB
#define kClearColor     [UIColor clearColor]      // 0.0 white, 0.0 alpha
#define RGBColor0(_f)   [UIColor colorWithRed:((float)((_f & 0xFF0000) >> 16))/255.0 green:((float)((_f & 0xFF00)>> 8))/255.0 blue:((float) (_f & 0xFF))/255.0 alpha:1.0f]
#define RGBColor1(_r, _g, _b)     [UIColor colorWithRed:(_r)/255.0 green:(_g)/255.0 blue:(_b)/255.0 alpha:1.0f]
#define RGBColor2(_r, _g, _b, _a) [UIColor colorWithRed:(_r)/255.0 green:(_g)/255.0 blue:(_b)/255.0 alpha:_a]
#define RGBA(_r, _g, _b, _a) [UIColor colorWithRed:(_r)/255.0 green:(_g)/255.0 blue:(_b)/255.0 alpha:_a]
#define APP_SUBJECT_COLOR RGBA(17.0, 163.0, 250.0,1.0) //app主题色
#define APP_VIEW_BACK_COLOR [UIColor groupTableViewBackgroundColor]
#define MAIN_TITLE_COLOR RGBA(14, 14, 14, 1) //黑色title
#define DETAIL_TITLE_COLOR RGBA(153, 153, 153, 1) //灰色title
#define GRAY_BOARD_COLOR RGBA(241, 240, 240, 1)//边框颜色
#define CellLineColor RGBColor0(0xaaaaaa)

/// 常用
#define ImageNamed(_name)     [UIImage imageNamed:_name]
#define URLWithString(str)    [NSURL URLWithString:str]
#define FontSize(_size)       [UIFont systemFontOfSize:_size]
#define HeiTiFont(_size)      [UIFont fontWithName:@"HelveticaNeue" size:_size]

#define StringWithInt(num)             [NSString stringWithFormat:@"%d", (num)]
#define NumberWithInt(num)             [NSNumber numberWithInt: (num)]

#define AlignmentLeft   NSTextAlignmentLeft
#define AlignmentCenter NSTextAlignmentCenter
#define AlignmentRight  NSTextAlignmentRight

//提示
#define showAlert(title,mesg)  [[[UIAlertView alloc]initWithTitle:title message:mesg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil]show]
/**
 返回宽适配倍率
 
 @param 375.f 屏幕宽度为375.f （UI图给的宽度是多少，这里就应该是多少）
 */
#define multipe  0.5 * (kWidth / 375.f)
/**
 返回高适配倍率
 
 @param 667.f 屏幕宽度为667.f（UI图给的高度是多少，这里就应该是多少）
 */
#define multipeH 0.5 * (kHeight / 667.f)

#define common_margin 24.0 * multipe

#ifndef UIDispatch_main_async_safe
#define UIDispatch_main_async_safe(block)\
if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue())) == 0) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}
#endif

#define WEAKSELF(ws) __weak typeof(self) ws = self;
#define NAV_HEIGHT ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 88.0 : 64.0)



#endif /* GTMacros_h */
