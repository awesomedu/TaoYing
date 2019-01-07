//
//  NSDictionary+Category.h
//  PodRepo
//
//  Created by mac on 2018/12/11.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "NSDictionary+Category.h"


@implementation NSDictionary (Category)

- (NSString *)gt_TransToJSONString
{
    NSData *paramsJSONData = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    return [[NSString alloc] initWithData:paramsJSONData encoding:NSUTF8StringEncoding];
}

@end
