//
//  Merchant+CoreDataProperties.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/6.
//  Copyright © 2016年 taotao. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Merchant.h"

NS_ASSUME_NONNULL_BEGIN

@interface Merchant (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *mer_create_time;
@property (nullable, nonatomic, retain) NSString *mer_login_info;
@property (nullable, nonatomic, retain) NSDate *mer_modify_time;
@property (nullable, nonatomic, retain) NSString *mer_name;
@property (nullable, nonatomic, retain) NSString *mer_name_letter;
@property (nullable, nonatomic, retain) NSString *mer_number;
@property (nullable, nonatomic, retain) NSString *mer_note;
@property (nullable, nonatomic, retain) NSNumber *mer_status;
@property (nullable, nonatomic, retain) NSNumber *mer_telphone;
@property (nullable, nonatomic, retain) NSString *mer_web_site;
@property (nullable, nonatomic, retain) Account *accounts;

@end

NS_ASSUME_NONNULL_END
