//
//  SlidingViewController.m
//  SZLeader
//
//  Created by mac on 2018/11/19.
//  Copyright © 2018年 猛爷. All rights reserved.
//

#import "SlidingViewController.h"


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
#define NAV_HEIGHT ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 88.0 : 64.0)

@interface SlidingViewController ()<UIScrollViewDelegate>
{
    NSInteger _start;
}
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic) CGFloat beginOffset;
@property (nonatomic) NSInteger currentPage;

@end

@implementation SlidingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _start = 0;
    if (@available(iOS 11.0, *)) {
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO; }
}


- (UIScrollView*)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

- (void)addChildViewController:(UIViewController *)childController
{
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat height = CGRectGetHeight(self.view.bounds);
    NSLog(@"frame = %@",NSStringFromCGRect(childController.view.frame));
    childController.view.frame = CGRectMake(width * self.childViewControllers.count, 0, width, height);
    [self.scrollView addSubview:childController.view];
    
    [super addChildViewController:childController];
    [childController didMoveToParentViewController:self];
    
    self.scrollView.contentSize = CGSizeMake(width * self.childViewControllers.count, height - NAV_HEIGHT);
}

- (void)removeAllChildViewControllers
{
    [self.childViewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIViewController *vc = (UIViewController *)obj;
        [vc willMoveToParentViewController:nil];
        [vc.view removeFromSuperview];
        [vc removeFromParentViewController];
        self.scrollView.contentSize = CGSizeMake(0, CGRectGetHeight(self.view.bounds));
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    CGFloat offset = self.scrollView.contentOffset.x;
    CGFloat progress = MIN(1,fabs((offset - self.beginOffset)/pageWidth));
    UIViewController *sourceVC = self.childViewControllers[self.currentPage];
    UIView *sourceView = sourceVC.view;
    UIView *destView;
    SlideDirection direction = self.slideDirection;
    NSInteger nextPage = direction == SlideDirectionRight ? self.currentPage + 1 : self.currentPage - 1;
    if (nextPage >= 0 && nextPage < self.childViewControllers.count) {
        UIViewController *destinationVC = self.childViewControllers[nextPage];
        destView = destinationVC.view;
    }
    if (_start != 0) {
        if (self.animator) {
            [self.animator updateSourceView:sourceView destinationView:destView withProgress:progress direction:direction];
        }
    }
    _start ++;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.beginOffset = self.scrollView.contentOffset.x;
    self.currentPage = [self calculateCurrentPage];
}

- (NSInteger)calculateCurrentPage
{
    CGFloat pageWidth = CGRectGetWidth(self.view.bounds);
    return floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.currentPage = [self calculateCurrentPage];
    UIViewController *destinationVC = self.childViewControllers[self.currentPage];
    [self.animator updateSourceView:nil destinationView:destinationVC.view withProgress:1 direction:self.slideDirection];
    [self didScrollToPage:self.currentPage];
}

- (SlideDirection)slideDirection
{
    return self.scrollView.contentOffset.x > self.beginOffset ? SlideDirectionRight : SlideDirectionLeft;
}

- (void)scrollToPage:(NSInteger)page animated:(BOOL)animated;
{
    CGFloat pageWidth = CGRectGetWidth(self.view.bounds);
    CGPoint offset = CGPointMake(pageWidth * page, 0);
    [self.scrollView setContentOffset:offset animated:animated];
}


- (void)didScrollToPage:(NSInteger)page
{
    
}
@end

