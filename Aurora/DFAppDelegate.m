//
//  DFAppDelegate.m
//  Aurora
//
//  Created by David on 14-3-26.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFAppDelegate.h"
#import "WLRootViewController.h"
//
#import "WLNavigationControlller.h"
#import "WLFirstPage.h"
#import "WLSecondPage.h"
#import "WLThirdPage.h"
#import "WLFourthPage.h"

@implementation DFAppDelegate
@synthesize PagesArray;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
//    self.window = [[UIWindow alloc] init];
//    [self createPages];
//    
//    self.window.rootViewController = [self.PagesArray objectAtIndex:0];
//    [self.window makeKeyAndVisible];
//    
//    
    
    return YES;
}

- (void)createPages
{
    self.PagesArray = [NSMutableArray array];
    
    WLNavigationControlller *page1 = [[WLNavigationControlller alloc] initWithRootViewController:[[WLFirstPage alloc] init]];
    [self.PagesArray addObject:page1];
    
    WLNavigationControlller *page2 = [[WLNavigationControlller alloc] initWithRootViewController:[[WLSecondPage alloc] init]];
    
    [self.PagesArray addObject:page2];
    
    WLNavigationControlller *page3 = [[WLNavigationControlller alloc] initWithRootViewController:[[WLThirdPage alloc] init]];
    [self.PagesArray addObject:page3];
    
    WLNavigationControlller *page4 = [[WLNavigationControlller alloc] initWithRootViewController:[[WLFourthPage alloc] init]];
    [self.PagesArray addObject:page4];
    
    
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
