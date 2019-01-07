//
//  UITableView+GTTableView.h
//  PodRepo
//
//  Created by mac on 2018/12/11.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (GTTableView)

/**
 更新动画block

 @param block block
 */
- (void)gt_updateWithBlock:(void (^)(UITableView *tableView))block;


/**
 滚动到某一行

 @param row row
 @param section section
 @param scrollPosition 滚动的位子
 @param animated UITableViewRowAnimation
 */
- (void)gt_scrollToRow:(NSUInteger)row inSection:(NSUInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;


/**
 在某一插入某一行

 @param row row
 @param section section
 @param animation UITableViewRowAnimation
 */
- (void)gt_insertRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;


/**
 刷新某一分区的某一行

 @param row row
 @param section section
 @param animation UITableViewRowAnimation
 */
- (void)gt_reloadRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;


/**
 删除某一分区的某一行

 @param row row
 @param section section
 @param animation UITableViewRowAnimation
 */
- (void)gt_deleteRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;


/**
 插入某一行

 @param indexPath indexPath
 @param animation UITableViewRowAnimation
 */
- (void)gt_insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;


/**
 刷新某一个indexPath

 @param indexPath indexPath
 @param animation UITableViewRowAnimation
 */
- (void)gt_reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;


/**
 删除某一行

 @param indexPath indexPath
 @param animation UITableViewRowAnimation
 */
- (void)gt_deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;


/**
 插入某一个分区

 @param section 分区
 @param animation UITableViewRowAnimation
 */
- (void)gt_insertSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;


/**
 删除某一个分区

 @param section 分区
 @param animation UITableViewRowAnimation
 */
- (void)gt_deleteSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;


/**
 刷新section

 @param section 分区
 @param animation UITableViewRowAnimation
 */
- (void)gt_reloadSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;


/**
 清除选择的row

 @param animated BOOL
 */
- (void)gt_clearSelectedRowsAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
