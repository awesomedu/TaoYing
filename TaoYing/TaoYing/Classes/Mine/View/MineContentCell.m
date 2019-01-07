//
//  MineContentCell.m
//  TaoYing
//
//  Created by mac on 2019/1/7.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "MineContentCell.h"
#import "GTCommonKit.h"

@interface MineContentCell()
@property (weak, nonatomic) IBOutlet UIView *backView;


@end


@implementation MineContentCell

- (void)drawRect:(CGRect)rect{
    [self.contentView layoutIfNeeded];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.backView.bounds
                                                   byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight    cornerRadii:CGSizeMake(3, 3)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.backView.bounds;
    maskLayer.path = maskPath.CGPath;
    self.backView.layer.mask = maskLayer;
}

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
