//
//  BaseManagedObject.m
//  MoneyManagerEx
//
//  Created by taotao on 16/7/5.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "BaseManagedObject.h"

@implementation BaseManagedObject

// insert object
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_
{
    NSParameterAssert(moc_);
    return [NSEntityDescription
            insertNewObjectForEntityForName:[self entityName]
            inManagedObjectContext:moc_];
}

// entity description;
+ (NSEntityDescription*)entityDesInManagedObjectContext:(NSManagedObjectContext*)moc_
{
    NSParameterAssert(moc_);
    return [NSEntityDescription entityForName:[self entityName] inManagedObjectContext:moc_];
}

// entity name
+ (NSString*)entityName
{
    return nil;
}

// managed object ID
- (NSManagedObjectID *)objectID
{
    return [super objectID];
}

@end
