//
//  TDRequestManager.h
//  TaoYing
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TDRequestManager : NSObject

+(void)GETWithUrl:(NSString *)url params:(NSDictionary *)param  success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;

+(void)POSTWithUrl:(NSString *)url params:(NSDictionary *)param  success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;


@end

NS_ASSUME_NONNULL_END
