//
//  DFGlobalVar.h
//  Aurora
//
//  Created by David on 14-4-3.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DFGlobalVar : NSObject{
    NSString * userName;
}
@property(strong,nonatomic)NSString * userName;
+(DFGlobalVar *)sharedGlobalVar;

@end
