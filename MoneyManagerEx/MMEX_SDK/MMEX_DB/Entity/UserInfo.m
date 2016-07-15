//
//  UserInfo.m
//  MoneyManagerEx
//
//  Created by taotao on 16/7/6.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "UserInfo.h"
#import "Account.h"
#import "Contacts.h"
#import "LoginRecord.h"
#import "Transaction.h"
#import "StringUtility.h"

@interface UserInfo()

@property (nonatomic, retain) NSString *primitiveName;

@end

@implementation UserInfo
@dynamic primitiveName;

// Insert code here to add functionality to your managed object subclass
+ (NSString*)entityName
{
    return @"UserInfo";
}

- (void)setName:(NSString *)name
{
    [self willChangeValueForKey:@"name"];
    [self setPrimitiveName:name];
    [self didChangeValueForKey:@"name"];
    
    // 如果备注名为空，修改为名字拼音
    if (self.name.length > 0) {
        self.letter = [StringUtility getPinYinFromString:name];
    }
}

@end
