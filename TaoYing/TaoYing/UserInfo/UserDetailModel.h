//
//  UserDetailModel.h
//  TaoYing
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserDetailModel : NSObject<NSCoding>
/// 用户名称
@property (nonatomic, copy) NSString *username;
/// 用户ID
@property (nonatomic, copy) NSString *userId;
/// TOKEN
@property (nonatomic, copy) NSString *tokenValue;
/// 用户头像地址
@property (nonatomic, copy) NSString *himageUrl;
/// 用户邀请码
@property (nonatomic, copy) NSString *myInviteCode;
/// 昵称
@property (nonatomic, copy) NSString *nickName;
/// 邮箱
@property (nonatomic, copy) NSString *email;
/// 手机
@property (nonatomic, copy) NSString *phone;

+(instancetype)shareInstance;
/** 保存model */
+(void)save;
/** 清空本地数据 */
+(void)clear;
/** 获取用户 @return 用户数据 */
+(UserDetailModel *)getUserModel;

-(void)setModel:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
