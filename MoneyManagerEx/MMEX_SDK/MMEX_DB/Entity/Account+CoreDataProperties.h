//
//  Account+CoreDataProperties.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/6.
//  Copyright © 2016年 taotao. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Account.h"

NS_ASSUME_NONNULL_BEGIN

@interface Account (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *acct_create_time;
@property (nullable, nonatomic, retain) NSNumber *acct_initial_capital;
@property (nullable, nonatomic, retain) NSDate *acct_modify_time;
@property (nullable, nonatomic, retain) NSString *acct_name;
@property (nullable, nonatomic, retain) NSString *acct_note;
@property (nullable, nonatomic, retain) NSString *acct_number;
@property (nullable, nonatomic, retain) NSNumber *acct_status;
@property (nullable, nonatomic, retain) NSNumber *acct_type;
@property (nullable, nonatomic, retain) Currency *currency;
@property (nullable, nonatomic, retain) Merchant *merchant;
@property (nullable, nonatomic, retain) NSSet<Transaction *> *transactions;
@property (nullable, nonatomic, retain) UserInfo *user;

@end

@interface Account (CoreDataGeneratedAccessors)

- (void)addTransactionsObject:(Transaction *)value;
- (void)removeTransactionsObject:(Transaction *)value;
- (void)addTransactions:(NSSet<Transaction *> *)values;
- (void)removeTransactions:(NSSet<Transaction *> *)values;

@end

NS_ASSUME_NONNULL_END
