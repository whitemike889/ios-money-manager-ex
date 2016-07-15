//
//  CurrencyModel.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/9.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrencyModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *unitName;
@property (nonatomic, strong) NSString *symbol;
@property (nonatomic, strong) NSString *thousandSymbol;
@property (nonatomic, strong) NSNumber *convert;
@property (nonatomic, strong) NSString *prefixSymbol;
@property (nonatomic, strong) NSString *suffixSymbol;
@property (nonatomic, strong) NSNumber *proportion;
@property (nonatomic, strong) NSString *radixPoint;
@property (nonatomic, strong) NSString *unit1_100;
@property (nonatomic, strong) NSDate *createTime;
@property (nonatomic, strong) NSDate *modifyTime;
@property (nonatomic, strong) NSString *nameLetter;

@end
