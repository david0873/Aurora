//
//  DFUser.m
//  Aurora
//
//  Created by David on 14-4-8.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFUser.h"

@implementation DFUser

- (id)copyWithZone:(NSZone *)zone{
    DFUser * copy = [[DFUser allocWithZone:zone]init];
    [copy setUserName:[self.userName copyWithZone:zone]];
    [copy setNibName:[self.nibName copyWithZone:zone]];
    [copy setPassword:[self.password copyWithZone:zone]];
    [copy setUserId:[self.userId copyWithZone:zone]];
    [copy setShopIds:[self.shopIds copyWithZone:zone]];
    return copy;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.userName forKey:kUserUserNameKey];
    [aCoder encodeObject:self.nibName forKey:kUserNibNameKey];
    [aCoder encodeObject:self.password forKey:kUserPasswordKey];
    [aCoder encodeObject:self.userId forKey:kUserUserIdKey];
    [aCoder encodeObject:self.shopIds forKey:kUserShopIdsKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        _userName = [aDecoder decodeObjectForKey:kUserUserNameKey];
        _nibName = [aDecoder decodeObjectForKey:kUserNibNameKey];
        _password = [aDecoder decodeObjectForKey:kUserPasswordKey];
        _userId = [aDecoder decodeObjectForKey:kUserUserIdKey];
        _shopIds = [aDecoder decodeObjectForKey:kUserShopIdsKey];
    }
    return self;
}

@end
