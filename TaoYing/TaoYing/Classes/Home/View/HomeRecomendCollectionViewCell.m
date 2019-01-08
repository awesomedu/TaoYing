//
//  HomeRecomendCollectionViewCell.m
//  TaoYing
//
//  Created by mac on 2019/1/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "HomeRecomendCollectionViewCell.h"
#import "HomeRecommendItem.h"
#import "RecommendInnerCell.h"
#import <GTCommonKit.h>
#import <MJExtension.h>


@interface HomeRecomendCollectionViewCell()<UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout>

@property (strong , nonatomic)UICollectionView *collectionView;
@property (strong , nonatomic)NSMutableArray<HomeRecommendItem *> *recommendItem;

@end

static NSString *const RecommendInnerCellID = @"RecommendInnerCell";

@implementation HomeRecomendCollectionViewCell

#pragma mark - lazyload
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//        layout.minimumLineSpacing = 1;
        layout.itemSize = CGSizeMake(kWidth *0.8, kWidth *0.4);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal; //滚动方向
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self addSubview:_collectionView];
        _collectionView.frame = self.bounds;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[RecommendInnerCell class] forCellWithReuseIdentifier:RecommendInnerCellID];
    }
    return _collectionView;
}


- (NSMutableArray<HomeRecommendItem *> *)recommendItem{
    if (!_recommendItem) {
        _recommendItem = [NSMutableArray array];
    }
    return _recommendItem;
}

#pragma -mark init

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpData];
        [self setUpUI];
    }
    return self;
}

- (void)setUpData{
    self.recommendItem = [HomeRecommendItem mj_objectArrayWithFilename:@"Recommend.plist"];
}

- (void)setUpUI{
    self.backgroundColor = [UIColor clearColor];
    self.collectionView.backgroundColor = [UIColor gt_colorWithHexString:@"#f8f8f8"];
    
}

#pragma mark - Setter Getter Methods
#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _recommendItem.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RecommendInnerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:RecommendInnerCellID forIndexPath:indexPath];
    cell.recomendItem = self.recommendItem[indexPath.row];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"点击了计时商品%zd",indexPath.row);
    
}



@end
