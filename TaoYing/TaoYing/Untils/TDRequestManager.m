//
//  TDRequestManager.m
//  TaoYing
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "TDRequestManager.h"
#import <AFNetworking.h>
#import "UserDetailModel.h"

@implementation TDRequestManager

+(void)GETWithUrl:(NSString *)url params:(NSDictionary *)param success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
    UserDetailModel *model = [UserDetailModel getUserModel];
    if (model.tokenValue) {
        [manager.requestSerializer setValue:model.tokenValue forHTTPHeaderField:@"x-auth-token"];
    }
    [manager GET:url parameters:param progress:nil success:success failure:failure];
}

+(void)POSTWithUrl:(NSString *)url params:(NSDictionary *)param success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager POST:url parameters:param progress:nil success:success failure:failure];
}



@end
