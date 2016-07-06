//
//  Contacts+CoreDataProperties.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/6.
//  Copyright © 2016年 taotao. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Contacts.h"

NS_ASSUME_NONNULL_BEGIN

@interface Contacts (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *contact_remark;
@property (nullable, nonatomic, retain) NSNumber *contact_staus;
@property (nullable, nonatomic, retain) UserInfo *contactInfo;
@property (nullable, nonatomic, retain) NSSet<Transaction *> *transactions;
@property (nullable, nonatomic, retain) UserInfo *user;

@end

@interface Contacts (CoreDataGeneratedAccessors)

- (void)addTransactionsObject:(Transaction *)value;
- (void)removeTransactionsObject:(Transaction *)value;
- (void)addTransactions:(NSSet<Transaction *> *)values;
- (void)removeTransactions:(NSSet<Transaction *> *)values;

@end

NS_ASSUME_NONNULL_END
