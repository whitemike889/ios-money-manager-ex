//
//  TransactionModel.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/9.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TransactionTypeModel;
@class ContactModel;
@class AccountModel;

@interface TransactionModel : NSObject

@property (nonatomic, strong) NSNumber *tid;
@property (nonatomic, strong) NSNumber *money;
@property (nonatomic, strong) TransactionTypeModel *transactionType;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *note;
@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, strong) AccountModel *account;
@property (nonatomic, strong) ContactModel *payee;
@property (nonatomic, strong) NSDate *createTime;
@property (nonatomic, strong) NSDate *modifyTime;

@end
