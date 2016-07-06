//
//  UserInfo.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/6.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseManagedObject.h"

@class Account, Contacts, LoginRecord, Transaction;

NS_ASSUME_NONNULL_BEGIN

@interface UserInfo : BaseManagedObject

// Insert code here to declare functionality of your managed object subclass
+ (NSString*)entityName;

@end

NS_ASSUME_NONNULL_END

#import "UserInfo+CoreDataProperties.h"
