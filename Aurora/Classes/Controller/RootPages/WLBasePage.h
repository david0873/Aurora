//
//  WLBasePage.h
//  Aurora
//
//  Created by liwang on 14-6-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLUtils.h"
#import "WLDataManager.h"
#import "WLNavigationControlller.h"
#import "WLTabBar.h"

@protocol WLPageDelegate <NSObject>

- (void)willShowPageAtIndex:(NSInteger)index;

@end

@interface WLBasePage : UIViewController<WLTabBarDelegate>
@property(nonatomic, strong)WLTabBar *tabBar;
@property(nonatomic)NSInteger pageIndex;
@property(nonatomic, strong)UIScrollView *contentScrollView;

@end
