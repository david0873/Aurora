//
//  DFGlobalVar.h
//  Aurora
//
//  Created by David on 14-4-3.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DFUser.h"

@interface DFGlobalVar : NSObject{
    DFUser * user;
}
@property(strong,nonatomic)DFUser * user;
+(DFGlobalVar *)sharedGlobalVar;

@end
