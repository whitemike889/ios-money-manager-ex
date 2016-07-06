//
//  TransactionType+CoreDataProperties.m
//  MoneyManagerEx
//
//  Created by taotao on 16/7/6.
//  Copyright © 2016年 taotao. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TransactionType+CoreDataProperties.h"

@implementation TransactionType (CoreDataProperties)

@dynamic tt_create_time;
@dynamic tt_name;
@dynamic tt_name_letter;
@dynamic tt_root_type;
@dynamic tt_status;
@dynamic childs;
@dynamic parent;
@dynamic transactions;

@end
