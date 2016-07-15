//
//  ContactModel.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/9.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserInfoModel;

@interface ContactModel : NSObject

@property (nonatomic, strong) NSString *contact_remark;
@property (nonatomic, strong) NSNumber *contact_staus;
@property (nonatomic, strong) UserInfoModel *contactInfo;

@end
