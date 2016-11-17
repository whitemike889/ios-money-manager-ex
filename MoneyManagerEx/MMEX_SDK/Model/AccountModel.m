//
//  AccountModel.m
//  MoneyManagerEx
//
//  Created by taotao on 16/7/9.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "AccountModel.h"
#import "MerchantModel.h"

@implementation AccountModel

- (MerchantModel *)merchant
{
    if (!_merchant) {
        _merchant = [[MerchantModel alloc] init];
    }
    
    return _merchant;
}

@end
