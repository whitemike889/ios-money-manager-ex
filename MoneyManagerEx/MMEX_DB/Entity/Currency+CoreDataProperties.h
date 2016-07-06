//
//  Currency+CoreDataProperties.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/6.
//  Copyright © 2016年 taotao. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Currency.h"

NS_ASSUME_NONNULL_BEGIN

@interface Currency (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *cur_1_100_unit;
@property (nullable, nonatomic, retain) NSNumber *cur_convert;
@property (nullable, nonatomic, retain) NSDate *cur_create_time;
@property (nullable, nonatomic, retain) NSDate *cur_modify_time;
@property (nullable, nonatomic, retain) NSString *cur_name;
@property (nullable, nonatomic, retain) NSString *cur_name_letter;
@property (nullable, nonatomic, retain) NSString *cur_prefix_symbol;
@property (nullable, nonatomic, retain) NSNumber *cur_proportion;
@property (nullable, nonatomic, retain) NSString *cur_radix_point;
@property (nullable, nonatomic, retain) NSString *cur_suffix_symbol;
@property (nullable, nonatomic, retain) NSString *cur_symbol;
@property (nullable, nonatomic, retain) NSString *cur_thousand_symbol;
@property (nullable, nonatomic, retain) NSString *cur_unit_name;
@property (nullable, nonatomic, retain) Account *account;

@end

NS_ASSUME_NONNULL_END
