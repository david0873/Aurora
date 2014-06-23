//
//  WLDataManager.h
//  Aurora
//
//  Created by liwang on 14-6-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLDataManager : NSObject
@property(nonatomic, strong)NSMutableArray *mainPagesArray;

+ (WLDataManager*)instance;
+ (void)destory;

@end
