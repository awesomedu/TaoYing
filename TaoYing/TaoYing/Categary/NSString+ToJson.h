//
//  NSString+ToJson.h
//  TaoYing
//
//  Created by 唐都 on 2019/1/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ToJson)
+(NSString *)objectToJson:(id)obj;

@end

NS_ASSUME_NONNULL_END
