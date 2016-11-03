//
//  MainMgr.h
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/3.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILoginAccountMgr.h"

@interface MainMgr : NSObject

- (id<ILoginAccountMgr>) getLoginAccountMgr;

@end
