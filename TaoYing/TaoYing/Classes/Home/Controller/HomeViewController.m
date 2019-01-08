//
//  HomeViewController.m
//  TaoYing
//
//  Created by mac on 2019/1/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "HomeViewController.h"
#import <GTCommonKit.h>
#import "HomeBannerView.h"
#import "MovieTopCollectionViewCell.h"
#import "HomeZoneTopItem.h"
#import <MJExtension.h>
#import "HomeRecomendCollectionViewCell.h"
#import "HomeRecommendItem.h"
#import "MovieDevoteCell.h"
#import "HomeMovieDevoteItem.h"


#define SilderImagesArray @[@"http://gfs5.gomein.net.cn/T1obZ_BmLT1RCvBVdK.jpg",@"http://gfs9.gomein.net.cn/T1C3J_B5LT1RCvBVdK.jpg",@"http://gfs5.gomein.net.cn/T1CwYjBCCT1RCvBVdK.jpg",@"http://gfs7.gomein.net.cn/T1u8V_B4ET1RCvBVdK.jpg",@"http://gfs7.gomein.net.cn/T1zODgB5CT1RCvBVdK.jpg"]



@interface HomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
/// zone 5栏目
@property (strong , nonatomic)NSMutableArray<HomeZoneTopItem *> *zoneItem;
/// 推荐电影
@property (strong , nonatomic)NSMutableArray<HomeRecommendItem *> *recommendItem;
/// 影视投资
@property (strong , nonatomic)NSMutableArray<HomeMovieDevoteItem *> *devoteItem;



@end

/* banner */
static NSString *const HomeBannerViewID = @"HomeBannerView";
static NSString *const MovieTopCollectionViewCellID = @"MovieTopCollectionViewCell";
static NSString *const HomeRecomendCollectionViewCellID = @"HomeRecomendCollectionViewCell";
static NSString *const MovieDevoteCellID = @"MovieDevoteCell";



@implementation HomeViewController


#pragma -mark lifeCycle


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
#pragma mark - LazyLoad
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.frame = CGRectMake(0, 0, kWidth, kHeight - 64);
        _collectionView.showsVerticalScrollIndicator = NO;
        //注册
        [_collectionView registerClass:[HomeBannerView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HomeBannerViewID];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"systemReuse"];
        
        
        [_collectionView registerClass:[MovieTopCollectionViewCell class] forCellWithReuseIdentifier:@"MovieTopCollectionViewCell"];
        [_collectionView registerClass:[HomeRecomendCollectionViewCell class] forCellWithReuseIdentifier:@"HomeRecomendCollectionViewCell"];
        [_collectionView registerClass:[MovieDevoteCell class] forCellWithReuseIdentifier:@"MovieDevoteCell"];
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
    }
    return _collectionView;
}

#pragma mark - LifeCyle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor gt_colorWithHexString:@"#f8f8f8"];
    [self setUpData];
    [self setUpBase];
    [self.view addSubview:_collectionView];
}

- (void)setUpData{
    _zoneItem = [HomeZoneTopItem mj_objectArrayWithFilename:@"HomeMovie.plist"];
    _devoteItem = [HomeMovieDevoteItem mj_objectArrayWithFilename:@"MovieDevote.plist"];
    
}

#pragma mark - initialize
- (void)setUpBase
{
    self.collectionView.backgroundColor = [UIColor gt_colorWithHexString:@"#f8f8f8"];
}


#pragma mark - <UICollectionViewDataSource>
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 6;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 5;
    }else if (section == 1){
        return 1;
    }else if (section == 2){
        return _devoteItem.count;
    }
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MovieTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MovieTopCollectionViewCellID forIndexPath:indexPath];
        cell.backgroundColor = [UIColor gt_colorWithHexString:@"#f8f8f8"];
        cell.zoneItem = _zoneItem[indexPath.row];
        return cell;
    }else if (indexPath.section == 1){
        HomeRecomendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HomeRecomendCollectionViewCellID forIndexPath:indexPath];
        return cell;
    }else if (indexPath.section == 2){
        MovieDevoteCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MovieDevoteCellID forIndexPath:indexPath];
        cell.movieDevoteItem = _devoteItem[indexPath.row];
        return cell;
    }
    UICollectionViewCell *gridcell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    gridcell.backgroundColor = [UIColor yellowColor];
    return gridcell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        if (indexPath.section == 0) {
            HomeBannerView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HomeBannerViewID forIndexPath:indexPath];
            headerView.imageArr = SilderImagesArray;
            reusableview = headerView;
        }
        
        if (indexPath.section == 2) {
            UICollectionReusableView *reuseView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"systemReuse" forIndexPath:indexPath];
            UILabel *label = [[UILabel alloc] init];
            label.textColor = [UIColor blackColor];
            label.font = [UIFont systemFontOfSize:15];
            label.text = @"影视投资";
            label.frame = CGRectMake(10, 0, kWidth, 35);
            [reuseView addSubview:label];
            reusableview = reuseView;
        }
    }
    return reusableview;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(kWidth, 230); //图片滚动的宽高
    }else if (section == 2){
        return CGSizeMake(kWidth, 35);
    }
    return CGSizeZero;
}

#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(kWidth/6 , kWidth/5);
    }else if (indexPath.section == 1){
        return CGSizeMake(kWidth , kWidth *0.4);
    }else if (indexPath.section == 2){
        return CGSizeMake(kWidth, kWidth * 0.45);
    }
    else{
        return CGSizeMake(kWidth / 4, kWidth / 4);
    }
}

#pragma mark - <UICollectionViewDelegateFlowLayout>

#pragma mark - X间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    return  (section == 1) ? 10 : 0;
//}
//#pragma mark - Y间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
//    return  (section == 1) ? 30 : 0;
//}




/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
