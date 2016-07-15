//
//  AccountModel.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/9.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MerchantModel;
@class CurrencyModel;

@interface AccountModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *number;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, strong) NSNumber *initialCapital;
@property (nonatomic, strong) NSString *note;
@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, strong) NSDate *createTime;
@property (nonatomic, strong) NSDate *modifyTime;
@property (nonatomic, strong) CurrencyModel *currency;
@property (nonatomic, strong) MerchantModel *merchant;

@end
