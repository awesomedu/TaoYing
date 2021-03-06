//
//  MoviePublishActorCell.m
//  TaoYing
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "MoviePublishActorCell.h"
#import "MovieIntroduceActorItem.h"
#import "MoviePublishActorInnerCell.h"
#import <GTCommonKit.h>
#import <MJExtension.h>

@interface MoviePublishActorCell()<UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout>

@property (strong , nonatomic)UICollectionView *collectionView;
@property (strong , nonatomic)NSMutableArray<MovieIntroduceActorItem *> *actorItems;


@end

static NSString *const MoviePublishActorInnerCellID = @"MoviePublishActorInnerCell";

@implementation MoviePublishActorCell

#pragma mark - lazyload
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        //        layout.minimumLineSpacing = 1;
        layout.itemSize = CGSizeMake(kWidth *0.27, self.frame.size.height);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal; //滚动方向
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self addSubview:_collectionView];
        _collectionView.frame = self.bounds;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[MoviePublishActorInnerCell class] forCellWithReuseIdentifier:MoviePublishActorInnerCellID];
    }
    return _collectionView;
}


- (NSMutableArray<MovieIntroduceActorItem *> *)actorItems{
    if (!_actorItems) {
        _actorItems = [NSMutableArray array];
    }
    return _actorItems;
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
    self.actorItems = [MovieIntroduceActorItem mj_objectArrayWithFilename:@"MovieActor.plist"];
}

- (void)setUpUI{
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
}

#pragma mark - Setter Getter Methods
#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _actorItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MoviePublishActorInnerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MoviePublishActorInnerCellID forIndexPath:indexPath];
    cell.actorItem = self.actorItems[indexPath.row];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"影视宣发 演员%zd",indexPath.row);
}






@end
