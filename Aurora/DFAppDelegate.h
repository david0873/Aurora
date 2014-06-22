//
//  DFAppDelegate.h
//  Aurora
//
//  Created by David on 14-3-26.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) NSMutableArray *PagesArray;

- (void)createPages;

@end
