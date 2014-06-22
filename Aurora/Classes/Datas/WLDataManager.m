//
//  WLDataManager.m
//  Aurora
//
//  Created by liwang on 14-6-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "WLDataManager.h"

static WLDataManager* gInstance = nil;

@implementation WLDataManager
@synthesize mainPagesArray;

+ (WLDataManager*)instance
{
    if (gInstance == nil) {
        gInstance = [[WLDataManager alloc] init];
    }
    
    return gInstance;
}

+ (void)destory
{
    if (gInstance) {
        gInstance = nil;
    }
}

@end
