//
//  DFComment.m
//  Aurora
//
//  Created by yubiao on 14-5-9.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFComment.h"

@implementation DFComment

- (id) copyWithZone:(NSZone *)zone{
    DFComment * copy = [[DFComment allocWithZone:zone]init];
    [copy setCommentId:[self.commentId copyWithZone:zone]];
    [copy setShopId:[self.shopId copyWithZone:zone]];
    [copy setContent:[self.content copyWithZone:zone]];
    [copy setUser:[self.user copyWithZone:zone]];
    copy.hiDegree = self.hiDegree;
    return copy;
}

- (void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.commentId forKey:kCommentCommentIdKey];
    [aCoder encodeObject:self.shopId forKey:kCommentShopIdKey];
    [aCoder encodeObject:self.user forKey:kCommentUserKey];
    [aCoder encodeObject:self.content forKey:kCommentContentKey];
    [aCoder encodeInt:self.hiDegree forKey:kCommentHiDegreeKey];
}

- (id) initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        _commentId = [aDecoder decodeObjectForKey:kCommentCommentIdKey];
        _shopId = [aDecoder decodeObjectForKey:kCommentShopIdKey];
        _user = [aDecoder decodeObjectForKey:kCommentUserKey];
        _content = [aDecoder decodeObjectForKey:kCommentContentKey];
        _hiDegree = [aDecoder decodeIntForKey:kCommentHiDegreeKey];
    }
    return self;
}

@end
