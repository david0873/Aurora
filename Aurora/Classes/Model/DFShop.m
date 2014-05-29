//
//  DFShop.m
//  Aurora
//
//  Created by David on 14-4-11.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFShop.h"

@implementation DFShop

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }

    self.shopId = [attributes valueForKeyPath:kShopShopIdKey];
    self.shopName = [attributes valueForKeyPath:kShopShopNameKey];
    self.shopType = [attributes valueForKeyPath:kShopTypeKey];
//    self.shopImage = [attributes valueForKeyPath:kShopShopImageKey];
    self.workStartTime = [attributes valueForKeyPath:kShopWorkStartTimeKey];
    self.workEndTime = [attributes valueForKeyPath:kShopWorkEndTimeKey];
    self.address = [attributes valueForKeyPath:kShopAddressKey];
    self.avgConsume = [attributes valueForKeyPath:kShopAvgConsumeKey];
//    self.desc = [attributes valueForKeyPath:kShopDescKey];
    self.hiDegree = (NSInteger)[[attributes valueForKeyPath:kShopHiDegreekey]integerValue];
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    DFShop * copy = [[DFShop allocWithZone:zone]init];
    [copy setShopImage:[self.shopImage copyWithZone:zone]];
    [copy setShopId:[self.shopId copyWithZone:zone]];
    [copy setShopName:[self.shopName copyWithZone:zone]];
    [copy setShopType:[self.shopType copyWithZone:zone]];
    [copy setWorkStartTime:[self.workStartTime copyWithZone:zone]];
    [copy setWorkEndTime:[self.workEndTime copyWithZone:zone]];
    [copy setAddress:[self.address copyWithZone:zone]];
    [copy setAvgConsume:[self.avgConsume copyWithZone:zone]];
//    [copy setDesc:[self.desc copyWithZone:zone]];
    copy.hiDegree = self.hiDegree;
    return copy;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.shopImage forKey:kShopShopImageKey];
    [aCoder encodeObject:self.shopId forKey:kShopShopIdKey];
    [aCoder encodeObject:self.shopName forKey:kShopShopNameKey];
    [aCoder encodeObject:self.shopType forKey:kShopTypeKey];
    [aCoder encodeObject:self.workStartTime forKey:kShopWorkStartTimeKey];
    [aCoder encodeObject:self.workEndTime forKey:kShopWorkEndTimeKey];
    [aCoder encodeObject:self.address forKey:kShopAddressKey];
    [aCoder encodeObject:self.avgConsume forKey:kShopAvgConsumeKey];
//    [aCoder encodeObject:self.desc forKey:kShopDescKey];
    [aCoder encodeInt:self.hiDegree forKey:kShopHiDegreekey];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.shopId = [aDecoder decodeObjectForKey:kShopShopIdKey];
        self.shopName = [aDecoder decodeObjectForKey:kShopShopNameKey];
        self.shopType = [aDecoder decodeObjectForKey:kShopTypeKey];
        self.shopImage = [aDecoder decodeObjectForKey:kShopShopImageKey];
        self.workStartTime = [aDecoder decodeObjectForKey:kShopWorkStartTimeKey];
        self.workStartTime = [aDecoder decodeObjectForKey:kShopWorkEndTimeKey];
        self.address = [aDecoder decodeObjectForKey:kShopAddressKey];
        self.avgConsume = [aDecoder decodeObjectForKey:kShopAvgConsumeKey];
//        self.desc = [aDecoder decodeObjectForKey:kShopDescKey];
        self.hiDegree = [aDecoder decodeIntForKey:kShopHiDegreekey];
    }
    return self;
}

@end
