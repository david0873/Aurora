//
//  WLBasePage.h
//  Aurora
//
//  Created by liwang on 14-6-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol WLPageDelegate <NSObject>

- (void)willShowPageAtIndex:(NSInteger)index;

@end

@interface WLBasePage : UIViewController

@property(nonatomic)NSInteger pageIndex;

@end
