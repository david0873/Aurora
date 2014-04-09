//
//  DFGlobalVar.m
//  Aurora
//
//  Created by David on 14-4-3.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFGlobalVar.h"

@implementation DFGlobalVar

@synthesize user;

+(DFGlobalVar *)sharedGlobalVar{
    static DFGlobalVar * globalVar;
    @synchronized(self){//线程锁,防止数据被多线程操作
        if (!globalVar) {
            globalVar=[[DFGlobalVar alloc]init];
        }
        return globalVar;
    }
}

-(id)init{
    if (self=[super init]) {
        user=nil;
    }
    return self;
}

@end
