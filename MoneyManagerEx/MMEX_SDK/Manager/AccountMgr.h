//
//  AccountMgr.h
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/15.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "BaseMgr.h"
#import "BankAccountType.h"

@class AccountModel;
@class MerchantModel;

@interface AccountMgr : BaseMgr

- (AccountModel *)createBankAccount:(NSString *)name type:(BankAccountTypeEnum)type;

- (BOOL)deleteBankAccountByName:(NSString *)name;

- (BOOL)updateBankAccountName:(NSString *)name byOldName:(NSString *)oldName;

- (BOOL)updateBankAccountType:(BankAccountTypeEnum)type byName:(NSString *)name;

- (BOOL)updateBankAccountInitialBalance:(NSNumber *)initialBalance byName:(NSString *)name;

- (BOOL)updateBankAccountStatus:(BOOL)status byName:(NSString *)name;

- (BOOL)updateBankAccountFavorite:(BOOL)favorite byName:(NSString *)name;

//- (BOOL)updateBankAccountCurrencyType:()status byName:(NSString *)name;

- (BOOL)updateBankAccountNumber:(NSString *)number byName:(NSString *)name;

- (BOOL)updateBankAccountMerchantName:(NSString *)merchantName byName:(NSString *)name;

- (BOOL)updateBankAccountMerchantWebsite:(NSString *)website byName:(NSString *)name;

- (BOOL)updateBankAccountMerchantTel:(NSString *)tel byName:(NSString *)name;

- (BOOL)updateBankAccountMerchantLoginInfo:(NSString *)loginInfo byName:(NSString *)name;

- (BOOL)updateBankAccountNote:(NSString *)note byName:(NSString *)name;

@end
