//
//  TDRequest.m
//  TaoYing
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "TDRequest.h"
#import "TDRequestManager.h"

@implementation TDRequest

+ (void)loginWithUserName:(NSString *)userName
                      pwd:(NSString *)pwd
                  success:(void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure{
    NSDictionary *dic = @{
                          @"username":userName,
                          @"password":pwd
                          };
    [TDRequestManager GETWithUrl:[BaseUrl stringByAppendingString:LOGIN] params:dic success:success failure:failure];
}

+ (void)sendMsgWithPhone:(NSString *)phoneNum
                 success:(void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure{
    NSDictionary *dic = @{
                          @"telephone":phoneNum
                          };
    [TDRequestManager GETWithUrl:[BaseUrl stringByAppendingString:SEND_MSG] params:dic success:success failure:failure];
}


+ (void)registerWithPhone:(NSString *)phoneNum
               inviteCode:(NSString *)inviteCode
                 password:(NSString *)pwd
                 username:(NSString *)useraname
                  success:(void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure{
    NSDictionary *dic = @{
                          @"deviceCode":phoneNum,
//                          @"inviteCode":inviteCode,
                          @"password":pwd,
                          @"username":useraname
                          };
    [TDRequestManager POSTWithUrl:[BaseUrl stringByAppendingString:REGISTER] params:dic success:success failure:failure];
}

+ (void)getHomeDataWithToken:(NSString *)AuthToken
                     success:(void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                     failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure{
    NSDictionary *dic = @{
                          @"x-auth-token":AuthToken
                          };
    [TDRequestManager GETWithUrl:[BaseUrl stringByAppendingString:HOME] params:dic success:success failure:failure];
    
}

+ (void)getHomeBannerSuccess:(void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                     failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure{
    [TDRequestManager GETWithUrl:[BaseUrl stringByAppendingString:BANNER] params:nil success:success failure:failure];
}


@end
