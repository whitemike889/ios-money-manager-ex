//
//  MoneyManagerExDBCenter.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/5.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginInfoModel.h"
#import "UserInfoModel.h"

@interface MoneyManagerExDBCenter : NSObject

+ (instancetype)shareInstance;

#pragma mark - LoginRecord

- (void)saveLoginInfo:(LoginInfoModel *)loginInfo;

#pragma mark - UserInfo

#pragma mark - Account

// 增删改查
//- (void)addAccount:();

#pragma mark - Contacts

#pragma mark - Currency

#pragma mark - Merchant

#pragma mark - Transaction

#pragma mark - TransactionType

@end
