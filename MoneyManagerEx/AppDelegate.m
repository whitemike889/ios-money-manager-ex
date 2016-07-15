//
//  AppDelegate.m
//  MoneyManagerEx
//
//  Created by taotao on 15/11/1.
//  Copyright © 2015年 taotao. All rights reserved.
//

#import "AppDelegate.h"
#import "UserDefaultKeyDefine.h"
//#import "MMEXCreateFirstAccountGuideViewController.h"
#import "MMEXStartPageViewController.h"
#import "MMEXMyAccountViewController.h"
#import "MMEXContactsViewController.h"
#import "MMEXAddTransactionViewController.h"
#import "MMEXAssetsViewController.h"
#import "KeyboardManager.h"
#import "MoneyManagerExDBCenter.h"
#import "StringUtility.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    NSNumber *firstStart = [[NSUserDefaults standardUserDefaults] objectForKey:MMEX_APP_FIRST_START];
    //firstStart = [NSNumber numberWithBool:YES];
    if ([firstStart boolValue]) {
        [self showGuidePage];
    }
    else {
        [self showHomePage];
    }
    
    [self.window makeKeyAndVisible];
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - start app show pages
- (void)showGuidePage
{
    MMEXStartPageViewController *startPage = [[MMEXStartPageViewController alloc] initWithNibName:@"MMEXStartPageViewController" bundle:nil];

    self.window.rootViewController = startPage;
}

- (void)showHomePage
{
    // 1. create UITabBarController
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    // 2. set to window rootViewController
    [self _setNewRootViewController:tabBarController];
    
    // 3. add new controller to tabBarController
    MMEXAssetsViewController *assetsPage = [[MMEXAssetsViewController alloc] initWithNibName:@"MMEXAssetsViewController" bundle:nil];
    UINavigationController *navAssets = [[UINavigationController alloc] initWithRootViewController:assetsPage];
    navAssets.tabBarItem.title = NSLocalizedString(@"Assets Summary", nil);
    
    MMEXContactsViewController *contactsPage = [[MMEXContactsViewController alloc] initWithNibName:@"MMEXContactsViewController" bundle:nil];
    UINavigationController *navContacts = [[UINavigationController alloc] initWithRootViewController:contactsPage];
    navContacts.tabBarItem.title = NSLocalizedString(@"Contacts", nil);
    /*
    MMEXAddTransactionViewController *addTransactionPage = [[MMEXAddTransactionViewController alloc] initWithNibName:@"MMEXAddTransactionViewController" bundle:nil];
    UINavigationController *navAddTransaction = [[UINavigationController alloc] initWithRootViewController:addTransactionPage];
    navAddTransaction.tabBarItem.title = NSLocalizedString(@"Add Transaction", nil);
    */
    MMEXMyAccountViewController *myAccountPage = [[MMEXMyAccountViewController alloc] initWithNibName:@"MMEXMyAccountViewController" bundle:nil];
    UINavigationController *navMyAccount = [[UINavigationController alloc] initWithRootViewController:myAccountPage];
    navMyAccount.tabBarItem.title = NSLocalizedString(@"My Account", nil);
//    navMyAccount.tabBarItem.image = [UIImage imageNamed:@""];
    
    tabBarController.viewControllers = @[navAssets, navContacts, navMyAccount];
    [tabBarController setSelectedIndex:0];
    
}


#pragma mark - private method

- (void)_setNewRootViewController:(UIViewController *)newViewController
{
    UIViewController *previousVC = self.window.rootViewController;
    
    self.window.rootViewController = newViewController;
    
    if (previousVC) {
        [previousVC dismissViewControllerAnimated:NO completion:^{
            [previousVC.view removeFromSuperview];
        }];
    }
}

@end
