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
#import "WLDataManager.h"
#import "WLNavigationBar.h"

@implementation DFAppDelegate
@synthesize PagesArray;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self createPages];
    
    self.window.rootViewController = [[WLDataManager instance].mainPagesArray objectAtIndex:0];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)createPages
{
    [WLDataManager instance].mainPagesArray = [NSMutableArray array];
    
    
    WLNavigationControlller *page1 = [[WLNavigationControlller alloc] initWithNavigationBarClass:[WLNavigationBar class] toolbarClass:nil];
    page1.viewControllers = [NSArray arrayWithObject:[[WLFirstPage alloc] init]];
    [[WLDataManager instance].mainPagesArray addObject:page1];
    
    WLNavigationControlller *page2 = [[WLNavigationControlller alloc] initWithNavigationBarClass:[WLNavigationBar class] toolbarClass:nil];
    page2.viewControllers = [NSArray arrayWithObject:[[WLSecondPage alloc] init]];
    [[WLDataManager instance].mainPagesArray addObject:page2];
    
    WLNavigationControlller *page3 = [[WLNavigationControlller alloc] initWithNavigationBarClass:[WLNavigationBar class] toolbarClass:nil];
    page3.viewControllers = [NSArray arrayWithObject:[[WLThirdPage alloc] init]];
    [[WLDataManager instance].mainPagesArray addObject:page3];
    
    WLNavigationControlller *page4 = [[WLNavigationControlller alloc] initWithNavigationBarClass:[WLNavigationBar class] toolbarClass:nil];
    page4.viewControllers = [NSArray arrayWithObject:[[WLFourthPage alloc] init]];
    [[WLDataManager instance].mainPagesArray addObject:page4];
    
    // load storyboard
    [WLDataManager instance].mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
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
