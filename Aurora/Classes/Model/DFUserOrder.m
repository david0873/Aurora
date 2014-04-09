//
//  DFUserOrder.m
//  Aurora
//
//  Created by David on 14-4-4.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFUserOrder.h"

@implementation DFUserOrder

- (id)copyWithZone:(NSZone *)zone{
    DFUserOrder * copy = [[DFUserOrder allocWithZone:zone]init];
    copy.number = self.number;
    copy.identification = self.identification;
    copy.orderStatus = self.orderStatus;
    [copy setSeatType:[self.seatType copyWithZone:zone]];
    [copy setUser:[self.user copyWithZone:zone]];
    [copy setOrderId:[self.orderId copyWithZone:zone]];
    [copy setShopName:[self.shopName copyWithZone:zone]];
    [copy setStartTime:[self.startTime copyWithZone:zone]];
    [copy setEndTime:[self.endTime copyWithZone:zone]];
    [copy setRemarks:[self.remarks copyWithZone:zone]];
    [copy setAddition:[self.addition copyWithZone:zone]];
    return copy;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInt:self.number forKey:kUserOrderNumberKey];
    [aCoder encodeInt:self.identification forKey:kUserOrderIdentificationKey];
    [aCoder encodeBool:self.orderStatus forKey:kUserOrderOrderStatusKey];
    [aCoder encodeObject:self.seatType forKey:kUserOrderSeatTypeKey];
    [aCoder encodeObject:self.user forKey:KUserOrderUserKey];
    [aCoder encodeObject:self.orderId forKey:kUserOrderOrderIdKey];
    [aCoder encodeObject:self.shopName forKey:kUserOrderShopNameKey];
    [aCoder encodeObject:self.startTime forKey:kUserOrderStartTimeKey];
    [aCoder encodeObject:self.endTime forKey:kUserOrderEndTimeKey];
    [aCoder encodeObject:self.remarks forKey:kUserOrderRemarksKey];
    [aCoder encodeObject:self.addition forKey:kUserOrderAdditonKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        _number = [aDecoder decodeIntForKey:kUserOrderNumberKey];
        _identification = [aDecoder decodeIntForKey:kUserOrderIdentificationKey];
        _orderStatus = [aDecoder decodeBoolForKey:kUserOrderOrderStatusKey];
        _seatType = [aDecoder decodeObjectForKey:kUserOrderSeatTypeKey];
        _user = [aDecoder decodeObjectForKey:KUserOrderUserKey];
        _orderId = [aDecoder decodeObjectForKey:kUserOrderOrderIdKey];
        _shopName = [aDecoder decodeObjectForKey:kUserOrderShopNameKey];
        _startTime = [aDecoder decodeObjectForKey:kUserOrderStartTimeKey];
        _endTime = [aDecoder decodeObjectForKey:kUserOrderEndTimeKey];
        _remarks = [aDecoder decodeObjectForKey:kUserOrderRemarksKey];
        _addition = [aDecoder decodeObjectForKey:kUserOrderAdditonKey];
    }
    return self;
}

@end


