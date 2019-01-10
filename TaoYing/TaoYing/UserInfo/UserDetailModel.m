//
//  UserDetailModel.m
//  TaoYing
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "UserDetailModel.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <MJExtension.h>

NSString * const userPath = @"Documents/savePeople";
static UserDetailModel *model;
@implementation UserDetailModel

+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [UserDetailModel getUserModel];
        if (!model) {
            model = [[UserDetailModel alloc]init];
        }
    });
    return model;
}

-(void)setModel:(NSDictionary *)dic{
    if (model) {
        model = [UserDetailModel mj_objectWithKeyValues:dic context:nil];
    }
}

/** 保存model */
+(void)save{
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:[UserDetailModel shareInstance]];
    [data writeToFile:[NSHomeDirectory() stringByAppendingPathComponent:userPath] atomically:YES];
}

+(void)clear{//清空数据
    model = [[UserDetailModel alloc] init];
    [self save];
}

/** 获取用户 */
+(UserDetailModel *)getUserModel{
    NSData * data = [NSData dataWithContentsOfFile:[NSHomeDirectory() stringByAppendingPathComponent:userPath]];
    UserDetailModel *model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return model;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        NSString * key = [NSString stringWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
    free(ivars);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        unsigned int count = 0;
        Ivar * ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            const char * name = ivar_getName(ivar);
            NSString * key = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}


@end
