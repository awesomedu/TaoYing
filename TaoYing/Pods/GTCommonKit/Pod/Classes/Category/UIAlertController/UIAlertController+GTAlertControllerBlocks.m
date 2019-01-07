//
//  UIAlertController+GTAlertControllerBlocks.m
//  AddPods
//
//  Created by mac on 2018/12/13.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UIAlertController+GTAlertControllerBlocks.h"

static NSInteger const UIAlertControllerBlocksCancelButtonIndex = 0;
static NSInteger const UIAlertControllerBlocksDestructiveButtonIndex = 1;
static NSInteger const UIAlertControllerBlocksFirstOtherButtonIndex = 2;

@implementation UIAlertController (GTAlertControllerBlocks)


+ (instancetype)gt_showInViewController:(UIViewController *)viewController
                              withTitle:(NSString *)title
                                message:(NSString *)message
                         preferredStyle:(UIAlertControllerStyle)preferredStyle
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                 destructiveButtonTitle:(NSString *)destructiveButtonTitle
                      otherButtonTitles:(NSArray *)otherButtonTitles
     popoverPresentationControllerBlock:(void(^)(UIPopoverPresentationController *popover))popoverPresentationControllerBlock
                               tapBlock:(UIAlertControllerCompletionBlock)tapBlock
{
    UIAlertController *strongController = [self alertControllerWithTitle:title
                                                                 message:message
                                                          preferredStyle:preferredStyle];
    
    __weak UIAlertController *controller = strongController;
    
    if (cancelButtonTitle) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction *action){
                                                                 if (tapBlock) {
                                                                     tapBlock(controller, action, UIAlertControllerBlocksCancelButtonIndex);
                                                                 }
                                                             }];
        [controller addAction:cancelAction];
    }
    
    if (destructiveButtonTitle) {
        UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:destructiveButtonTitle
                                                                    style:UIAlertActionStyleDestructive
                                                                  handler:^(UIAlertAction *action){
                                                                      if (tapBlock) {
                                                                          tapBlock(controller, action, UIAlertControllerBlocksDestructiveButtonIndex);
                                                                      }
                                                                  }];
        [controller addAction:destructiveAction];
    }
    
    for (NSUInteger i = 0; i < otherButtonTitles.count; i++) {
        NSString *otherButtonTitle = otherButtonTitles[i];
        
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction *action){
                                                                if (tapBlock) {
                                                                    tapBlock(controller, action, UIAlertControllerBlocksFirstOtherButtonIndex + i);
                                                                }
                                                            }];
        [controller addAction:otherAction];
    }
    
    if (popoverPresentationControllerBlock) {
        popoverPresentationControllerBlock(controller.popoverPresentationController);
    }
    
    [viewController presentViewController:controller animated:YES completion:nil];
    
    return controller;
}

+ (instancetype)gt_showAlertInViewController:(UIViewController *)viewController
                                   withTitle:(NSString *)title
                                     message:(NSString *)message
                           cancelButtonTitle:(NSString *)cancelButtonTitle
                      destructiveButtonTitle:(NSString *)destructiveButtonTitle
                           otherButtonTitles:(NSArray *)otherButtonTitles
                                    tapBlock:(UIAlertControllerCompletionBlock)tapBlock
{
    return [self gt_showInViewController:viewController
                               withTitle:title
                                 message:message
                          preferredStyle:UIAlertControllerStyleAlert
                       cancelButtonTitle:cancelButtonTitle
                  destructiveButtonTitle:destructiveButtonTitle
                       otherButtonTitles:otherButtonTitles
      popoverPresentationControllerBlock:nil
                                tapBlock:tapBlock];
}

+ (instancetype)gt_showActionSheetInViewController:(UIViewController *)viewController
                                         withTitle:(NSString *)title
                                           message:(NSString *)message
                                 cancelButtonTitle:(NSString *)cancelButtonTitle
                            destructiveButtonTitle:(NSString *)destructiveButtonTitle
                                 otherButtonTitles:(NSArray *)otherButtonTitles
                                          tapBlock:(UIAlertControllerCompletionBlock)tapBlock
{
    return [self gt_showActionSheetInViewController:viewController
                                          withTitle:title
                                            message:message
                                  cancelButtonTitle:cancelButtonTitle
                             destructiveButtonTitle:destructiveButtonTitle
                                  otherButtonTitles:otherButtonTitles
                 popoverPresentationControllerBlock:nil
                                           tapBlock:tapBlock];
}

+ (instancetype)gt_showActionSheetInViewController:(UIViewController *)viewController
                                         withTitle:(NSString *)title
                                           message:(NSString *)message
                                 cancelButtonTitle:(NSString *)cancelButtonTitle
                            destructiveButtonTitle:(NSString *)destructiveButtonTitle
                                 otherButtonTitles:(NSArray *)otherButtonTitles
                popoverPresentationControllerBlock:(void(^)(UIPopoverPresentationController *popover))popoverPresentationControllerBlock
                                          tapBlock:(UIAlertControllerCompletionBlock)tapBlock
{
    return [self gt_showInViewController:viewController
                               withTitle:title
                                 message:message
                          preferredStyle:UIAlertControllerStyleActionSheet
                       cancelButtonTitle:cancelButtonTitle
                  destructiveButtonTitle:destructiveButtonTitle
                       otherButtonTitles:otherButtonTitles
      popoverPresentationControllerBlock:popoverPresentationControllerBlock
                                tapBlock:tapBlock];
}

- (BOOL)gt_visible
{
    return self.view.superview != nil;
}

- (NSInteger)gt_cancelButtonIndex
{
    return UIAlertControllerBlocksCancelButtonIndex;
}

- (NSInteger)gt_firstOtherButtonIndex
{
    return UIAlertControllerBlocksFirstOtherButtonIndex;
}

- (NSInteger)gt_destructiveButtonIndex
{
    return UIAlertControllerBlocksDestructiveButtonIndex;
}


@end
