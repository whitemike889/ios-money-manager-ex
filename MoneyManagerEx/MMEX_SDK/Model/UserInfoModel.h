//
//  UserInfoModel.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/9.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UserInfoModel : NSObject

@property (nonatomic, strong) NSNumber *uid;
@property (nonatomic, strong) NSString *name;
//@property (nonatomic, strong) NSString *trueName;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSNumber *gender;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *district;
@property (nonatomic, strong) NSString *sign;
@property (nonatomic, strong) NSNumber *birthday;
@property (nonatomic, strong) NSString *identification;
@property (nonatomic, strong) NSString *letter;

// tmp test
@property (nonatomic, strong) UIImage *avatarImg;

@end
