//
//  LoginAccountMgr.h
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/3.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseMgr.h"
#import "ILoginAccountMgr.h"
#import "LoginInfoModel.h"
#import <UIKit/UIKit.h>

@interface LoginAccountMgr : BaseMgr<ILoginAccountMgr>

@property (nonatomic, strong) LoginInfoModel *loginInfo;

- (void)updateLoginUserName:(NSString *)name;

- (void)updateLoginUserAvatar:(NSString *)avatar;

// test... tmp
- (void)updateLoginUserAvatarImg:(UIImage *)avatarImg;

@end
