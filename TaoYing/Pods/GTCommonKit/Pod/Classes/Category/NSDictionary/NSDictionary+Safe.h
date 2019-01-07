//
//  NSDictionary+safe.h
//  PodRepo
//
//  Created by mac on 2018/12/11.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Safe)

- (id)gt_safeObjectForKey:(NSString *)key;

- (void)gt_safeSetValue:(id)object forKey:(id)key;

- (id)gt_objectForKeyCustom:(id)aKey;

- (id)gt_safeKeyForValue:(id)value;

@end
