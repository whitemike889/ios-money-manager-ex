//
//  BankAccountType.m
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/14.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "BankAccountType.h"
#import "NSArray+EnumExtension.h"

static BankAccountType *singleInstance = nil;

@interface BankAccountType()

@property (nonatomic, strong) NSMutableArray *typesName;

@end

@implementation BankAccountType

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleInstance = [[BankAccountType alloc] init];
    });

    return singleInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (nil == singleInstance) {
        return [super allocWithZone:zone];
    }
    
    return singleInstance;
}

- (instancetype)copy
{
    return self;
}

- (instancetype)init
{
    if (self = [super init]) {
        _typesName = [[NSMutableArray alloc] initWithObjects:NSLocalizedString(@"none", nil),NSLocalizedString(@"Cash", nil), NSLocalizedString(@"Checking", nil), NSLocalizedString(@"Investment", nil), NSLocalizedString(@"Term", nil), NSLocalizedString(@"Credit Card", nil), nil];
    }
    
    return self;
}

- (NSString *)typeNameOfIndex:(BankAccountTypeEnum)typeIndex
{
    return _typesName[typeIndex];
}

- (NSInteger)indexOfTypeName:(NSString *)typeName
{
    return [_typesName indexOfObject:typeName];
}

- (NSArray *)getAllTypeName
{
    return _typesName;
}

@end
