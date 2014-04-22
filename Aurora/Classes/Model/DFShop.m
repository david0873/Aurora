//
//  DFShop.m
//  Aurora
//
//  Created by David on 14-4-11.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFShop.h"

@implementation DFShop

- (id)copyWithZone:(NSZone *)zone{
    DFShop * copy = [[DFShop allocWithZone:zone]init];
    [copy setShopImage:[self.shopImage copyWithZone:zone]];
    [copy setShopName:[self.shopName copyWithZone:zone]];
    [copy setWorkTime:[self.workTime copyWithZone:zone]];
    [copy setAddress:[self.address copyWithZone:zone]];
    [copy setDesc:[self.desc copyWithZone:zone]];
    copy.hiDegree = self.hiDegree;
    return copy;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.shopImage forKey:kShopShopImageKey];
    [aCoder encodeObject:self.shopName forKey:kShopShopNameKey];
    [aCoder encodeObject:self.workTime forKey:kShopWorkTimeKey];
    [aCoder encodeObject:self.address forKey:kShopAddressKey];
    [aCoder encodeObject:self.desc forKey:kShopDescKey];
    [aCoder encodeInt:self.hiDegree forKey:kShopHiDegreekey];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        _shopName = [aDecoder decodeObjectForKey:kShopShopNameKey];
        _shopImage = [aDecoder decodeObjectForKey:kShopShopImageKey];
        _workTime = [aDecoder decodeObjectForKey:kShopWorkTimeKey];
        _address = [aDecoder decodeObjectForKey:kShopAddressKey];
        _desc = [aDecoder decodeObjectForKey:kShopDescKey];
        _hiDegree = [aDecoder decodeIntForKey:kShopHiDegreekey];
    }
    return self;
}

@end
