//
//  MoneyManagerExDBCenter.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/5.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoneyManagerExDBCenter : NSObject

+ (instancetype)shareInstance;

#pragma mark - setup core data
- (void) setupCoreDataStackWithStoreNamed:(NSString *)storeName;
- (void) setupCoreDataStackWithAutoMigratingSqliteStoreNamed:(NSString *)storeName;

#pragma mark - Account

#pragma mark - Contacts

#pragma mark - Currency

#pragma mark - Merchant

#pragma mark - Transaction

#pragma mark - TransactionType

@end
