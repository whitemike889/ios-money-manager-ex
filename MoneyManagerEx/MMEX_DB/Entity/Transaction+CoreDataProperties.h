//
//  Transaction+CoreDataProperties.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/6.
//  Copyright © 2016年 taotao. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Transaction.h"

NS_ASSUME_NONNULL_BEGIN

@interface Transaction (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *trans_create_time;
@property (nullable, nonatomic, retain) NSDate *trans_date;
@property (nullable, nonatomic, retain) NSNumber *trans_id;
@property (nullable, nonatomic, retain) NSDate *trans_modify_time;
@property (nullable, nonatomic, retain) NSNumber *trans_money;
@property (nullable, nonatomic, retain) NSString *trans_note;
@property (nullable, nonatomic, retain) NSNumber *trans_status;
@property (nullable, nonatomic, retain) Account *account;
@property (nullable, nonatomic, retain) Contacts *payee;
@property (nullable, nonatomic, retain) TransactionType *transaction_type;
@property (nullable, nonatomic, retain) NSSet<UserInfo *> *user;

@end

@interface Transaction (CoreDataGeneratedAccessors)

- (void)addUserObject:(UserInfo *)value;
- (void)removeUserObject:(UserInfo *)value;
- (void)addUser:(NSSet<UserInfo *> *)values;
- (void)removeUser:(NSSet<UserInfo *> *)values;

@end

NS_ASSUME_NONNULL_END
