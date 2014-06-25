//
//  WLTabBar.h
//  Aurora
//
//  Created by liwang on 14-6-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLTabBarItem.h"
#import "WLTabBarDelegate.h"
#import "WLTabBarItemDelegate.h"

#define kTabBarHeight 49



@interface WLTabBar : UIView <WLTabBarItemDelegate>
@property(nonatomic, weak)id<WLTabBarDelegate> delegate;
@property(nonatomic)NSInteger curItemID;
@property(nonatomic, strong)NSMutableArray *items;

- (id)initWithFrame:(CGRect)frame delegate:(id<WLTabBarDelegate>)aDelegate;

- (void)selectItem:(NSInteger)itemID;

@end
