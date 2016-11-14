//
//  LoginRecord+CoreDataProperties.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/6.
//  Copyright © 2016年 taotao. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "LoginRecord.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginRecord (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *account;
@property (nullable, nonatomic, retain) NSDate *logintime;
@property (nullable, nonatomic, retain) NSString *password;
@property (nullable, nonatomic, retain) NSString *token;
@property (nullable, nonatomic, retain) UserInfo *user;
@property (nullable, nonatomic, retain) Account *defaultBankAccount;

@end

NS_ASSUME_NONNULL_END
