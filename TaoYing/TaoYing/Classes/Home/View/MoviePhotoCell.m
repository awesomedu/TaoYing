//
//  MoviePhotoCell.m
//  TaoYing
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "MoviePhotoCell.h"
#import "MovieintroduceVideoPhotoItem.h"
#import "MoviePhotoInnerCell.h"
#import <GTCommonKit.h>
#import <MJExtension.h>

@interface MoviePhotoCell ()<UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout>

@property (strong , nonatomic)UICollectionView *collectionView;
@property (strong , nonatomic)NSMutableArray<MovieintroduceVideoPhotoItem *> *moviePhotoItems;

@end

static NSString *const MoviePhotoInnerCellID = @"MoviePhotoInnerCell";

@implementation MoviePhotoCell


#pragma mark - lazyload
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        //        layout.minimumLineSpacing = 1;
        layout.itemSize = CGSizeMake(kWidth *0.45, self.frame.size.height);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal; //滚动方向
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self addSubview:_collectionView];
        _collectionView.frame = self.bounds;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[MoviePhotoInnerCell class] forCellWithReuseIdentifier:MoviePhotoInnerCellID];
    }
    return _collectionView;
}


- (NSMutableArray<MovieintroduceVideoPhotoItem *> *)moviePhotoItems{
    if (!_moviePhotoItems) {
        _moviePhotoItems = [NSMutableArray array];
    }
    return _moviePhotoItems;
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
    self.moviePhotoItems = [MovieintroduceVideoPhotoItem mj_objectArrayWithFilename:@"VideoPhoto.plist"];
}

- (void)setUpUI{
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
}

#pragma mark - Setter Getter Methods
#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _moviePhotoItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MoviePhotoInnerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MoviePhotoInnerCellID forIndexPath:indexPath];
    cell.moviePhotoItem = self.moviePhotoItems[indexPath.row];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"影视宣发 视频剧照%zd",indexPath.row);
}


@end
