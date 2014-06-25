//
//  WLTabBarItem.h
//  Aurora
//
//  Created by liwang on 14-6-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLTabBarItemDelegate.h"

@interface WLTabBarItem : UIView

@property(nonatomic)NSInteger itemID;
@property(nonatomic, weak)id<WLTabBarItemDelegate> delegate;

- (id)initWithFrame:(CGRect)frame
                 aId:(NSInteger)aId
           delegate:(id<WLTabBarItemDelegate>)aDelegate
              title:(NSString *)title
              image:(UIImage *)image;

- (void)deSelect;

- (void)select;

@end
