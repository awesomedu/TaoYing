//
//  GTFMDBManager.h
//  AddPods
//
//  Created by mac on 2018/12/13.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTFMDBManager : NSObject


/** 单例方法创建database*/
+ (instancetype)shareDataBase;

+ (instancetype)shareDataBase:(nullable NSString *)dbName;

+ (instancetype)shareDataBase:(nullable NSString *)dbName path:(nullable NSString *)dbPath;


/** 实例化方法创建database*/
- (instancetype)initWithDBName:(NSString *)dbName;

- (instancetype)initWithDBName:(NSString *)dbName path:(NSString *)dbPath;



/**
 创建表 通过传入的model或dictionary(如果是字典注意类型要写对),虽然都可以不过还是推荐以下都用model
 
 @param tableName 表的名称
 @param parameters 设置表的字段,可以传model(runtime自动生成字段)或字典(格式:@{@"name":@"TEXT"})
 @return 是否创建成功
 */
- (BOOL)gt_createTable:(NSString *)tableName dicOrModel:(id)parameters;

- (BOOL)gt_createTable:(NSString *)tableName dicOrModel:(id)parameters excludeName:(NSArray *)nameArr;

/**
 增加: 向表中插入数据
 
 @param tableName 表的名称
 @param parameters 要插入的数据,可以是model或dictionary(格式:@{@"name":@"小李"})
 @return 是否插入成功
 */
- (BOOL)gt_insertTable:(NSString *)tableName dicOrModel:(id)parameters;

/**
 删除: 根据条件删除表中数据
 
 @param tableName 表的名称
 @param format 条件语句, 如:@"where name = '小李'"
 @return 是否删除成功
 */
- (BOOL)gt_deleteTable:(NSString *)tableName whereFormat:(NSString *)format, ...;

/**
 更改: 根据条件更改表中数据
 
 @param tableName 表的名称
 @param parameters 要更改的数据,可以是model或dictionary(格式:@{@"name":@"张三"})
 @param format 条件语句, 如:@"where name = '小李'"
 @return 是否更改成功
 */
- (BOOL)gt_updateTable:(NSString *)tableName dicOrModel:(id)parameters whereFormat:(NSString *)format, ...;

/**
 查找: 根据条件查找表中数据
 
 @param tableName 表的名称
 @param parameters 每条查找结果放入model(可以是[Person class] or @"Person" or Person实例)或dictionary中
 @param format 条件语句, 如:@"where name = '小李'",
 @return 将结果存入array,数组中的元素的类型为parameters的类型
 */
- (NSArray *)gt_lookupTable:(NSString *)tableName dicOrModel:(id)parameters whereFormat:(NSString *)format, ...;

/**
 批量插入或更改
 
 @param dicOrModelArray 要insert/update数据的数组,也可以将model和dictionary混合装入array
 @return 返回的数组存储未插入成功的下标,数组中元素类型为NSNumber
 */
- (NSArray *)gt_insertTable:(NSString *)tableName dicOrModelArray:(NSArray *)dicOrModelArray;

// `删除表
- (BOOL)gt_deleteTable:(NSString *)tableName;
// `清空表
- (BOOL)gt_deleteAllDataFromTable:(NSString *)tableName;
// `是否存在表
- (BOOL)gt_isExistTable:(NSString *)tableName;
// `表中共有多少条数据
- (int)gt_tableItemCount:(NSString *)tableName;
// `返回表中的字段名
- (NSArray *)gt_columnNameArray:(NSString *)tableName;

// `关闭数据库
- (void)close;
// `打开数据库 (每次shareDatabase系列操作时已经open,当调用close后若进行db操作需重新open或调用shareDatabase)
- (void)open;

/**
 增加新字段, 在建表后还想新增字段,可以在原建表model或新model中新增对应属性,然后传入即可新增该字段,该操作已在事务中执行
 
 @param tableName 表的名称
 @param parameters 如果传Model:数据库新增字段为建表时model所没有的属性,如果传dictionary格式为@{@"newname":@"TEXT"}
 @param nameArr 不允许生成字段的属性名的数组
 @return 是否成功
 */
- (BOOL)gt_alterTable:(NSString *)tableName dicOrModel:(id)parameters excludeName:(NSArray *)nameArr;
- (BOOL)gt_alterTable:(NSString *)tableName dicOrModel:(id)parameters;


// =============================   线程安全操作    ===============================

/**
 将操作语句放入block中即可保证线程安全, 如:
 
 Person *p = [[Person alloc] init];
 p.name = @"小李";
 [jqdb jq_inDatabase:^{
 [jqdb jq_insertTable:@"users" dicOrModel:p];
 }];
 */
- (void)gt_inDatabase:(void (^)(void))block;


/**
 事务: 将操作语句放入block中可执行回滚操作(*rollback = YES;)
 
 Person *p = [[Person alloc] init];
 p.name = @"小李";
 
 for (int i=0,i < 1000,i++) {
 [jq jq_inTransaction:^(BOOL *rollback) {
 BOOL flag = [jq jq_insertTable:@"users" dicOrModel:p];
 if (!flag) {
 *rollback = YES; //只要有一次不成功,则进行回滚操作
 return;
 }
 }];
 }
 
 */
- (void)gt_inTransaction:(void(^)(BOOL *rollback))block;




@end

NS_ASSUME_NONNULL_END
