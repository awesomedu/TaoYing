//
//  UIAlertController+GTAlertControllerBlocks.h
//  AddPods
//
//  Created by mac on 2018/12/13.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^UIAlertControllerPopoverPresentationControllerBlock) (UIPopoverPresentationController * __nonnull popover);
typedef void (^UIAlertControllerCompletionBlock) (UIAlertController * __nonnull controller, UIAlertAction * __nonnull action, NSInteger buttonIndex);

@interface UIAlertController (GTAlertControllerBlocks)

/**
 创建UIAlertController 或 ActionSheet

 @param viewController controller
 @param title title
 @param message message
 @param preferredStyle alertcontroller类型
 @param cancelButtonTitle 取消
 @param destructiveButtonTitle destructivetitle
 @param otherButtonTitles otherTitles
 @param popoverPresentationControllerBlock popverBlock
 @param tapBlock tapBlock
 @return instancetype
 */
+ (instancetype)gt_showInViewController:(nonnull UIViewController *)viewController
                                      withTitle:(nullable NSString *)title
                                        message:(nullable NSString *)message
                                 preferredStyle:(UIAlertControllerStyle)preferredStyle
                              cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                         destructiveButtonTitle:(nullable NSString *)destructiveButtonTitle
                              otherButtonTitles:(nullable NSArray *)otherButtonTitles
             popoverPresentationControllerBlock:(nullable UIAlertControllerPopoverPresentationControllerBlock)popoverPresentationControllerBlock
                                       tapBlock:(nullable UIAlertControllerCompletionBlock)tapBlock;

/**
 创建alertController类型

 @param viewController controller
 @param title title
 @param message message
 @param cancelButtonTitle cancelTitle
 @param destructiveButtonTitle destructiveTitle
 @param otherButtonTitles otherTitles
 @param tapBlock tapBlock
 @return alertController
 */
+ (instancetype)gt_showAlertInViewController:(nonnull UIViewController *)viewController
                                           withTitle:(nullable NSString *)title
                                             message:(nullable NSString *)message
                                   cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                              destructiveButtonTitle:(nullable NSString *)destructiveButtonTitle
                                   otherButtonTitles:(nullable NSArray *)otherButtonTitles
                                            tapBlock:(nullable UIAlertControllerCompletionBlock)tapBlock;

/**
 创建actionSheet类型

 @param viewController controller
 @param title title
 @param message message
 @param cancelButtonTitle cancelTitle
 @param destructiveButtonTitle destructiveTitle
 @param otherButtonTitles otherTitles
 @param popoverPresentationControllerBlock popverBlock
 @param tapBlock tapBlock
 @return actionSheetController
 */
+ (instancetype)gt_showActionSheetInViewController:(nonnull UIViewController *)viewController
                                                 withTitle:(nullable NSString *)title
                                                   message:(nullable NSString *)message
                                         cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                                    destructiveButtonTitle:(nullable NSString *)destructiveButtonTitle
                                         otherButtonTitles:(nullable NSArray *)otherButtonTitles
                        popoverPresentationControllerBlock:(nullable UIAlertControllerPopoverPresentationControllerBlock)popoverPresentationControllerBlock
                                                  tapBlock:(nullable UIAlertControllerCompletionBlock)tapBlock;

@property (readonly, nonatomic) BOOL gt_visible;
@property (readonly, nonatomic) NSInteger gt_cancelButtonIndex;
@property (readonly, nonatomic) NSInteger gt_firstOtherButtonIndex;
@property (readonly, nonatomic) NSInteger gt_destructiveButtonIndex;
@end

NS_ASSUME_NONNULL_END
