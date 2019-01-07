//
//  SlidingViewZoomTransition.m
//  SZLeader
//
//  Created by mac on 2018/11/19.
//  Copyright © 2018年 猛爷. All rights reserved.
//

#import "SlidingViewZoomTransition.h"

#define zoom  0.7
#define finalAlpha 0.6f


@implementation SlidingViewZoomTransition

- (void)updateSourceView:(UIView *)sourceView destinationView:(UIView *)destView withProgress:(CGFloat)progress direction:(SlideDirection)direction
{
    if (sourceView) {
        CGFloat sourceViewZoom = 1 - (1 - zoom) * progress;
        sourceView.transform=CGAffineTransformMakeScale(sourceViewZoom, sourceViewZoom);
        sourceView.alpha =  1 - progress * (1 - finalAlpha);
    }

    if (destView) {
        CGFloat destViewZoom = zoom + (1 - zoom) * progress;
        destView.transform=CGAffineTransformMakeScale(destViewZoom, destViewZoom);
        destView.alpha = finalAlpha + (1 - finalAlpha) * progress;
    }
}

@end
