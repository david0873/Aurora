//
//  DFMessage.h
//  Aurora
//
//  Created by yubiao on 14-5-9.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kMsgMessageIdKey            @"MessageId"
#define kMsgUserIdKey               @"UserId"
#define kMsgMessageKey              @"Message"


@interface DFMessage : NSObject<NSCopying, NSCoding>

@property (nonatomic, copy) NSString * messageId;
@property (nonatomic, copy) NSString * userId;
@property (nonatomic, copy) NSString * message;




@end
