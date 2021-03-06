//
//  MoviePubliishViewController.m
//  TaoYing
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "MoviePubliishViewController.h"
#import <GTCommonKit.h>
#import "MovieIntroduceItem.h"
#import <MJExtension.h>
#import "MoviePublishCell.h"
#import "MoviePublishCommonheaderView.h"
#import "MovieIntroduceActorItem.h"
#import "MoviePublishActorCell.h"
#import "MoviePhotoCell.h"
#import "MoviePublicCommentsHeaderView.h"
#import "MovieIntroduceCommentItem.h"
#import "MoviePublishCommentCell.h"
#import "MoviePublishMoreFooterView.h"
#import "MoviePublishShareCollectionViewCell.h"


@interface MoviePubliishViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,MoviePublishCellDelegate,LookMoreFooterViewDelegate>
{
    /// 头部展开折叠
    BOOL _isClick;
    /// 评论显示更多
    BOOL _isShowMore;
    
}
@property (nonatomic, strong) UICollectionView *collectionView;
/// 影视投资
@property (strong , nonatomic)NSMutableArray<MovieIntroduceItem *> *introItem;
/// 评论
@property (strong , nonatomic)NSMutableArray<MovieIntroduceCommentItem *> *commentItem;


@end

@implementation MoviePubliishViewController

static NSString *const MoviePublishCellID = @"MoviePublishCell";
static NSString *const MoviePublishCommonheaderViewID = @"MoviePublishCommonheaderView";
static NSString *const MoviePublishActorCellID = @"MoviePublishActorCell";
static NSString *const MoviePhotoCellID = @"MoviePhotoCell";
static NSString *const MoviePublicCommentsHeaderViewID = @"MoviePublicCommentsHeaderView";
static NSString *const MoviePublishCommentCellID = @"MoviePublishCommentCell";
static NSString *const MoviePublishMoreFooterViewID = @"MoviePublishMoreFooterView";
static NSString *const MoviePublishShareCollectionViewCellID = @"MoviePublishShareCollectionViewCell";


#pragma mark - LazyLoad
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.frame = CGRectMake(0, NAV_HEIGHT, kWidth, kHeight - NAV_HEIGHT);
        _collectionView.showsVerticalScrollIndicator = NO;
        //注册 头部
        [_collectionView registerClass:[MoviePublishCommonheaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MoviePublishCommonheaderViewID];
        [_collectionView registerClass:[MoviePublicCommentsHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MoviePublicCommentsHeaderViewID];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        
        
        //注册 尾部
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
        [_collectionView registerClass:[MoviePublishMoreFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:MoviePublishMoreFooterViewID];
        

        // cell
        [_collectionView registerClass:[MoviePublishCell class] forCellWithReuseIdentifier:MoviePublishCellID];
        [_collectionView registerClass:[MoviePublishActorCell class] forCellWithReuseIdentifier:MoviePublishActorCellID];
        [_collectionView registerClass:[MoviePhotoCell class] forCellWithReuseIdentifier:MoviePhotoCellID];
        [_collectionView registerClass:[MoviePublishCommentCell class] forCellWithReuseIdentifier:MoviePublishCommentCellID];
        [_collectionView registerClass:[MoviePublishShareCollectionViewCell class] forCellWithReuseIdentifier:MoviePublishShareCollectionViewCellID];
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}

#pragma mark - LifeCyle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpData];
    [self setUpBase];
    [self.view addSubview:_collectionView];
}

#pragma mark - initialize
- (void)setUpBase
{
    self.titleString = @"影视宣发";
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (void)setUpData{
    _introItem = [MovieIntroduceItem mj_objectArrayWithFilename:@"Introduce.plist"];
    _commentItem = [MovieIntroduceCommentItem mj_objectArrayWithFilename:@"Comments.plist"];
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 1;
    }else if (section == 2){
        return 1;
    }else if (section == 3){
        if (!_isShowMore) { /// 如果没有点击查看更多，显示3条
            return 3;
        }else{
            return _commentItem.count;
        }
    }
    else{
        return 1;
    }
}

#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (!_isClick) {
            NSString *content = @"单行高度数据";
            CGSize size =[content sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
            return  CGSizeMake(kWidth, 202 + size.height*3 + 5); // 3行高度
        }else{
            MovieIntroduceItem *item = [_introItem lastObject];
            return CGSizeMake(kWidth, 202 + item.headerViewHeight);
        }
    }else if (indexPath.section == 1){
        return CGSizeMake(kWidth, 160);
    }else if (indexPath.section == 2){
        return CGSizeMake(kWidth, 120);
    }else if (indexPath.section == 3){
        MovieIntroduceCommentItem *item = _commentItem[indexPath.row];
        if (item.itemComments.length) { // comments exist
            return CGSizeMake(kWidth, 115 + item.cellHeight);
        }else{
            return CGSizeMake(kWidth, 70);
        }
        return CGSizeMake(kWidth, 200);
    }else if (indexPath.section == 4){
        return CGSizeMake(kWidth, 250);
    }
    return CGSizeZero;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MoviePublishCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MoviePublishCellID forIndexPath:indexPath];
        cell.delegate = self;
        cell.item = [_introItem firstObject];
        return cell;
    }else if (indexPath.section == 1){
        MoviePublishActorCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MoviePublishActorCellID forIndexPath:indexPath];
        return cell;
    }else if (indexPath.section == 2){
        MoviePhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MoviePhotoCellID forIndexPath:indexPath];
        return cell;
    }else if (indexPath.section == 3){
        MoviePublishCommentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MoviePublishCommentCellID forIndexPath:indexPath];
        cell.commentItem = _commentItem[indexPath.row];
        return cell;
    }else if (indexPath.section == 4){
        MoviePublishShareCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MoviePublishShareCollectionViewCellID forIndexPath:indexPath];
        return cell;
        
    }
    else{
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        return cell;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        if (indexPath.section == 1) {
            MoviePublishCommonheaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MoviePublishCommonheaderViewID forIndexPath:indexPath];
            headerView.headerTitleStr = @"演职人员";
            reusableview = headerView;
        }else if (indexPath.section == 2){
            MoviePublishCommonheaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MoviePublishCommonheaderViewID forIndexPath:indexPath];
            headerView.headerTitleStr = @"视频剧照";
            reusableview = headerView;
        }else if (indexPath.section == 3){
            MoviePublicCommentsHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MoviePublicCommentsHeaderViewID forIndexPath:indexPath];
            reusableview = headerView;
        }else if (indexPath.section == 4){
            UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
            headerView.backgroundColor = [UIColor gt_colorWithHexString:@"#eaeaea"];
            reusableview = headerView;
        }
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
        if (indexPath.section == 0 || indexPath.section == 1 || indexPath.section == 2) {
            UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
            footerView.backgroundColor = [UIColor gt_colorWithHexString:@"#eaeaea"];
            reusableview = footerView;
        }else if (indexPath.section == 3){
            MoviePublishMoreFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:MoviePublishMoreFooterViewID forIndexPath:indexPath];
            footerView.commentsCount = _commentItem.count;
            footerView.delegate = self;
            footerView.backgroundColor = [UIColor whiteColor];
            reusableview = footerView;
        }
    }
    return reusableview;
}

/// header height
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return CGSizeMake(kWidth,40);
    }else if (section == 2){
        return CGSizeMake(kWidth, 40);
    }else if (section == 3){
        return CGSizeMake(kWidth, 40);
    }else if (section == 4){
        return CGSizeMake(kWidth, 10);
    }
    return CGSizeZero;
}

/// footer height
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
      if (section == 0 || section == 1 || section == 2) {
          return CGSizeMake(kWidth,10);
      }else if (section == 3){
          if (!_isShowMore) {
              return CGSizeMake(kWidth,30);
          }else{
              return CGSizeZero;
          }
          
      }
    return CGSizeMake(0, 0);
}


#pragma -mark MoviePublishCellDelegate
- (void)foldClick:(UIButton *)foldBtn{
    _isClick = foldBtn.isSelected;
    [self.collectionView reloadData];
}

#pragma -mark LookMoreFooterViewDelegate
- (void)showMoreData{
    _isShowMore = YES;
    [self.collectionView reloadData];
}






/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
