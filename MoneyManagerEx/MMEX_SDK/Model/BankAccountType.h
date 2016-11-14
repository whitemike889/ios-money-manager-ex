//
//  BankAccountType.h
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/14.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, BankAccountTypeEnum)
{
    BankAccountType_None = 0,
    BankAccountType_Cash = 1,
    BankAccountType_Checking = 2,
    BankAccountType_Investment = 3,
    BankAccountType_Term = 4,
    BankAccountType_Credit_Card = 5
};

@interface BankAccountType : NSObject

+ (instancetype)shareInstance;

- (NSString *)typeNameOfIndex:(BankAccountTypeEnum)typeIndex;

- (NSInteger)indexOfTypeName:(NSString *)typeName;

- (NSArray *)getAllTypeName;

@end
