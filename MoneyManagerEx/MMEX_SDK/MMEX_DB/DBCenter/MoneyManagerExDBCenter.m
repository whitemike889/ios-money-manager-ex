//
//  MoneyManagerExDBCenter.m
//  MoneyManagerEx
//
//  Created by taotao on 16/7/5.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "MoneyManagerExDBCenter.h"
#import <CoreData/CoreData.h>
#import "LoginRecord.h"
#import "Account.h"
#import "Transaction.h"
#import "Currency.h"
#import "Transaction.h"
#import "UserInfo.h"
#import "Contacts.h"
#import "Merchant.h"


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

#pragma mark - LoginRecord

- (void)saveLoginInfo:(LoginInfoModel *)loginInfo
{
    if (nil == loginInfo || nil == loginInfo.account) {
        return;
    }
    
    LoginRecord *loginRecord = [self _getLoginInfoByAccount:loginInfo.account inMoc:self.mainManagedObjectContext];
    if (nil == loginRecord) {
        loginRecord = [LoginRecord insertInManagedObjectContext:self.mainManagedObjectContext];
    }
    
    loginRecord.account = loginInfo.account;
    loginRecord.password = loginInfo.password ? loginInfo.password : loginRecord.password;
    loginRecord.token = loginInfo.token ? loginInfo.token : loginRecord.token;
    loginRecord.logintime = loginInfo.logintime ? loginInfo.logintime : loginRecord.logintime;
    if (loginInfo.user && loginInfo.user.uid) {
        if (nil == loginRecord.user) {
            loginRecord.user = [UserInfo insertInManagedObjectContext:self.mainManagedObjectContext];
        }
        loginRecord.user.uid = loginInfo.user.uid;
        loginRecord.user.name = loginInfo.user.name ? loginInfo.user.name : loginRecord.user.name;
        loginRecord.user.gender = loginInfo.user.gender ? loginInfo.user.gender : loginRecord.user.gender;
        loginRecord.user.avatar = loginInfo.user.avatar ? loginInfo.user.avatar : loginRecord.user.avatar;
        loginRecord.user.email = loginInfo.user.email ? loginInfo.user.email : loginRecord.user.email;
        loginRecord.user.mobile = loginInfo.user.mobile ? loginInfo.user.mobile : loginRecord.user.mobile;
        loginRecord.user.identification = loginInfo.user.identification ? loginInfo.user.identification : loginRecord.user.identification;
        loginRecord.user.district = loginInfo.user.district ? loginInfo.user.district : loginRecord.user.district;
        loginRecord.user.sign = loginInfo.user.sign ? loginInfo.user.sign : loginRecord.user.sign;
    }
    NSString *__weak str = @"13324";
    str = @"456";
    __weak NSString *str2 = @"5566";
    str2 = @"000";
}

- (LoginRecord *)_getLoginInfoByAccount:(NSString *)account
                         inMoc:(NSManagedObjectContext *)moc
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"account == %@", account];
    NSEntityDescription *loginDes = [LoginRecord entityDesInManagedObjectContext:moc];
    NSArray *result = [self fetchRequest:loginDes predicate:predicate sort:nil fetchLimit:1 inMoc:moc];
    
    return result.firstObject;
}

#pragma mark - UserInfo

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

#pragma mark - private common method

- (NSURL *)DocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSArray *)fetchRequest:(NSEntityDescription *)entity
                predicate:(NSPredicate *)predicate
                     sort:(NSSortDescriptor *)sort
               fetchLimit:(NSInteger)fetchLimit
                    inMoc:(NSManagedObjectContext *)moc
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    if (predicate) {
        [fetchRequest setPredicate:predicate];
    }
    if (sort) {
        [fetchRequest setSortDescriptors:@[sort]];
    }
    if (fetchLimit) {
        [fetchRequest setFetchLimit:fetchLimit];
    }
    [fetchRequest setIncludesPendingChanges:YES];
    
    return [moc executeFetchRequest:fetchRequest error:nil];
}

@end
