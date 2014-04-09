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
    return copy;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.userName forKey:kUserUserNameKey];
    [aCoder encodeObject:self.nibName forKey:kUserNibNameKey];
    [aCoder encodeObject:self.password forKey:kUserPasswordKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        _userName = [aDecoder decodeObjectForKey:kUserUserNameKey];
        _nibName = [aDecoder decodeObjectForKey:kUserNibNameKey];
        _password = [aDecoder decodeObjectForKey:kUserPasswordKey];
    }
    return self;
}

@end
