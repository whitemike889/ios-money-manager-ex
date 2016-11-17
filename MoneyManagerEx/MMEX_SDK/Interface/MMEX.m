//
//  MMEX.m
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/4.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "MMEX.h"
#import "MainMgr.h"

static MainMgr *mainMgr = nil;

@implementation MMEX

+ (void)initializeAllManager
{
    if (!mainMgr) {
        mainMgr = [[MainMgr alloc] init];
    }
}

+ (id<ILoginAccountMgr>)getLoginAccountMgr
{
    return [mainMgr getLoginAccountMgr];
}

+ (id<IAccountMgr>)getAccountMgr
{
    return [mainMgr getAccountMgr];
}

@end
