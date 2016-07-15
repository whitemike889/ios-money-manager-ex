//
//  TransactionType+CoreDataProperties.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/6.
//  Copyright © 2016年 taotao. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TransactionType.h"

NS_ASSUME_NONNULL_BEGIN

@interface TransactionType (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *tt_create_time;
@property (nullable, nonatomic, retain) NSString *tt_name;
@property (nullable, nonatomic, retain) NSString *tt_name_letter;
@property (nullable, nonatomic, retain) NSNumber *tt_root_type;
@property (nullable, nonatomic, retain) NSNumber *tt_status;
@property (nullable, nonatomic, retain) NSSet<TransactionType *> *childs;
@property (nullable, nonatomic, retain) TransactionType *parent;
@property (nullable, nonatomic, retain) NSSet<Transaction *> *transactions;

@end

@interface TransactionType (CoreDataGeneratedAccessors)

- (void)addChildsObject:(TransactionType *)value;
- (void)removeChildsObject:(TransactionType *)value;
- (void)addChilds:(NSSet<TransactionType *> *)values;
- (void)removeChilds:(NSSet<TransactionType *> *)values;

- (void)addTransactionsObject:(Transaction *)value;
- (void)removeTransactionsObject:(Transaction *)value;
- (void)addTransactions:(NSSet<Transaction *> *)values;
- (void)removeTransactions:(NSSet<Transaction *> *)values;

@end

NS_ASSUME_NONNULL_END
