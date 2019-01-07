//
//  NSDictionary+Category.h
//  PodRepo
//
//  Created by mac on 2018/12/11.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Category)

/**
 *  字段转成json的字符串
 *
 *  @return json 字符串
 */
- (NSString *)gt_TransToJSONString;
@end


