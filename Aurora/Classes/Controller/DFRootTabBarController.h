//
//  DFRootTabBarController.h
//  Aurora
//
//  Created by David on 14-4-2.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFRootTabBarController : UITabBarController<UITabBarControllerDelegate>{
    //最近一次选择的Index
    NSUInteger _lastSelectedIndex;
}

@property(readonly, nonatomic) NSUInteger lastSelectedIndex;

@end
