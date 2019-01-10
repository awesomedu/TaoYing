//
//  MineViewController.m
//  TaoYing
//
//  Created by mac on 2019/1/7.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "MineViewController.h"
#import "GTCommonKit.h"
#import "TDNavView.h"
#import "MineContentCell.h"

#define backImgHeight 162

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource,TDNavViewDelegate>
{
    UIImageView *_headerImage;//header
        UILabel *_nameLabel;
}

@property(nonatomic,assign)float backImgWidth;
@property(nonatomic,strong)TDNavView *NavView;
@property(nonatomic,strong)UIImageView *backgroundImgView;
@property(nonatomic,strong)UIImageView *headImageView;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self backImageView];
    [self layoutTableView];
    [self createNaView];
}

//底部imageView
-(void)backImageView{
    self.view.backgroundColor = [UIColor gt_colorWithHexString:@"#f5f5f5"];
    UIImage *image=[UIImage imageNamed:@"img"];
    _backgroundImgView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth, backImgHeight)];
    _backgroundImgView.image=image;
    _backgroundImgView.userInteractionEnabled=YES;
    [self.view addSubview:_backgroundImgView];
    _backImgWidth=_backgroundImgView.frame.size.width;
}

- (void)createNaView
{
    self.NavView=[[TDNavView alloc]initWithFrame:CGRectMake(0, 0, kWidth, NAV_HEIGHT)];
    self.NavView.navColor = [UIColor redColor];
    self.NavView.right_button_image = @"setting";
    self.NavView.delegate = self;
    [self.view addSubview:self.NavView];
}

-(void)layoutTableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight-NAV_HEIGHT) style:UITableViewStylePlain];
        _tableView.backgroundColor=[UIColor clearColor];
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _tableView.dataSource=self;
        _tableView.delegate=self;
        _tableView.tableFooterView = [[UIView alloc] init];
        [_tableView registerNib:[UINib nibWithNibName:@"MineContentCell" bundle:nil] forCellReuseIdentifier:@"MineContentCell"];
        [self.view addSubview:_tableView];
    }
    [_tableView setTableHeaderView:[self headImageView]];
}

-(UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView=[[UIImageView alloc]init];
//        _headImageView.backgroundColor = [UIColor brownColor];
        _headImageView.frame=CGRectMake(0, 0, kWidth, backImgHeight);
        _headImageView.backgroundColor=[UIColor clearColor];
        _headImageView.userInteractionEnabled = YES;
        _headerImage =[[UIImageView alloc]initWithFrame:CGRectMake(kWidth/2-35, 50, 70, 70)];
        _headerImage.userInteractionEnabled = YES;
        _headerImage.center=CGPointMake(kWidth/2, 70);
        [_headerImage setImage:[UIImage imageNamed:@"touxiang"]];
        [_headerImage.layer setMasksToBounds:YES];
        [_headerImage.layer setCornerRadius:35];
        _headerImage.backgroundColor=[UIColor whiteColor];
        _headerImage.userInteractionEnabled=YES;
//        UITapGestureRecognizer *header_tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(header_tap_Click:)];
//        [_headerImage addGestureRecognizer:header_tap];
        [_headImageView addSubview:_headerImage];
        
        UIView *underLineView = [UIView new];
        underLineView.backgroundColor = [UIColor whiteColor];
        underLineView.frame = CGRectMake(10, CGRectGetHeight(_headImageView.frame) - 20, CGRectGetWidth(_headImageView.frame) - 20, 20);
        // 圆角处理
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:underLineView.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerTopLeft    cornerRadii:CGSizeMake(3, 3)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = underLineView.bounds;
        maskLayer.path = maskPath.CGPath;
        underLineView.layer.mask = maskLayer;
        [_headImageView addSubview:underLineView];
        
        _nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(147, 130, 105, 20)];
        _nameLabel.center = CGPointMake(kWidth/2, 125);
        _nameLabel.text = @"Rainy";
        _nameLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *nick_tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nick_tap_Click:)];
        [_nameLabel addGestureRecognizer:nick_tap];
        _nameLabel.textColor=[UIColor whiteColor];
        _nameLabel.textAlignment=NSTextAlignmentCenter;
        [_headImageView addSubview:_nameLabel];
    }
    return _headImageView;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int contentOffsety = scrollView.contentOffset.y;
    if (contentOffsety<0) {
        CGRect rect = _backgroundImgView.frame;
        rect.size.height = backImgHeight-contentOffsety;
        rect.size.width = _backImgWidth* (backImgHeight-contentOffsety)/backImgHeight;
        rect.origin.x =  -(rect.size.width-_backImgWidth)/2;
        rect.origin.y = 0;
        _backgroundImgView.frame = rect;
    }else{
        CGRect rect = _backgroundImgView.frame;
        rect.size.height = backImgHeight;
        rect.size.width = _backImgWidth;
        rect.origin.x = 0;
        rect.origin.y = -contentOffsety;
        _backgroundImgView.frame = rect;
    }
}


#pragma mark ---- UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MineContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineContentCell"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 220.5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

#pragma -mark TDNavDelegate
- (void)rightClick{
    NSLog(@"___%s___",__func__);
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
