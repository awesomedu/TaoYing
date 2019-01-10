//
//  TDRequest.h
//  TaoYing
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TDRequest : NSObject

/// 登录
+ (void)loginWithUserName:(NSString *)userName
                      pwd:(NSString *)pwd
                  success:(void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;

/// 发送验证码
+ (void)sendMsgWithPhone:(NSString *)phoneNum
                 success:(void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                 failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;

/// 注册
+ (void)registerWithPhone:(NSString *)phoneNum
               inviteCode:(NSString *)inviteCode
                 password:(NSString *)pwd
                 username:(NSString *)useraname
                  success:(void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                  failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;

/// 首页
+ (void)getHomeDataWithToken:(NSString *)AuthToken
                     success:(void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                     failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;



@end

NS_ASSUME_NONNULL_END
