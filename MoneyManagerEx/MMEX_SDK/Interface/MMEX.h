//
//  MMEX.h
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/4.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILoginAccountMgr.h"
#import "IAccountMgr.h"

@interface MMEX : NSObject

+ (void)initializeAllManager;

+ (id<ILoginAccountMgr>)getLoginAccountMgr;

+ (id<IAccountMgr>)getAccountMgr;

@end
