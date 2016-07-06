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

@property (nonatomic, strong) NSManagedObjectModel            *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator    *persistentStoreCoordinator;

@property (nonatomic, strong) NSManagedObjectContext *mainManagedObjectContext;
@property (nonatomic, strong) NSManagedObjectContext *backgroundManagedObjectContext;

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

- (NSManagedObjectContext *)mainManagedObjectContext
{
    if (_mainManagedObjectContext != nil) {
        return _mainManagedObjectContext;
    }
    
    NSPersistentStoreCoordinator *persistentStoreCoordinator = [self persistentStoreCoordinator];
    if (persistentStoreCoordinator != nil) {
        _mainManagedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_mainManagedObjectContext setPersistentStoreCoordinator:[self persistentStoreCoordinator]];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(mergeChanges:)
                                                 name:NSManagedObjectContextDidSaveNotification
                                               object:nil];
    _mainManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy;
    
    return _mainManagedObjectContext;
}

- (NSManagedObjectContext *)backgroundManagedObjectContext
{
    if (_backgroundManagedObjectContext) {
        return _backgroundManagedObjectContext;
    }
    
    _backgroundManagedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    [_backgroundManagedObjectContext setPersistentStoreCoordinator:[self persistentStoreCoordinator]];
    
    return _backgroundManagedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"MoneyManagerEx" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self DocumentsDirectory] URLByAppendingPathComponent:@"MoneyManagerEx.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        MMEXLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Account

#pragma mark - Contacts

#pragma mark - Currency

#pragma mark - Merchant

#pragma mark - Transaction

#pragma mark - TransactionType

#pragma mark - save

- (void)mergeChanges:(NSNotification *)notification {
    if (notification.object != self.mainManagedObjectContext) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.mainManagedObjectContext mergeChangesFromContextDidSaveNotification:notification];
        });
    }
}

#pragma mark - private method

- (NSURL *)DocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
