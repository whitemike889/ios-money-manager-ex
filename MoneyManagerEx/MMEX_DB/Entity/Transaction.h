//
//  Transaction.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/6.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseManagedObject.h"

@class Account, Contacts, TransactionType, UserInfo;

NS_ASSUME_NONNULL_BEGIN

@interface Transaction : BaseManagedObject

// Insert code here to declare functionality of your managed object subclass
+ (NSString*)entityName;

@end

NS_ASSUME_NONNULL_END

#import "Transaction+CoreDataProperties.h"
