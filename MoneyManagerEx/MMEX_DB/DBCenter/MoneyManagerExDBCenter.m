//
//  MoneyManagerExDBCenter.m
//  MoneyManagerEx
//
//  Created by taotao on 16/7/5.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "MoneyManagerExDBCenter.h"
#import <CoreData/CoreData.h>


static MoneyManagerExDBCenter *singletonDBCenter = nil;

@interface MoneyManagerExDBCenter ()

@property (nonatomic, strong) NSManagedObjectContext *mainQueueContext;
@property (nonatomic, strong) NSManagedObjectContext *backgroundQueueContext;

@end

@implementation MoneyManagerExDBCenter

+ (instancetype)shareInstance
{
    if (singletonDBCenter == nil) {
        singletonDBCenter = [[MoneyManagerExDBCenter alloc] init];
    }
    
    return singletonDBCenter;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (singletonDBCenter == nil) {
        return [super allocWithZone:zone];
    }
    
    return singletonDBCenter;
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return self;
}

#pragma mark - setup core data

- (void) setupCoreDataStackWithStoreNamed:(NSString *)storeName
{
    // object model
    NSURL *modelURL = [[NSBundle mainBundle]
                       URLForResource:@"MoneyManagerEx"
                       withExtension:@"xcdatamodeld"];
    
    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSAssert(mom != nil, @"Error initializing Managed Object Model");
    
    // persistent store
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    
    
    // context
    _mainQueueContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_mainQueueContext setPersistentStoreCoordinator:psc];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"MoneyManagerEx.sqlite"];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        NSError *error = nil;
        NSPersistentStoreCoordinator *psc = [_backgroundQueueContext persistentStoreCoordinator];
//        NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error];
//        NSAssert(store != nil, @"Error initializing PSC: %@\n%@", [error localizedDescription], [error userInfo]);
    });
}

- (void) setupCoreDataStackWithAutoMigratingSqliteStoreNamed:(NSString *)storeName
{
    
}

#pragma mark - Account

#pragma mark - Contacts

#pragma mark - Currency

#pragma mark - Merchant

#pragma mark - Transaction

#pragma mark - TransactionType

@end
