//
//  SlidingViewController.h
//  SZLeader
//
//  Created by mac on 2018/11/19.
//  Copyright © 2018年 猛爷. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef NS_ENUM(NSInteger, SlideDirection) {
    SlideDirectionLeft,
    SlideDirectionRight
};

@protocol SlidingViewTransition<NSObject>
- (void)updateSourceView:(UIView *)sourceView destinationView:(UIView *)destView withProgress:(CGFloat)progress direction:(SlideDirection)direction;
@end


NS_ASSUME_NONNULL_BEGIN

@interface SlidingViewController : UIViewController
@property(nonatomic,strong) id<SlidingViewTransition>animator;
- (void)scrollToPage:(NSInteger)page animated:(BOOL)animated;
- (void)removeAllChildViewControllers;
- (void)didScrollToPage:(NSInteger)page;

@end

NS_ASSUME_NONNULL_END
