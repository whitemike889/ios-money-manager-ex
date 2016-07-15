//
//  BaseManagedObject.h
//  MoneyManagerEx
//
//  Created by taotao on 16/7/5.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface BaseManagedObject : NSManagedObject

// insert object
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;

// entity description;
+ (NSEntityDescription*)entityDesInManagedObjectContext:(NSManagedObjectContext*)moc_;

// managed object ID
- (NSManagedObjectID *)objectID;

// entity name
+ (NSString*)entityName;

@end
