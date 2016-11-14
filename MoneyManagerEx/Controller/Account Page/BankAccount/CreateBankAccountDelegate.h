//
//  CreateBankAccountDelegate.h
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/14.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AccountModel;

@protocol CreateBankAccountDelegate <NSObject>

- (void)didCreateBankAccount:(AccountModel *)account;

@end
