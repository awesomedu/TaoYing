//
//  NSMutableDictionary+safe.h
//  PodRepo
//
//  Created by mac on 2018/12/11.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "NSMutableDictionary+Safe.h"

@implementation NSMutableDictionary (Safe)

- (void)gt_safeSetObject:(id)aObj forKey:(id<NSCopying>)aKey
{
    if (aObj && ![aObj isKindOfClass:[NSNull class]] && aKey) {
        [self setObject:aObj forKey:aKey];
    } else {
        return;
    }
}

- (id)gt_safeObjectForKey:(id<NSCopying>)aKey
{
    if (aKey != nil) {
        return [self objectForKey:aKey];
    } else {
        return nil;
    }
}
@end
