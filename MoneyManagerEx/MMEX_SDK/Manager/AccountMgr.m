//
//  AccountMgr.m
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/15.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "AccountMgr.h"

@implementation AccountMgr

- (AccountModel *)createBankAccount:(NSString *)name type:(BankAccountTypeEnum)type
{
    return nil;
}

- (BOOL)deleteBankAccountByName:(NSString *)name
{
    return nil;
}

- (BOOL)updateBankAccountName:(NSString *)name byOldName:(NSString *)oldName
{
    return NO;
}

- (BOOL)updateBankAccountType:(BankAccountTypeEnum)type byName:(NSString *)name
{
    return NO;
}

- (BOOL)updateBankAccountInitialBalance:(NSNumber *)initialBalance byName:(NSString *)name
{
    return NO;
}

- (BOOL)updateBankAccountStatus:(BOOL)status byName:(NSString *)name
{
    return NO;
}

- (BOOL)updateBankAccountFavorite:(BOOL)favorite byName:(NSString *)name
{
    return NO;
}

//- (BOOL)updateBankAccountCurrencyType:()status byName:(NSString *)name;

- (BOOL)updateBankAccountNumber:(NSString *)number byName:(NSString *)name
{
    return NO;
}

- (BOOL)updateBankAccountMerchantName:(NSString *)merchantName byName:(NSString *)name
{
    return NO;
}

- (BOOL)updateBankAccountMerchantWebsite:(NSString *)website byName:(NSString *)name
{
    return NO;
}

- (BOOL)updateBankAccountMerchantTel:(NSString *)tel byName:(NSString *)name
{
    return NO;
}

- (BOOL)updateBankAccountMerchantLoginInfo:(NSString *)loginInfo byName:(NSString *)name
{
    return NO;
}

- (BOOL)updateBankAccountNote:(NSString *)note byName:(NSString *)name
{
    return NO;
}

@end
