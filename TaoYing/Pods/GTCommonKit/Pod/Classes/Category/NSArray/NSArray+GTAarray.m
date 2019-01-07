//
//  NSArray+GTAarray.m
//  PodRepo
//
//  Created by mac on 2018/12/11.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "NSArray+GTAarray.h"

@implementation NSArray (GTAarray)
- (NSArray *)gt_reverseArray {
    NSMutableArray *arrayTemp = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) {
        [arrayTemp addObject:element];
    }
    return arrayTemp;
}


@end
