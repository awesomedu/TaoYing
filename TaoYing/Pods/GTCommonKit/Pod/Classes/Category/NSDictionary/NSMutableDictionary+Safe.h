//
//  NSMutableDictionary+safe.h
//  PodRepo
//
//  Created by mac on 2018/12/11.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Safe)

- (void)gt_safeSetObject:(id)aObj forKey:(id<NSCopying>)aKey;

- (id)gt_safeObjectForKey:(id<NSCopying>)aKey;

@end
