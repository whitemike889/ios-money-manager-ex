//
//  TransactionTypeModel.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/9.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransactionTypeModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *nameLetter;
@property (nonatomic, strong) NSNumber *isRoot;
@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, strong) NSDate *createTime;
@property (nonatomic, strong) NSArray *childs;
@property (nonatomic, strong) TransactionTypeModel *parent;

@end
