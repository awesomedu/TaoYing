//
//  NSString+ToJson.m
//  TaoYing
//
//  Created by 唐都 on 2019/1/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import "NSString+ToJson.h"

@implementation NSString (ToJson)

+(NSString *)objectToJson:(id)obj{
    if (obj == nil) {
        return nil ;
    }
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:0 error:&error];
    if ([jsonData length] && error == nil)
    {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }else{
        return nil;
        
    }
}


@end
