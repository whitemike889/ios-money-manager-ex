//
//  MainMgr.m
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/3.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "MainMgr.h"
#import "LoginAccountMgr.h"
#import "AccountMgr.h"

@interface MainMgr()

@property (nonatomic, strong) id<ILoginAccountMgr> loginAccountMgr;
@property (nonatomic, strong) id<IAccountMgr> accountMgr;

@end

@implementation MainMgr

- (instancetype)init
{
    if (self = [super init]) {
//        [self getLoginAccountMgr];
    }
    
    return self;
}

- (id<ILoginAccountMgr>) getLoginAccountMgr
{
    if (!_loginAccountMgr) {
        _loginAccountMgr = [[LoginAccountMgr alloc] init];
    }
    
    return _loginAccountMgr;
}

- (id<IAccountMgr>)getAccountMgr
{
    if (!_accountMgr) {
        _accountMgr = [[AccountMgr alloc] init];
    }
    
    return _accountMgr;
}

@end
