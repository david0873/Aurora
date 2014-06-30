//
//  DFMessage.m
//  Aurora
//
//  Created by yubiao on 14-5-9.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFMessage.h"

@implementation DFMessage


- (id)copyWithZone:(NSZone *)zone{

    DFMessage * copy = [[DFMessage allocWithZone:zone]init];
    [copy setMessageId:[self.messageId copyWithZone:zone]];
    [copy setUserId:[self.userId copyWithZone:zone]];
    [copy setMessage:[self.message copyWithZone:zone]];
    [copy setShopName:[self.shopName copyWithZone:zone]];
    
    return copy;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.messageId forKey:kMsgMessageIdKey];
    [aCoder encodeObject:self.userId forKey:kMsgUserIdKey];
    [aCoder encodeObject:self.message forKey:kMsgMessageKey];
    [aCoder encodeObject:self.shopName forKey:kMsgShopNameKey];
    
}


- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        _messageId = [aDecoder decodeObjectForKey:kMsgMessageIdKey];
        _userId = [aDecoder decodeObjectForKey:kMsgUserIdKey];
        _message = [aDecoder decodeObjectForKey:kMsgMessageKey];
        _shopName = [aDecoder decodeObjectForKey:kMsgShopNameKey];
    }
    return self;
}








@end
