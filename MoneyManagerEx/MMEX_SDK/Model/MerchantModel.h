//
//  MerchantModel.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/9.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MerchantModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *number;
@property (nonatomic, strong) NSString *note;
@property (nonatomic, strong) NSString *webSite;
@property (nonatomic, strong) NSString *loginInfo;
@property (nonatomic, strong) NSString *telphone;
@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, strong) NSDate *createTime;
@property (nonatomic, strong) NSDate *modifyTime;
@property (nonatomic, strong) NSString *nameLetter;

@end
