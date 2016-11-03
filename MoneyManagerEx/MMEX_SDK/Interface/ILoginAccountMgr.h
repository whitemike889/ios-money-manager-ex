//
//  ILoginAccountMgr.h
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/3.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IBaseMgr.h"

@class LoginInfoModel;
@class UIImage;

@protocol ILoginAccountMgr <IBaseMgr>

@optional

@property (nonatomic, strong) LoginInfoModel *loginInfo;

- (void)updateLoginUserName:(NSString *)name;

- (void)updateLoginUserAvatar:(NSString *)avatar;

// test... tmp
- (void)updateLoginUserAvatarImg:(UIImage *)avatarImg;

@end
