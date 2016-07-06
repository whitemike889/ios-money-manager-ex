//
//  Transaction+CoreDataProperties.m
//  MoneyManagerEx
//
//  Created by taotao on 16/7/6.
//  Copyright © 2016年 taotao. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Transaction+CoreDataProperties.h"

@implementation Transaction (CoreDataProperties)

@dynamic trans_create_time;
@dynamic trans_date;
@dynamic trans_id;
@dynamic trans_modify_time;
@dynamic trans_money;
@dynamic trans_note;
@dynamic trans_status;
@dynamic account;
@dynamic payee;
@dynamic transaction_type;
@dynamic user;

@end
