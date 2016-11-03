//
//  LoginAccountMgr.m
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/3.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "LoginAccountMgr.h"
#import "UserInfoModel.h"

@implementation LoginAccountMgr

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    
    return self;
}

- (LoginInfoModel *)loginInfo
{
    if (!_loginInfo) {
        _loginInfo = [[LoginInfoModel alloc] init];
        _loginInfo.user = [[UserInfoModel alloc] init];
        _loginInfo.user.name = @"嘻哈小混混3";
    }
    
    return _loginInfo;
}

- (void)updateLoginUserName:(NSString *)name
{
    self.loginInfo.user.name = name;
}

- (void)updateLoginUserAvatar:(NSString *)avatar
{
    self.loginInfo.user.avatar = avatar;
}

// test... tmp
- (void)updateLoginUserAvatarImg:(UIImage *)avatarImg
{
    self.loginInfo.user.avatarImg = avatarImg;
}

@end
